import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/story.dart';
import '../../../../core/theme/app_colors.dart';

/// A card widget that displays story information in the library grid
class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.story,
    this.locale = 'en',
  });

  final Story story;
  final String locale;

  /// Get the color for the CEFR level badge
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

  /// Get localized title based on locale
  String _getLocalizedTitle() {
    return locale == 'th' ? story.title.th : story.title.en;
  }

  /// Get secondary title (other language)
  String _getSecondaryTitle() {
    return locale == 'th' ? story.title.en : story.title.th;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        context.push('/story/${story.slug}');
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image with Level Badge
            _buildCoverImage(isDark),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    _getLocalizedTitle(),
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Secondary title
                  Text(
                    _getSecondaryTitle(),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Meta info row
                  _buildMetaInfo(theme, isDark),
                  const SizedBox(height: 8),
                  // Category tag
                  if (story.category.isNotEmpty) _buildCategoryTag(isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoverImage(bool isDark) {
    return Stack(
      children: [
        // Cover image
        AspectRatio(
          aspectRatio: 16 / 10,
          child: story.coverImageUrl.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: story.coverImageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: isDark ? AppColors.darkBorder : AppColors.border,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: isDark ? AppColors.darkBorder : AppColors.border,
                    child: Icon(
                      Icons.menu_book_outlined,
                      size: 40,
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                  ),
                )
              : Container(
                  color: isDark ? AppColors.darkBorder : AppColors.border,
                  child: Icon(
                    Icons.menu_book_outlined,
                    size: 40,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
        ),
        // Level badge
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: getLevelColor(story.level),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              story.level.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetaInfo(ThemeData theme, bool isDark) {
    final textColor =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;

    return Row(
      children: [
        // Reading time
        Icon(
          Icons.access_time,
          size: 14,
          color: textColor,
        ),
        const SizedBox(width: 4),
        Text(
          '${story.estimatedTime} min',
          style: theme.textTheme.bodySmall?.copyWith(color: textColor),
        ),
        const SizedBox(width: 12),
        // Episode count
        Icon(
          Icons.auto_stories,
          size: 14,
          color: textColor,
        ),
        const SizedBox(width: 4),
        Text(
          '${story.episodes.length} ep',
          style: theme.textTheme.bodySmall?.copyWith(color: textColor),
        ),
      ],
    );
  }

  Widget _buildCategoryTag(bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkBorder.withValues(alpha: 0.5)
            : AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        story.category,
        style: TextStyle(
          fontSize: 11,
          color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
        ),
      ),
    );
  }
}
