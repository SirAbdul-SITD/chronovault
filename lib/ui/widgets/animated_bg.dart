import 'package:flutter/material.dart';
import '../painters/vault_bg_painter.dart';

export '../painters/vault_bg_painter.dart' show generateStars;

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late final _stars;

  @override
  void initState() {
    super.initState();

    _stars = generateStars(60);

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (_, __) {
        return CustomPaint(
          painter: VaultBgPainter(
            animValue: _ctrl.value,
            stars: _stars,
          ),
          child: widget.child,
        );
      },
    );
  }
}