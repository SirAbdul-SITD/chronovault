import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class VaultBgPainter extends CustomPainter {
  final double animValue;
  final List<_Star> stars;

  VaultBgPainter({required this.animValue, required this.stars});

  @override
  void paint(Canvas canvas, Size size) {
    // Base gradient
    final bg = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF050C18),
          Color(0xFF090E1A),
          Color(0xFF0C1420),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bg);

    // Subtle radial glow center-top
    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          AppTheme.goldPrime.withOpacity(0.06),
          Colors.transparent,
        ],
        radius: 0.8,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), glowPaint);

    // Twinkle stars
    final starPaint = Paint()..style = PaintingStyle.fill;
    for (final s in stars) {
      final twinkle = 0.4 + 0.6 * sin(animValue * 2 * pi * s.speed + s.phase);
      final x = s.x * size.width;
      final y = s.y * size.height;
      starPaint.color = AppTheme.goldLight.withOpacity(twinkle * s.opacity);
      canvas.drawCircle(Offset(x, y), s.radius, starPaint);
    }

    // Horizontal rule lines (subtle grid feel)
    final linePaint = Paint()
      ..color = AppTheme.goldDim.withOpacity(0.06)
      ..strokeWidth = 0.5;
    for (var i = 0; i < 8; i++) {
      final y = (i + 1) * size.height / 9;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }
  }

  @override
  bool shouldRepaint(VaultBgPainter old) => old.animValue != animValue;
}

class _Star {
  final double x, y, radius, opacity, speed, phase;
  const _Star(this.x, this.y, this.radius, this.opacity, this.speed, this.phase);
}

List<_Star> generateStars(int count, {int seed = 42}) {
  final rng = Random(seed);
  return List.generate(count, (_) => _Star(
    rng.nextDouble(),
    rng.nextDouble(),
    rng.nextDouble() * 1.2 + 0.3,
    rng.nextDouble() * 0.5 + 0.1,
    rng.nextDouble() * 0.4 + 0.1,
    rng.nextDouble() * 2 * pi,
  ));
}
