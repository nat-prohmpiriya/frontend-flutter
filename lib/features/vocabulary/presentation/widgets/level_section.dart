import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/models/progress.dart';

/// CEFR level section card with word count per status and progress bar
class LevelSection extends StatefulWidget {
  final String level;
  final List<SavedWord> words;
  final bool isDark;

  const LevelSection({
    super.key,
    required this.level,
    required this.words,
    required this.isDark,
  });

  @override
  State<LevelSection> createState() => _LevelSectionState();
}

class _LevelSectionState extends State<LevelSection> {
  bool _isExpanded = false;

  /// Get color for CEFR level badge
  static Color getLevelColor(String level) {
    switch (level.toUpperCase()) {
      case 'A1':
        return const Color(0xFF22C55E); // Green
      case 'A2':
        return const Color(0xFF3B82F6); // Blue
      case 'B1':
        return const Color(0xFFF59E0B); // Orange
      case 'B2':
        return const Color(0xFFEF4444); // Red
      default:
        return AppColors.textSecondary;
    }
  }

  /// Get color for word status
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'learning':
        return const Color(0xFF3B82F6); // Blue
      case 'learned':
        return const Color(0xFF22C55E); // Green
      case 'difficult':
        return const Color(0xFFEF4444); // Red
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final levelColor = getLevelColor(widget.level);

    // Count words by status
    final learningCount =
        widget.words.where((w) => w.status == 'learning').length;
    final learnedCount =
        widget.words.where((w) => w.status == 'learned').length;
    final difficultCount =
        widget.words.where((w) => w.status == 'difficult').length;
    final totalCount = widget.words.length;

    // Calculate progress (learned / total)
    final progress = totalCount > 0 ? learnedCount / totalCount : 0.0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: widget.isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header (always visible)
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Level badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: levelColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.level,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Word counts
                      Expanded(
                        child: Row(
                          children: [
                            _buildStatusChip(
                              'Learning',
                              learningCount,
                              getStatusColor('learning'),
                            ),
                            const SizedBox(width: 8),
                            _buildStatusChip(
                              'Learned',
                              learnedCount,
                              getStatusColor('learned'),
                            ),
                            const SizedBox(width: 8),
                            _buildStatusChip(
                              'Difficult',
                              difficultCount,
                              getStatusColor('difficult'),
                            ),
                          ],
                        ),
                      ),
                      // Expand/collapse icon
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: widget.isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Progress bar
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: widget.isDark
                          ? AppColors.darkBorder
                          : AppColors.border,
                      valueColor: AlwaysStoppedAnimation<Color>(levelColor),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Progress text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$learnedCount / $totalCount words learned',
                        style: TextStyle(
                          fontSize: 12,
                          color: widget.isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: levelColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Expanded content (word list)
          if (_isExpanded && widget.words.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color:
                        widget.isDark ? AppColors.darkBorder : AppColors.border,
                  ),
                ),
              ),
              child: Column(
                children: [
                  ...widget.words.take(5).map((word) => _buildWordItem(word)),
                  if (widget.words.length > 5)
                    InkWell(
                      onTap: () {
                        // Navigate to level detail screen
                        context.push('/vocabulary/level/${widget.level}');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'View all ${widget.words.length} words',
                              style: TextStyle(
                                color: levelColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: levelColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, int count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '$count',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildWordItem(SavedWord word) {
    final statusColor = getStatusColor(word.status);

    return InkWell(
      onTap: () {
        // Navigate to word detail
        context.push('/vocabulary/word/${word.odId}');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Status indicator
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            // Word text
            Expanded(
              child: Text(
                word.odId,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: widget.isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.textPrimary,
                ),
              ),
            ),
            // Date saved
            Text(
              _formatDate(word.savedAt),
              style: TextStyle(
                fontSize: 12,
                color: widget.isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
