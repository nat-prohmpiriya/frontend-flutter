import 'package:flutter/material.dart';

import '../../../../core/models/statistics.dart';
import '../../../../core/theme/app_colors.dart';

/// Recent activity feed widget
class ActivityList extends StatelessWidget {
  final List<ActivityItem> activities;
  final int maxItems;

  const ActivityList({
    super.key,
    required this.activities,
    this.maxItems = 5,
  });

  @override
  Widget build(BuildContext context) {
    final displayActivities = activities.take(maxItems).toList();

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.history,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              if (activities.length > maxItems)
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to full activity list
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // Activity list
          if (displayActivities.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'No recent activity',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: displayActivities.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return _ActivityListItem(
                  activity: displayActivities[index],
                );
              },
            ),
        ],
      ),
    );
  }
}

class _ActivityListItem extends StatelessWidget {
  final ActivityItem activity;

  const _ActivityListItem({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _getIconBackgroundColor(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getIcon(),
              color: _getIconColor(),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  activity.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  activity.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Time ago
          Text(
            _formatTimeAgo(activity.timestamp),
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon() {
    switch (activity.type) {
      case 'story_completed':
        return Icons.menu_book;
      case 'word_saved':
        return Icons.bookmark_added;
      case 'quiz_result':
        return Icons.quiz;
      case 'achievement':
        return Icons.emoji_events;
      default:
        return Icons.circle;
    }
  }

  Color _getIconColor() {
    switch (activity.type) {
      case 'story_completed':
        return AppColors.primary;
      case 'word_saved':
        return AppColors.secondary;
      case 'quiz_result':
        return AppColors.orange;
      case 'achievement':
        return AppColors.purple;
      default:
        return AppColors.textSecondary;
    }
  }

  Color _getIconBackgroundColor() {
    return _getIconColor().withValues(alpha: 0.1);
  }

  String _formatTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 7) {
      return '${timestamp.day}/${timestamp.month}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
