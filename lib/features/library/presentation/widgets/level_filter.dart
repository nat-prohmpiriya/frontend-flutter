import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'story_card.dart';

/// Horizontal scrollable filter chips for CEFR levels
class LevelFilter extends StatelessWidget {
  const LevelFilter({
    super.key,
    required this.selectedLevel,
    required this.onLevelSelected,
  });

  final String? selectedLevel;
  final ValueChanged<String?> onLevelSelected;

  static const List<({String? value, String label})> levels = [
    (value: null, label: 'All'),
    (value: 'A1', label: 'A1'),
    (value: 'A2', label: 'A2'),
    (value: 'B1', label: 'B1'),
    (value: 'B2', label: 'B2'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: levels.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final level = levels[index];
          final isSelected = selectedLevel == level.value;

          return _LevelChip(
            label: level.label,
            isSelected: isSelected,
            isDark: isDark,
            levelValue: level.value,
            onTap: () => onLevelSelected(level.value),
          );
        },
      ),
    );
  }
}

class _LevelChip extends StatelessWidget {
  const _LevelChip({
    required this.label,
    required this.isSelected,
    required this.isDark,
    required this.levelValue,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool isDark;
  final String? levelValue;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Get the level color for selected state
    final levelColor = levelValue != null
        ? StoryCard.getLevelColor(levelValue!)
        : AppColors.primary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? levelColor
                : isDark
                    ? AppColors.darkSurface
                    : AppColors.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected
                  ? levelColor
                  : isDark
                      ? AppColors.darkBorder
                      : AppColors.border,
              width: 1.5,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: levelColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? Colors.white
                  : isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
