import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Compact stat card showing icon, value, label, and optional trend
class SummaryCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final String? trend;
  final bool showTrendUp;

  const SummaryCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    this.trend,
    this.showTrendUp = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon container
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 18,
              color: color,
            ),
          ),
          // Value and trend row
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (trend != null) ...[
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: showTrendUp
                        ? AppColors.success.withValues(alpha: 0.1)
                        : AppColors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        showTrendUp
                            ? Icons.trending_up
                            : Icons.trending_down,
                        size: 10,
                        color: showTrendUp ? AppColors.success : AppColors.error,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        trend!,
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          color: showTrendUp ? AppColors.success : AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// Factory methods for common summary cards
class SummaryCards {
  SummaryCards._();

  static SummaryCard storiesRead({
    required int count,
    String? trend,
  }) {
    return SummaryCard(
      icon: Icons.menu_book,
      value: count.toString(),
      label: 'Stories Read',
      color: AppColors.primary,
      trend: trend,
    );
  }

  static SummaryCard wordsLearned({
    required int count,
    String? trend,
  }) {
    return SummaryCard(
      icon: Icons.school,
      value: count.toString(),
      label: 'Words Learned',
      color: AppColors.secondary,
      trend: trend,
    );
  }

  static SummaryCard totalReadingTime({
    required int minutes,
    String? trend,
  }) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    final display = hours > 0 ? '${hours}h ${mins}m' : '${mins}m';

    return SummaryCard(
      icon: Icons.timer,
      value: display,
      label: 'Reading Time',
      color: AppColors.purple,
      trend: trend,
    );
  }

  static SummaryCard quizzesTaken({
    required int count,
    String? trend,
  }) {
    return SummaryCard(
      icon: Icons.quiz,
      value: count.toString(),
      label: 'Quizzes Taken',
      color: AppColors.orange,
      trend: trend,
    );
  }
}
