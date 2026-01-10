import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Countdown timer widget for game questions
/// Shows circular progress indicator with color changes based on time remaining
class QuestionTimer extends StatelessWidget {
  final int timeLeft;
  final int totalTime;
  final VoidCallback? onTimeUp;

  const QuestionTimer({
    super.key,
    required this.timeLeft,
    this.totalTime = 10,
    this.onTimeUp,
  });

  /// Timer size constant
  static const double timerSize = 60.0;

  Color get _timerColor {
    final percentage = timeLeft / totalTime;
    if (percentage > 0.5) {
      return const Color(0xFF22C55E); // Green
    } else if (percentage > 0.3) {
      return const Color(0xFFF59E0B); // Yellow/Orange
    } else {
      return const Color(0xFFEF4444); // Red
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = timeLeft / totalTime;

    return SizedBox(
      width: timerSize,
      height: timerSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          SizedBox(
            width: timerSize,
            height: timerSize,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 4,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.border.withValues(alpha: 0.3),
              ),
            ),
          ),
          // Progress circle
          SizedBox(
            width: timerSize,
            height: timerSize,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 4,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(_timerColor),
            ),
          ),
          // Time text
          Text(
            '$timeLeft',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _timerColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// Linear timer bar variant
class QuestionTimerBar extends StatelessWidget {
  final int timeLeft;
  final int totalTime;

  const QuestionTimerBar({
    super.key,
    required this.timeLeft,
    this.totalTime = 10,
  });

  Color get _timerColor {
    final percentage = timeLeft / totalTime;
    if (percentage > 0.5) {
      return const Color(0xFF22C55E); // Green
    } else if (percentage > 0.3) {
      return const Color(0xFFF59E0B); // Yellow/Orange
    } else {
      return const Color(0xFFEF4444); // Red
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = timeLeft / totalTime;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time: ${timeLeft}s',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _timerColor,
              ),
            ),
            Text(
              '${(percentage * 100).round()}%',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.border.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: _timerColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
