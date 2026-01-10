import 'package:flutter/material.dart';

import '../../../../core/models/statistics.dart';
import '../../../../core/theme/app_colors.dart';

/// Achievement badge display widget
class AchievementBadge extends StatelessWidget {
  final Achievement achievement;
  final bool showDetails;
  final VoidCallback? onTap;

  const AchievementBadge({
    super.key,
    required this.achievement,
    this.showDetails = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: achievement.isLocked
              ? AppColors.textSecondary.withValues(alpha: 0.05)
              : AppColors.purple.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: achievement.isLocked
                ? AppColors.textSecondary.withValues(alpha: 0.1)
                : AppColors.purple.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Badge icon
            _AchievementIcon(
              achievement: achievement,
            ),
            const SizedBox(height: 8),
            // Name
            Text(
              achievement.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: achievement.isLocked
                    ? AppColors.textSecondary
                    : AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (showDetails) ...[
              const SizedBox(height: 4),
              // Description
              Text(
                achievement.description,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (achievement.earnedAt != null) ...[
                const SizedBox(height: 4),
                // Earned date
                Text(
                  'Earned ${_formatDate(achievement.earnedAt!)}',
                  style: TextStyle(
                    fontSize: 9,
                    color: AppColors.purple.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'today';
    } else if (difference.inDays == 1) {
      return 'yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

class _AchievementIcon extends StatelessWidget {
  final Achievement achievement;

  const _AchievementIcon({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: achievement.isLocked
            ? AppColors.textSecondary.withValues(alpha: 0.1)
            : AppColors.purple.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        boxShadow: achievement.isLocked
            ? null
            : [
                BoxShadow(
                  color: AppColors.purple.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: achievement.isLocked
          ? Icon(
              Icons.lock,
              size: 24,
              color: AppColors.textSecondary.withValues(alpha: 0.5),
            )
          : Icon(
              _getAchievementIcon(),
              size: 28,
              color: AppColors.purple,
            ),
    );
  }

  IconData _getAchievementIcon() {
    // Map achievement IDs to icons
    switch (achievement.id) {
      case 'first_story':
        return Icons.auto_stories;
      case 'word_collector_10':
      case 'word_collector_50':
      case 'word_collector_100':
        return Icons.bookmark;
      case 'streak_7':
      case 'streak_30':
        return Icons.local_fire_department;
      case 'quiz_perfect':
        return Icons.stars;
      case 'polyglot':
        return Icons.school;
      default:
        return Icons.emoji_events;
    }
  }
}

/// Grid of achievement badges
class AchievementGrid extends StatelessWidget {
  final List<Achievement> achievements;
  final int crossAxisCount;
  final bool showDetails;

  const AchievementGrid({
    super.key,
    required this.achievements,
    this.crossAxisCount = 3,
    this.showDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.emoji_events,
                color: AppColors.purple,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Achievements',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              // Earned count
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.purple.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${achievements.where((a) => !a.isLocked).length}/${achievements.length}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.purple,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Badges grid
          if (achievements.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'No achievements yet',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: showDetails ? 0.8 : 1,
              ),
              itemCount: achievements.length,
              itemBuilder: (context, index) {
                return AchievementBadge(
                  achievement: achievements[index],
                  showDetails: showDetails,
                  onTap: () {
                    _showAchievementDialog(context, achievements[index]);
                  },
                );
              },
            ),
        ],
      ),
    );
  }

  void _showAchievementDialog(BuildContext context, Achievement achievement) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _AchievementIcon(achievement: achievement),
              const SizedBox(height: 16),
              Text(
                achievement.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: achievement.isLocked
                      ? AppColors.textSecondary
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                achievement.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              if (achievement.earnedAt != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.purple.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Earned on ${achievement.earnedAt!.day}/${achievement.earnedAt!.month}/${achievement.earnedAt!.year}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.purple,
                    ),
                  ),
                ),
              ] else ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.textSecondary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock,
                        size: 14,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Locked',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
