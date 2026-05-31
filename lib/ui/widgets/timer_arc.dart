import 'dart:math';
import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class TimerArc extends StatelessWidget {
  final int secondsLeft;
  final int totalSeconds;
  const TimerArc({Key? key, required this.secondsLeft, required this.totalSeconds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pct = totalSeconds > 0 ? secondsLeft / totalSeconds : 0.0;
    final isUrgent = pct < 0.30;
    final color = isUrgent ? AppTheme.accentRed : AppTheme.goldPrime;

    return SizedBox(
      width: 72,
      height: 72,
      child: CustomPaint(
        painter: _ArcPainter(pct: pct, color: color),
        child: Center(
          child: Text(
            '$secondsLeft',
            style: AppTheme.number(size: 20, color: isUrgent ? AppTheme.accentRed : AppTheme.goldLight),
          ),
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double pct;
  final Color color;
  const _ArcPainter({required this.pct, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = min(cx, cy) - 5;

    final trackPaint = Paint()
      ..color = AppTheme.inkFaint.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(cx, cy), r, trackPaint);

    final arcPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -pi / 2,
      2 * pi * pct,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(_ArcPainter old) => old.pct != pct || old.color != color;
}
