import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_theme.dart';
import '../../engine/vault_controller.dart';
import '../../data/vault_entries.dart';
import '../widgets/animated_bg.dart';
import '../widgets/star_row.dart';
import 'game_screen.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen({Key? key}) : super(key: key);

  static const _tierColors = [
    AppTheme.accentTeal,
    AppTheme.goldPrime,
    Color(0xFFE87D3E),
    AppTheme.accentRed,
  ];

  @override
  Widget build(BuildContext context) {
    final vc = context.watch<VaultController>();

    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.inkMid, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text('SELECT ROUND',
                          textAlign: TextAlign.center,
                          style: AppTheme.heading(size: 16, color: AppTheme.goldPrime)),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              // Tier legend
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: Wrap(
                  spacing: 12,
                  children: List.generate(4, (i) {
                    final labels = ['Apprentice', 'Scholar', 'Historian', 'Grandmaster'];
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(width: 10, height: 10,
                            decoration: BoxDecoration(
                                color: _tierColors[i], shape: BoxShape.circle)),
                        const SizedBox(width: 4),
                        Text(labels[i], style: AppTheme.label(size: 9, color: AppTheme.inkMid)),
                      ],
                    );
                  }),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: kVaultRounds.length,
                  itemBuilder: (ctx, idx) {
                    final round = kVaultRounds[idx];
                    final unlocked = vc.isUnlocked(round.id);
                    final stars = vc.starsFor(round.id);
                    final tierColor = _tierColors[(round.tier - 1).clamp(0, 3)];

                    return GestureDetector(
                      onTap: unlocked
                          ? () => Navigator.push(
                                ctx,
                                MaterialPageRoute(
                                    builder: (_) => GameScreen(roundId: round.id)),
                              )
                          : null,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: unlocked ? 1.0 : 0.45,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.bgCard,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: stars > 0
                                  ? tierColor.withOpacity(0.5)
                                  : AppTheme.goldDim.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Round number
                              Text(
                                '${round.id}',
                                style: AppTheme.number(
                                    size: 26,
                                    color: unlocked ? tierColor : AppTheme.inkFaint),
                              ),
                              const SizedBox(height: 4),
                              // Category
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  round.category,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.label(
                                      size: 8,
                                      color: unlocked
                                          ? AppTheme.inkMid
                                          : AppTheme.inkFaint),
                                ),
                              ),
                              const SizedBox(height: 6),
                              if (!unlocked)
                                const Icon(Icons.lock_rounded,
                                    color: AppTheme.inkFaint, size: 16)
                              else
                                StarRow(filled: stars, size: 14),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
