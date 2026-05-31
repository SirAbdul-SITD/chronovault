import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<double> _scale;
  late Animation<double> _ringExpand;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));
    _fade  = CurvedAnimation(parent: _ctrl, curve: const Interval(0.0, 0.6, curve: Curves.easeIn));
    _scale = CurvedAnimation(parent: _ctrl, curve: const Interval(0.0, 0.7, curve: Curves.elasticOut));
    _ringExpand = CurvedAnimation(parent: _ctrl, curve: const Interval(0.3, 1.0, curve: Curves.easeOut));
    _ctrl.forward();
    Future.delayed(const Duration(milliseconds: 2600), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, a, __) => const HomeScreen(),
            transitionsBuilder: (_, a, __, child) =>
                FadeTransition(opacity: a, child: child),
            transitionDuration: const Duration(milliseconds: 600),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDeep,
      body: Center(
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => Stack(
            alignment: Alignment.center,
            children: [
              // Expanding ring
              Opacity(
                opacity: (1 - _ringExpand.value).clamp(0, 1),
                child: Container(
                  width: 160 + 120 * _ringExpand.value,
                  height: 160 + 120 * _ringExpand.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.goldPrime.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                ),
              ),
              // Logo
              FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _scale,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Vault icon
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppTheme.goldPrime.withOpacity(0.25),
                              Colors.transparent,
                            ],
                          ),
                          border: Border.all(color: AppTheme.goldPrime, width: 2),
                        ),
                        child: const Icon(
                          Icons.lock_clock_rounded,
                          color: AppTheme.goldLight,
                          size: 48,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'CHRONOVAULT',
                        style: TextStyle(fontFamily: 'CinzelDecorative', 
                          fontSize: 26,
                          color: AppTheme.goldPrime,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'SORT HISTORY. BEAT THE CLOCK.',
                        style: AppTheme.label(size: 10, color: AppTheme.inkMid),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
