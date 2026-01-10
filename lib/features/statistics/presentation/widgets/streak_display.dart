import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';

/// Streak widget showing fire icon with animation
class StreakDisplay extends StatelessWidget {
  final int streakDays;
  final List<bool> weekActivity; // 7 bools representing activity for last 7 days

  const StreakDisplay({
    super.key,
    required this.streakDays,
    this.weekActivity = const [false, false, false, false, false, false, false],
  });

  static const Color streakFireColor = Color(0xFFF59E0B);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            streakFireColor.withValues(alpha: 0.15),
            streakFireColor.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: streakFireColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          // Fire icon with animation
          _AnimatedFireIcon(streakDays: streakDays),
          const SizedBox(width: 16),
          // Streak text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '$streakDays',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: streakFireColor,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Day Streak',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Week activity dots
                _WeekActivityDots(weekActivity: weekActivity),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedFireIcon extends StatelessWidget {
  final int streakDays;

  const _AnimatedFireIcon({required this.streakDays});

  @override
  Widget build(BuildContext context) {
    final hasStreak = streakDays > 0;

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: hasStreak
            ? StreakDisplay.streakFireColor.withValues(alpha: 0.2)
            : AppColors.textSecondary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        boxShadow: hasStreak
            ? [
                BoxShadow(
                  color: StreakDisplay.streakFireColor.withValues(alpha: 0.3),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ]
            : null,
      ),
      child: Icon(
        Icons.local_fire_department,
        size: 36,
        color: hasStreak
            ? StreakDisplay.streakFireColor
            : AppColors.textSecondary.withValues(alpha: 0.5),
      ),
    )
        .animate(
          onPlay: (controller) => hasStreak ? controller.repeat() : null,
        )
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(1.1, 1.1),
          duration: 800.ms,
          curve: Curves.easeInOut,
        )
        .then()
        .scale(
          begin: const Offset(1.1, 1.1),
          end: const Offset(1, 1),
          duration: 800.ms,
          curve: Curves.easeInOut,
        );
  }
}

class _WeekActivityDots extends StatelessWidget {
  final List<bool> weekActivity;

  const _WeekActivityDots({required this.weekActivity});

  @override
  Widget build(BuildContext context) {
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final isActive = index < weekActivity.length && weekActivity[index];
        return _DayDot(
          label: weekDays[index],
          isActive: isActive,
          isToday: index == weekActivity.length - 1,
        );
      }),
    );
  }
}

class _DayDot extends StatelessWidget {
  final String label;
  final bool isActive;
  final bool isToday;

  const _DayDot({
    required this.label,
    required this.isActive,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isActive
                ? StreakDisplay.streakFireColor
                : AppColors.textSecondary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: isToday
                ? Border.all(
                    color: StreakDisplay.streakFireColor,
                    width: 2,
                  )
                : null,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                )
              : null,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: isActive
                ? StreakDisplay.streakFireColor
                : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
