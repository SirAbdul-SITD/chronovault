import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class StarRow extends StatelessWidget {
  final int filled; // 0-3
  final double size;
  const StarRow({Key? key, required this.filled, this.size = 20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Icon(
          i < filled ? Icons.star_rounded : Icons.star_outline_rounded,
          color: i < filled ? AppTheme.goldLight : AppTheme.inkFaint,
          size: size,
        ),
      )),
    );
  }
}
