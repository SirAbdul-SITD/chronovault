import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class GoldButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final double? width;
  final double height;
  final double fontSize;
  final IconData? icon;

  const GoldButton({
    Key? key,
    required this.label,
    this.onTap,
    this.width,
    this.height = 52,
    this.fontSize = 14,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: AppTheme.goldButton(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppTheme.bgDeep, size: 18),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: AppTheme.heading(size: fontSize, color: AppTheme.bgDeep),
            ),
          ],
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final double? width;

  const OutlineButton({Key? key, required this.label, this.onTap, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.goldDim, width: 1.5),
          color: Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(label, style: AppTheme.heading(size: 14, color: AppTheme.inkMid)),
      ),
    );
  }
}
