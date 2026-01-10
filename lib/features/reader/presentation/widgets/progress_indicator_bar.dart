import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Progress indicator showing reading progress for episode and page
class ProgressIndicatorBar extends StatelessWidget {
  final int currentEpisode;
  final int totalEpisodes;
  final int currentPage;
  final int totalPages;
  final bool showLabels;
  final bool compact;

  const ProgressIndicatorBar({
    super.key,
    required this.currentEpisode,
    required this.totalEpisodes,
    required this.currentPage,
    required this.totalPages,
    this.showLabels = true,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return _buildCompactProgress(context);
    }

    return _buildFullProgress(context);
  }

  Widget _buildCompactProgress(BuildContext context) {
    final episodeProgress = totalEpisodes > 0
        ? ((currentEpisode - 1) + (currentPage / totalPages)) / totalEpisodes
        : 0.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Single progress bar
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: episodeProgress.clamp(0.0, 1.0),
            backgroundColor: AppColors.border,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 6,
          ),
        ),
        if (showLabels) ...[
          const SizedBox(height: 4),
          Text(
            'Ep $currentEpisode/$totalEpisodes - Page $currentPage/$totalPages',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildFullProgress(BuildContext context) {
    final pageProgress = totalPages > 0 ? currentPage / totalPages : 0.0;
    final episodeProgress = totalEpisodes > 0 ? currentEpisode / totalEpisodes : 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkSurface
            : AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkBorder
              : AppColors.border,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Episode progress
          _buildProgressRow(
            context,
            label: 'Episode',
            current: currentEpisode,
            total: totalEpisodes,
            progress: episodeProgress,
            color: AppColors.primary,
          ),

          const SizedBox(height: 12),

          // Page progress
          _buildProgressRow(
            context,
            label: 'Page',
            current: currentPage,
            total: totalPages,
            progress: pageProgress,
            color: AppColors.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressRow(
    BuildContext context, {
    required String label,
    required int current,
    required int total,
    required double progress,
    required Color color,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(
              '$current of $total',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            backgroundColor:
                isDark ? AppColors.darkBorder : AppColors.background,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}

/// Circular progress indicator for story completion
class CircularProgressWidget extends StatelessWidget {
  final double progress;
  final double size;
  final double strokeWidth;
  final Color? backgroundColor;
  final Color? progressColor;
  final Widget? child;

  const CircularProgressWidget({
    super.key,
    required this.progress,
    this.size = 48,
    this.strokeWidth = 4,
    this.backgroundColor,
    this.progressColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          CircularProgressIndicator(
            value: 1.0,
            strokeWidth: strokeWidth,
            color:
                backgroundColor ?? (isDark ? AppColors.darkBorder : AppColors.border),
          ),

          // Progress circle
          CircularProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            strokeWidth: strokeWidth,
            color: progressColor ?? AppColors.primary,
          ),

          // Child (e.g., percentage text)
          if (child != null) child!,
        ],
      ),
    );
  }
}

/// Dot-based page indicator
class DotPageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int maxVisibleDots;
  final double dotSize;
  final double spacing;
  final Color? activeColor;
  final Color? inactiveColor;

  const DotPageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.maxVisibleDots = 7,
    this.dotSize = 8,
    this.spacing = 6,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 0) return const SizedBox.shrink();

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final active = activeColor ?? AppColors.primary;
    final inactive = inactiveColor ??
        (isDark ? AppColors.darkBorder : AppColors.border);

    // For many pages, show a subset of dots with current page indicator
    if (totalPages > maxVisibleDots) {
      return _buildScrollingDots(context, active, inactive);
    }

    // For few pages, show all dots
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalPages, (index) {
        final isActive = index == currentPage - 1;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: isActive ? dotSize * 2 : dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: isActive ? active : inactive,
            borderRadius: BorderRadius.circular(dotSize / 2),
          ),
        );
      }),
    );
  }

  Widget _buildScrollingDots(
      BuildContext context, Color active, Color inactive) {
    // Calculate visible range
    final halfVisible = maxVisibleDots ~/ 2;
    int startIndex = currentPage - 1 - halfVisible;
    int endIndex = currentPage - 1 + halfVisible;

    // Adjust for boundaries
    if (startIndex < 0) {
      endIndex -= startIndex;
      startIndex = 0;
    }
    if (endIndex >= totalPages) {
      startIndex -= (endIndex - totalPages + 1);
      endIndex = totalPages - 1;
    }
    startIndex = startIndex.clamp(0, totalPages - 1);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Show ellipsis if not at start
        if (startIndex > 0) ...[
          Container(
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: inactive,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '...',
            style: TextStyle(color: inactive, fontSize: 10),
          ),
          const SizedBox(width: 4),
        ],

        // Visible dots
        ...List.generate(endIndex - startIndex + 1, (i) {
          final index = startIndex + i;
          final isActive = index == currentPage - 1;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.symmetric(horizontal: spacing / 2),
            width: isActive ? dotSize * 2 : dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: isActive ? active : inactive,
              borderRadius: BorderRadius.circular(dotSize / 2),
            ),
          );
        }),

        // Show ellipsis if not at end
        if (endIndex < totalPages - 1) ...[
          const SizedBox(width: 4),
          Text(
            '...',
            style: TextStyle(color: inactive, fontSize: 10),
          ),
          const SizedBox(width: 4),
          Container(
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              color: inactive,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ],
    );
  }
}
