import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_theme.dart';
import '../../engine/vault_controller.dart';
import '../../engine/round_model.dart';
import '../widgets/animated_bg.dart';
import '../widgets/event_card.dart';
import '../widgets/timer_arc.dart';
import '../widgets/gold_button.dart';
import '../widgets/star_row.dart';

class GameScreen extends StatefulWidget {
  final int roundId;
  const GameScreen({Key? key, required this.roundId}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _resultCtrl;
  late Animation<double> _resultFade;
  late Animation<double> _resultScale;

  @override
  void initState() {
    super.initState();
    _resultCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _resultFade  = CurvedAnimation(parent: _resultCtrl, curve: Curves.easeOut);
    _resultScale = CurvedAnimation(parent: _resultCtrl, curve: Curves.elasticOut);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VaultController>().startRound(widget.roundId);
    });
  }

  @override
  void dispose() {
    _resultCtrl.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _onVCPhaseChange(RoundPhase phase) {
    if (phase == RoundPhase.won || phase == RoundPhase.lost) {
      _resultCtrl.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VaultController>(
      builder: (ctx, vc, _) {
        // Watch for phase changes
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if ((vc.phase == RoundPhase.won || vc.phase == RoundPhase.lost) &&
              !_resultCtrl.isAnimating && _resultCtrl.value == 0) {
            _resultCtrl.forward();
          }
        });

        final round = vc.activeRound;
        if (round == null) return const Scaffold(backgroundColor: AppTheme.bgDeep);

        return WillPopScope(
          onWillPop: () async {
            vc.resetToIdle();
            return true;
          },
          child: Scaffold(
            body: AnimatedBackground(
              child: SafeArea(
                child: Stack(
                  children: [
                    // Main content
                    Column(
                      children: [
                        _buildHeader(ctx, vc, round),
                        _buildCategoryBar(round),
                        const SizedBox(height: 6),
                        Expanded(child: _buildCardList(vc, round)),
                        if (vc.phase == RoundPhase.playing)
                          _buildSubmitBar(vc),
                      ],
                    ),
                    // Result overlay
                    if (vc.phase == RoundPhase.won || vc.phase == RoundPhase.lost)
                      _buildResultOverlay(ctx, vc, round),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext ctx, VaultController vc, VaultRound round) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 16, 0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded,
                color: AppTheme.inkMid, size: 20),
            onPressed: () {
              vc.resetToIdle();
              Navigator.pop(ctx);
            },
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ROUND ${round.id}',
                  style: AppTheme.label(size: 11, color: AppTheme.goldPrime),
                ),
                Text(
                  round.tierLabel,
                  style: AppTheme.label(size: 9, color: AppTheme.inkFaint),
                ),
              ],
            ),
          ),
          if (vc.phase == RoundPhase.playing)
            TimerArc(
                secondsLeft: vc.secondsLeft,
                totalSeconds: round.timeLimitSecs),
        ],
      ),
    );
  }

  Widget _buildCategoryBar(VaultRound round) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: AppTheme.cardDecoration(highlight: true),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CATEGORY', style: AppTheme.label(size: 9, color: AppTheme.inkFaint)),
            const SizedBox(height: 2),
            Text(round.category,
                style: AppTheme.heading(size: 15, color: AppTheme.inkLight)),
            const SizedBox(height: 4),
            Text(
              'Arrange all 6 events in chronological order (oldest → newest)',
              style: AppTheme.body(size: 11, color: AppTheme.inkMid),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardList(VaultController vc, VaultRound round) {
    final cards = vc.orderedCards;

    return ReorderableListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      physics: const BouncingScrollPhysics(),
      buildDefaultDragHandles: true,
      onReorder: vc.onReorder,
      proxyDecorator: (child, index, animation) => Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: animation.drive(Tween(begin: 1.0, end: 1.04)
              .chain(CurveTween(curve: Curves.easeOut))),
          child: child,
        ),
      ),
      itemCount: cards.length,
      itemBuilder: (ctx, idx) {
        return EventCard(
          key: ValueKey(cards[idx].label),
          event: cards[idx],
          position: idx,
        );
      },
    );
  }

  Widget _buildSubmitBar(VaultController vc) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: GoldButton(
        label: 'SUBMIT ORDER',
        icon: Icons.check_circle_outline_rounded,
        width: double.infinity,
        height: 56,
        fontSize: 15,
        onTap: vc.submitAnswer,
      ),
    );
  }

  Widget _buildResultOverlay(
      BuildContext ctx, VaultController vc, VaultRound round) {
    final won = vc.phase == RoundPhase.won;
    final stars = vc.lastStarsEarned ?? 0;

    // Build correct order for display
    final correctOrder = List<VaultEvent>.from(round.events)
      ..sort((a, b) => a.year.compareTo(b.year));

    return AnimatedBuilder(
      animation: _resultCtrl,
      builder: (_, __) => FadeTransition(
        opacity: _resultFade,
        child: Container(
          color: AppTheme.bgDeep.withOpacity(0.88),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Result badge
                ScaleTransition(
                  scale: _resultScale,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: won
                          ? AppTheme.accentGreen.withOpacity(0.12)
                          : AppTheme.accentRed.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: won ? AppTheme.accentGreen : AppTheme.accentRed,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          won
                              ? Icons.check_circle_rounded
                              : Icons.cancel_rounded,
                          color: won
                              ? AppTheme.accentGreen
                              : AppTheme.accentRed,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          won ? 'CORRECT ORDER!' : 'WRONG ORDER',
                          style: AppTheme.heading(
                              size: 14,
                              color: won
                                  ? AppTheme.accentGreen
                                  : AppTheme.accentRed),
                        ),
                      ],
                    ),
                  ),
                ),
                if (won) ...[
                  const SizedBox(height: 12),
                  StarRow(filled: stars, size: 28),
                  if (vc.isNewBest)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text('NEW BEST!',
                          style: AppTheme.label(
                              size: 10, color: AppTheme.goldLight)),
                    ),
                ],
                const SizedBox(height: 14),
                // Correct order list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    itemCount: correctOrder.length,
                    itemBuilder: (_, idx) {
                      return ResultCard(
                        event: correctOrder[idx],
                        correctPosition: idx,
                        wasCorrect: won,
                      );
                    },
                  ),
                ),
                // Buttons
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlineButton(
                          label: 'RETRY',
                          onTap: () {
                            _resultCtrl.value = 0;
                            vc.retryRound();
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GoldButton(
                          label: won ? 'NEXT ROUND' : 'LEVELS',
                          onTap: () {
                            vc.resetToIdle();
                            if (won &&
                                vc.highestUnlocked <=
                                    vc.allRounds.length) {
                              Navigator.of(ctx).pop();
                              // Push next round if available
                              final nextId = round.id + 1;
                              if (nextId <= vc.allRounds.length) {
                                Navigator.push(
                                  ctx,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          GameScreen(roundId: nextId)),
                                );
                              }
                            } else {
                              Navigator.of(ctx).pop();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
