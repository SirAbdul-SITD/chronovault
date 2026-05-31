import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AudioEngine {
  static final AudioEngine _inst = AudioEngine._();
  factory AudioEngine() => _inst;
  AudioEngine._();

  bool _muted = false;
  bool get muted => _muted;

  AudioPlayer? _musicPlayer;
  final AudioPlayer _sfxPlayer = AudioPlayer();

  Future<void> init() async {
    final p = await SharedPreferences.getInstance();
    _muted = p.getBool('cv_muted') ?? false;
    _musicPlayer = AudioPlayer();
    await _musicPlayer!.setVolume(0.55);
    await _sfxPlayer.setVolume(0.75);
  }

  Future<void> toggleMute() async {
    _muted = !_muted;
    final p = await SharedPreferences.getInstance();
    await p.setBool('cv_muted', _muted);
    if (_muted) {
      await _musicPlayer?.stop();
    }
  }

  bool get soundOn => !_muted;

  // ── Music ─────────────────────────────────────────────────────────────────
  Future<void> playMenuMusic() async {
    if (_muted) return;
    await _musicPlayer?.stop();
    await _musicPlayer?.setReleaseMode(ReleaseMode.loop);
    await _musicPlayer?.play(AssetSource('sounds/music_vault_theme.wav'));
  }

  Future<void> playRoundMusic(int tier) async {
    if (_muted) return;
    await _musicPlayer?.stop();
    await _musicPlayer?.setReleaseMode(ReleaseMode.loop);
    final track = switch (tier) {
      1 => 'sounds/music_apprentice_flow.wav',
      2 => 'sounds/music_ancient_echoes.wav',
      3 => 'sounds/music_grandmaster.wav',
      4 => 'sounds/music_grandmaster.wav',
      _ => 'sounds/music_ancient_echoes.wav',
    };
    await _musicPlayer?.play(AssetSource(track));
  }

  Future<void> stopMusic() async {
    await _musicPlayer?.stop();
  }

  // ── SFX ───────────────────────────────────────────────────────────────────
  Future<void> _sfx(String name) async {
    if (_muted) return;
    try {
      await _sfxPlayer.stop();
      await _sfxPlayer.play(AssetSource('sounds/$name'));
    } catch (_) {}
  }

  Future<void> playPickup()  => _sfx('sfx_pickup.wav');
  Future<void> playDrop()    => _sfx('sfx_drop.wav');
  Future<void> playCorrect() => _sfx('sfx_correct.wav');
  Future<void> playWrong()   => _sfx('sfx_wrong.wav');
  Future<void> playWin()     => _sfx('sfx_win.wav');
  Future<void> playTick()    => _sfx('sfx_tick.wav');
  Future<void> playButton()  => _sfx('sfx_button.wav');
  Future<void> playUnlock()  => _sfx('sfx_unlock.wav');
  Future<void> playTimeout() => _sfx('sfx_timeout.wav');

  void dispose() {
    _musicPlayer?.dispose();
    _sfxPlayer.dispose();
  }
}
