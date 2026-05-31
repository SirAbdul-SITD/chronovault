import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/app_theme.dart';
import '../../engine/vault_controller.dart';
import '../widgets/animated_bg.dart';
import '../widgets/gold_button.dart';
import 'level_select_screen.dart';
import 'settings_screen.dart';
import 'tutorial_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseCtrl;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: true);
    _pulse = CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pulseCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vc = context.watch<VaultController>();
    final total = vc.totalStars;
    final max = vc.allRounds.length * 3;

    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                const SizedBox(height: 32),
                // Logo
                AnimatedBuilder(
                  animation: _pulse,
                  builder: (_, __) => Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.goldPrime
                            .withOpacity(0.4 + 0.3 * _pulse.value),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.goldPrime
                              .withOpacity(0.08 + 0.1 * _pulse.value),
                          blurRadius: 24 + 10 * _pulse.value,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.lock_clock_rounded,
                        color: AppTheme.goldLight, size: 44),
                  ),
                ),
                const SizedBox(height: 16),
                Text('CHRONOVAULT', style: AppTheme.displayTitle(size: 24)),
                const SizedBox(height: 4),
                Text(
                  'SORT HISTORY. BEAT THE CLOCK.',
                  style: AppTheme.label(size: 10, color: AppTheme.inkMid),
                ),
                const SizedBox(height: 16),
                // Stars tally
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: AppTheme.cardDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded,
                          color: AppTheme.goldLight, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        '$total / $max Stars',
                        style: AppTheme.body(
                            size: 14, color: AppTheme.inkLight),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Buttons
                GoldButton(
                  label: 'PLAY',
                  icon: Icons.play_arrow_rounded,
                  width: double.infinity,
                  height: 58,
                  fontSize: 16,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const LevelSelectScreen()),
                  ),
                ),
                const SizedBox(height: 14),
                GoldButton(
                  label: 'HOW TO PLAY',
                  icon: Icons.help_outline_rounded,
                  width: double.infinity,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const TutorialScreen()),
                  ),
                ),
                const SizedBox(height: 14),
                OutlineButton(
                  label: 'SETTINGS',
                  width: double.infinity,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SettingsScreen()),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
