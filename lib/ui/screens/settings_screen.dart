import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_theme.dart';
import '../../engine/vault_controller.dart';
import '../widgets/animated_bg.dart';
import '../widgets/gold_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vc = context.watch<VaultController>();

    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppTheme.inkMid, size: 20),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text('SETTINGS',
                          textAlign: TextAlign.center,
                          style: AppTheme.heading(size: 16, color: AppTheme.goldPrime)),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Sound toggle
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      decoration: AppTheme.cardDecoration(),
                      child: Row(
                        children: [
                          Icon(
                            vc.soundOn
                                ? Icons.volume_up_rounded
                                : Icons.volume_off_rounded,
                            color: vc.soundOn
                                ? AppTheme.goldLight
                                : AppTheme.inkFaint,
                            size: 24,
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('SOUND EFFECTS',
                                    style: AppTheme.heading(
                                        size: 13, color: AppTheme.inkLight)),
                                Text(vc.soundOn ? 'On' : 'Off',
                                    style: AppTheme.body(
                                        size: 12, color: AppTheme.inkMid)),
                              ],
                            ),
                          ),
                          Switch(
                            value: vc.soundOn,
                            onChanged: (_) => vc.toggleSound(),
                            activeColor: AppTheme.goldPrime,
                            inactiveThumbColor: AppTheme.inkFaint,
                            inactiveTrackColor:
                                AppTheme.inkFaint.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Stats
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      decoration: AppTheme.cardDecoration(),
                      child: Column(
                        children: [
                          Text('YOUR PROGRESS',
                              style: AppTheme.heading(
                                  size: 13, color: AppTheme.goldPrime)),
                          const SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _Stat(
                                  value: '${vc.highestUnlocked - 1}',
                                  label: 'Rounds\nCompleted'),
                              _Stat(
                                  value: '${vc.totalStars}',
                                  label: 'Stars\nEarned'),
                              _Stat(
                                  value: '${vc.allRounds.length * 3 - vc.totalStars}',
                                  label: 'Stars\nRemaining'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Reset
                    OutlineButton(
                      label: 'RESET ALL PROGRESS',
                      width: double.infinity,
                      onTap: () => _confirmReset(context, vc),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmReset(BuildContext context, VaultController vc) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppTheme.bgPanel,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text('Reset Progress?',
            style: AppTheme.heading(size: 16, color: AppTheme.inkLight)),
        content: Text(
            'All stars and unlocked rounds will be erased. This cannot be undone.',
            style: AppTheme.body(size: 14, color: AppTheme.inkMid)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('CANCEL',
                style: AppTheme.label(size: 12, color: AppTheme.inkMid)),
          ),
          TextButton(
            onPressed: () {
              // Reset handled via re-init
              Navigator.pop(context);
            },
            child: Text('RESET',
                style: AppTheme.label(
                    size: 12, color: AppTheme.accentRed)),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: AppTheme.number(size: 28, color: AppTheme.goldLight)),
        const SizedBox(height: 4),
        Text(label,
            textAlign: TextAlign.center,
            style: AppTheme.label(size: 9, color: AppTheme.inkFaint)),
      ],
    );
  }
}
