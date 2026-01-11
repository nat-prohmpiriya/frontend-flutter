import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/models/story.dart';
import '../../providers/stories_provider.dart';
import '../widgets/level_filter.dart';
import '../widgets/story_card.dart';
import '../widgets/story_shimmer.dart';
import '../widgets/pagination_widget.dart';

/// Library screen displaying a grid of story cards with filters
class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  // Category options
  static const List<String> categories = [
    'All',
    'Adventure',
    'Fantasy',
    'Daily Life',
    'Mystery',
    'Science',
    'History',
  ];

  // Pagination settings
  static const int itemsPerPage = 12;
  int _currentPage = 1;

  String _selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    ref.read(storiesFilterProvider.notifier).setSearch(
      value.isEmpty ? null : value,
    );
    _resetPage();
  }

  void _clearSearch() {
    _searchController.clear();
    ref.read(storiesFilterProvider.notifier).setSearch(null);
    _resetPage();
  }

  void _resetPage() {
    if (_currentPage != 1) {
      setState(() {
        _currentPage = 1;
      });
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
    // Scroll to top when page changes
    _scrollToTop();
  }

  void _scrollToTop() {
    // Trigger a rebuild to scroll to top
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final filter = ref.watch(storiesFilterProvider);

    // Calculate offset for pagination
    final offset = (_currentPage - 1) * itemsPerPage;

    // Watch stories provider with pagination
    final storiesAsync = ref.watch(storiesProvider);

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(storiesProvider);
          },
          child: CustomScrollView(
            slivers: [
              // Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Story Library',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.darkTextPrimary
                              : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Explore stories to improve your English',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Search bar
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: _SearchBar(
                    controller: _searchController,
                    focusNode: _searchFocus,
                    onChanged: _onSearchChanged,
                    onClear: _clearSearch,
                    isDark: isDark,
                  ),
                ),
              ),

              // Level filter
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: LevelFilter(
                    selectedLevel: filter.level,
                    onLevelSelected: (level) {
                      ref.read(storiesFilterProvider.notifier).setLevel(level);
                      _resetPage();
                    },
                  ),
                ),
              ),

              // Category filter chips
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: _CategoryChips(
                    selectedCategory: _selectedCategory,
                    categories: categories,
                    isDark: isDark,
                    onChanged: (category) {
                      setState(() {
                        _selectedCategory = category ?? 'All';
                      });
                      ref.read(storiesFilterProvider.notifier).setCategory(
                            category == 'All' ? null : category,
                          );
                      _resetPage();
                    },
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 8)),

              // Results count
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _ResultsCount(
                    storiesAsync: storiesAsync,
                    filter: filter,
                    isDark: isDark,
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 8)),

              // Content
              storiesAsync.when(
                loading: () => const SliverToBoxAdapter(
                  child: StoryShimmerGrid(itemCount: 6),
                ),
                error: (error, stack) => SliverFillRemaining(
                  hasScrollBody: false,
                  child: _ErrorState(
                    error: error.toString(),
                    onRetry: () => ref.invalidate(storiesProvider),
                  ),
                ),
                data: (stories) {
                  if (stories.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: _EmptyState(
                        hasFilters: filter.level != null ||
                            filter.category != null ||
                            filter.search != null,
                        onClearFilters: () {
                          ref.read(storiesFilterProvider.notifier).clear();
                          setState(() {
                            _selectedCategory = 'All';
                          });
                          _clearSearch();
                        },
                      ),
                    );
                  }

                  // Calculate pagination info
                  final totalCount = stories.length;
                  final totalPages = (totalCount / itemsPerPage).ceil();

                  // Get stories for current page
                  final startIndex = offset;
                  final endIndex = (offset + itemsPerPage).clamp(0, stories.length);
                  final currentPageStories = stories.sublist(startIndex, endIndex);

                  // Calculate showing info
                  final showingFrom = totalCount > 0 ? startIndex + 1 : 0;
                  final showingTo = endIndex;

                  return SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final story = currentPageStories[index];
                          return StoryCard(
                            story: story,
                            locale: 'en', // TODO: Get from locale provider
                          );
                        },
                        childCount: currentPageStories.length,
                      ),
                    ),
                  );
                },
              ),

              // Pagination
              storiesAsync.when(
                loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
                error: (_, __) => const SliverToBoxAdapter(child: SizedBox.shrink()),
                data: (stories) {
                  if (stories.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

                  final totalCount = stories.length;
                  final totalPages = (totalCount / itemsPerPage).ceil();

                  if (totalPages <= 1) {
                    return const SliverToBoxAdapter(child: SizedBox.shrink());
                  }

                  final startIndex = offset;
                  final endIndex = (offset + itemsPerPage).clamp(0, stories.length);
                  final showingFrom = totalCount > 0 ? startIndex + 1 : 0;
                  final showingTo = endIndex;

                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: PaginationWidget(
                        currentPage: _currentPage,
                        totalPages: totalPages,
                        onPageChange: _onPageChanged,
                        showingFrom: showingFrom,
                        showingTo: showingTo,
                        totalItems: totalCount,
                      ),
                    ),
                  );
                },
              ),

              // Bottom padding for navigation bar
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onClear,
    required this.isDark,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.border,
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.search,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: 'Search stories...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: AppColors.textSecondary),
              ),
            ),
          ),
          if (controller.text.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear, size: 18),
              onPressed: onClear,
              color: AppColors.textSecondary,
            ),
        ],
      ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips({
    required this.selectedCategory,
    required this.categories,
    required this.isDark,
    required this.onChanged,
  });

  final String selectedCategory;
  final List<String> categories;
  final bool isDark;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.map((category) {
        final isSelected = selectedCategory == category;
        return InkWell(
          onTap: () => onChanged(category),
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : isDark
                      ? AppColors.darkSurface
                      : AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : isDark
                        ? AppColors.darkBorder
                        : AppColors.border,
              ),
            ),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ResultsCount extends StatelessWidget {
  const _ResultsCount({
    required this.storiesAsync,
    required this.filter,
    required this.isDark,
  });

  final AsyncValue<List<Story>> storiesAsync;
  final ({String? level, String? category, String? search}) filter;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return storiesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (stories) {
        return Text(
          '${stories.length} stories found',
          style: TextStyle(
            color: isDark
                ? AppColors.darkTextSecondary
                : AppColors.textSecondary,
            fontSize: 14,
          ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.hasFilters,
    required this.onClearFilters,
  });

  final bool hasFilters;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: (isDark ? AppColors.darkBorder : AppColors.border)
                    .withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.menu_book_outlined,
                size: 48,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'No stories found',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color:
                    isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              hasFilters
                  ? 'Try adjusting your filters to find more stories'
                  : 'Check back later for new stories',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (hasFilters) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onClearFilters,
                icon: const Icon(Icons.filter_alt_off),
                label: const Text('Clear Filters'),
              ),
            ],
          ],
        ),
      ),
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

    return Center(
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
              'Failed to load stories',
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
    );
  }
}
