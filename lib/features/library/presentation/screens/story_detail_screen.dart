import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/models/story.dart';
import '../../providers/stories_provider.dart';
import '../widgets/story_card.dart';

/// Screen showing story details with episode list
class StoryDetailScreen extends ConsumerWidget {
  const StoryDetailScreen({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyAsync = ref.watch(storyDetailProvider(slug));
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: storyAsync.when(
        loading: () => const _LoadingState(),
        error: (error, stack) => _ErrorState(
          error: error.toString(),
          onRetry: () => ref.invalidate(storyDetailProvider(slug)),
        ),
        data: (story) => _StoryDetailContent(
          story: story,
          isDark: isDark,
        ),
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({
    required this.error,
    required this.onRetry,
  });

  final String error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppColors.error,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Failed to load story',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                error,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryDetailContent extends StatelessWidget {
  const _StoryDetailContent({
    required this.story,
    required this.isDark,
  });

  final Story story;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final levelColor = StoryCard.getLevelColor(story.level);

    return CustomScrollView(
      slivers: [
        // App Bar with cover image
        SliverAppBar(
          expandedHeight: 280,
          pinned: true,
          backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                // Cover image
                if (story.coverImageUrl.isNotEmpty)
                  CachedNetworkImage(
                    imageUrl: story.coverImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: isDark ? AppColors.darkBorder : AppColors.border,
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: isDark ? AppColors.darkBorder : AppColors.border,
                      child: const Icon(Icons.menu_book, size: 64),
                    ),
                  )
                else
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          levelColor,
                          levelColor.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.menu_book,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Content
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Level badge row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        story.title['en'] ?? '',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: levelColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        story.level.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Thai title
                Text(
                  story.title['th'] ?? '',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                // Stats row
                _buildStatsRow(theme),
                const SizedBox(height: 16),
                // Tags
                if (story.tags.isNotEmpty) ...[
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: story.tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkBorder.withValues(alpha: 0.5)
                              : AppColors.background,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                ],
                // Episodes header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Episodes',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      '${story.episodes.length} episodes',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        // Episodes list
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final episode = story.episodes[index];
                final isLast = index == story.episodes.length - 1;
                return _EpisodeCard(
                  episode: episode,
                  storySlug: story.slug,
                  isDark: isDark,
                  isLast: isLast,
                  // For now, first episode is always unlocked
                  isLocked: index > 0, // TODO: Get from progress
                  isCompleted: false, // TODO: Get from progress
                );
              },
              childCount: story.episodes.length,
            ),
          ),
        ),
        // Bottom padding
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }

  Widget _buildStatsRow(ThemeData theme) {
    return Row(
      children: [
        _StatItem(
          icon: Icons.access_time,
          label: '${story.estimatedTime} min',
          isDark: isDark,
        ),
        const SizedBox(width: 24),
        _StatItem(
          icon: Icons.text_fields,
          label: '${story.totalWords} words',
          isDark: isDark,
        ),
        const SizedBox(width: 24),
        _StatItem(
          icon: Icons.bookmark_outline,
          label: '${story.targetVocabulary} vocab',
          isDark: isDark,
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.isDark,
  });

  final IconData icon;
  final String label;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final color =
        isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _EpisodeCard extends StatelessWidget {
  const _EpisodeCard({
    required this.episode,
    required this.storySlug,
    required this.isDark,
    required this.isLast,
    this.isLocked = false,
    this.isCompleted = false,
  });

  final Episode episode;
  final String storySlug;
  final bool isDark;
  final bool isLast;
  final bool isLocked;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLocked
              ? null
              : () {
                  context.push('/reader/$storySlug?ep=${episode.episodeNumber}');
                },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isLocked
                  ? (isDark ? AppColors.darkBorder : AppColors.border)
                      .withValues(alpha: 0.5)
                  : isDark
                      ? AppColors.darkSurface
                      : AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isCompleted
                    ? AppColors.success
                    : isDark
                        ? AppColors.darkBorder
                        : AppColors.border,
                width: isCompleted ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                // Episode number badge
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.success
                        : isLocked
                            ? (isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary)
                            : AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: isCompleted
                        ? const Icon(Icons.check, color: Colors.white)
                        : isLocked
                            ? const Icon(Icons.lock, color: Colors.white, size: 20)
                            : Text(
                                '${episode.episodeNumber}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                  ),
                ),
                const SizedBox(width: 16),
                // Episode info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Episode ${episode.episodeNumber}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isLocked
                              ? (isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.textSecondary)
                              : isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.textPrimary,
                        ),
                      ),
                      if ((episode.title['en'] ?? '').isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          episode.title['en'] ?? '',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      const SizedBox(height: 4),
                      Text(
                        '${episode.pages.length} pages',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark
                              ? AppColors.darkTextSecondary.withValues(alpha: 0.7)
                              : AppColors.textSecondary.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                // Arrow or lock icon
                Icon(
                  isLocked ? Icons.lock_outline : Icons.chevron_right,
                  color: isLocked
                      ? (isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary)
                      : AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
