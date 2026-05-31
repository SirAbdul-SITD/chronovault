import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'round_model.dart';
import '../data/vault_entries.dart';
import '../core/audio_engine.dart';

enum RoundPhase { idle, playing, checking, won, lost }

class VaultController extends ChangeNotifier {
  late SharedPreferences _prefs;
  static const String _keyStars    = 'cv_stars_';
  static const String _keyUnlocked = 'cv_unlocked';
  // ignore: unused_field
  static const String _keyMuted    = 'cv_muted';

  int _highestUnlocked = 1;
  int get highestUnlocked => _highestUnlocked;

  Map<int, int> _starsMap = {};
  int starsFor(int id) => _starsMap[id] ?? 0;
  int get totalStars => _starsMap.values.fold(0, (a, b) => a + b);

  bool get soundOn => !AudioEngine().muted;

  VaultRound? _activeRound;
  VaultRound? get activeRound => _activeRound;

  List<VaultEvent> _orderedCards = [];
  List<VaultEvent> get orderedCards => List.unmodifiable(_orderedCards);

  RoundPhase _phase = RoundPhase.idle;
  RoundPhase get phase => _phase;

  int _secondsLeft = 0;
  int get secondsLeft => _secondsLeft;
  Timer? _timer;

  bool _lastAnswerCorrect = false;
  bool get lastAnswerCorrect => _lastAnswerCorrect;

  int? _lastStarsEarned;
  int? get lastStarsEarned => _lastStarsEarned;

  bool _isNewBest = false;
  bool get isNewBest => _isNewBest;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _highestUnlocked = _prefs.getInt(_keyUnlocked) ?? 1;
    await AudioEngine().init();
    for (final r in kVaultRounds) {
      final s = _prefs.getInt('$_keyStars${r.id}');
      if (s != null) _starsMap[r.id] = s;
    }
  }

  List<VaultRound> get allRounds => kVaultRounds;
  bool isUnlocked(int id) => id <= _highestUnlocked;

  void startRound(int roundId) {
    _activeRound = kVaultRounds.firstWhere((r) => r.id == roundId);
    _orderedCards = List.from(_activeRound!.events)..shuffle(Random());
    _secondsLeft = _activeRound!.timeLimitSecs;
    _phase = RoundPhase.playing;
    _lastStarsEarned = null;
    _isNewBest = false;
    AudioEngine().playRoundMusic(_activeRound!.tier);
    _startTimer();
    notifyListeners();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_secondsLeft > 0) {
        _secondsLeft--;
        if (_secondsLeft <= 10) AudioEngine().playTick();
        notifyListeners();
      } else {
        _timer?.cancel();
        AudioEngine().playTimeout();
        AudioEngine().stopMusic();
        _phase = RoundPhase.lost;
        _lastAnswerCorrect = false;
        notifyListeners();
      }
    });
  }

  void onReorder(int oldIndex, int newIndex) {
    if (_phase != RoundPhase.playing) return;
    if (newIndex > oldIndex) newIndex--;
    final item = _orderedCards.removeAt(oldIndex);
    _orderedCards.insert(newIndex, item);
    AudioEngine().playDrop();
    notifyListeners();
  }

  void submitAnswer() {
    if (_phase != RoundPhase.playing || _activeRound == null) return;
    _timer?.cancel();
    _phase = RoundPhase.checking;
    notifyListeners();

    final correct = _isOrderCorrect();
    _lastAnswerCorrect = correct;

    if (correct) {
      final timeUsed = _activeRound!.timeLimitSecs - _secondsLeft;
      final pct = timeUsed / _activeRound!.timeLimitSecs;
      final stars = pct < 0.40 ? 3 : (pct < 0.70 ? 2 : 1);
      _lastStarsEarned = stars;

      final prev = _starsMap[_activeRound!.id] ?? 0;
      _isNewBest = stars > prev;
      if (_isNewBest || prev == 0) {
        _starsMap[_activeRound!.id] = stars;
        _prefs.setInt('$_keyStars${_activeRound!.id}', stars);
      }
      final nextId = _activeRound!.id + 1;
      if (nextId > _highestUnlocked && nextId <= kVaultRounds.length) {
        _highestUnlocked = nextId;
        _prefs.setInt(_keyUnlocked, _highestUnlocked);
        AudioEngine().playUnlock();
      } else {
        AudioEngine().playWin();
      }
      _phase = RoundPhase.won;
    } else {
      AudioEngine().playWrong();
      _lastStarsEarned = 0;
      _phase = RoundPhase.lost;
    }
    AudioEngine().stopMusic();
    notifyListeners();
  }

  bool _isOrderCorrect() {
    for (var i = 0; i < _orderedCards.length - 1; i++) {
      if (_orderedCards[i].year > _orderedCards[i + 1].year) return false;
    }
    return true;
  }

  void resetToIdle() {
    _timer?.cancel();
    AudioEngine().stopMusic();
    _phase = RoundPhase.idle;
    _activeRound = null;
    notifyListeners();
  }

  void retryRound() {
    if (_activeRound == null) return;
    startRound(_activeRound!.id);
  }

  void toggleSound() {
    AudioEngine().toggleMute();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    AudioEngine().dispose();
    super.dispose();
  }
}
