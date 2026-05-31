import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../engine/round_model.dart';

class EventCard extends StatelessWidget {
  final VaultEvent event;
  final int position;
  final bool isDragging;
  final bool showYear; // revealed after result

  const EventCard({
    Key? key,
    required this.event,
    required this.position,
    this.isDragging = false,
    this.showYear = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      decoration: BoxDecoration(
        color: isDragging ? AppTheme.bgPanel : AppTheme.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDragging
              ? AppTheme.goldPrime
              : AppTheme.goldDim.withOpacity(0.3),
          width: isDragging ? 1.8 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: isDragging
                ? AppTheme.goldPrime.withOpacity(0.25)
                : Colors.black.withOpacity(0.4),
            blurRadius: isDragging ? 18 : 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            // Position badge
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.bgPanel,
                border: Border.all(color: AppTheme.goldDim, width: 1),
              ),
              alignment: Alignment.center,
              child: Text(
                '${position + 1}',
                style: AppTheme.label(size: 11, color: AppTheme.goldPrime),
              ),
            ),
            const SizedBox(width: 12),
            // Event text
            Expanded(
              child: Text(
                event.label,
                style: AppTheme.body(size: 13.5, color: AppTheme.inkLight),
              ),
            ),
            const SizedBox(width: 8),
            // Year chip (if revealed)
            if (showYear)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.bgDeep,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppTheme.goldDim.withOpacity(0.5)),
                ),
                child: Text(
                  event.displayYear,
                  style: AppTheme.label(size: 10, color: AppTheme.goldLight),
                ),
              )
            else
              // Drag handle
              Icon(Icons.drag_handle_rounded,
                  color: AppTheme.inkFaint.withOpacity(0.6), size: 20),
          ],
        ),
      ),
    );
  }
}

/// Highlighted version for result reveal (correct=green, wrong=red)
class ResultCard extends StatelessWidget {
  final VaultEvent event;
  final int correctPosition;
  final bool wasCorrect;

  const ResultCard({
    Key? key,
    required this.event,
    required this.correctPosition,
    required this.wasCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = wasCorrect ? AppTheme.accentGreen : AppTheme.accentRed;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: borderColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor.withOpacity(0.5), width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        child: Row(
          children: [
            Icon(
              wasCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded,
              color: borderColor,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                event.label,
                style: AppTheme.body(size: 13, color: AppTheme.inkLight),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.bgDeep,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                event.displayYear,
                style: AppTheme.label(size: 10, color: AppTheme.goldLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
