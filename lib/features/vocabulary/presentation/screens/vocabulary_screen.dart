import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/models/progress.dart';
import '../../../../core/models/vocabulary.dart';
import '../../providers/vocabulary_provider.dart';
import '../../providers/albums_provider.dart';
import '../widgets/level_section.dart';
import '../widgets/word_card.dart';
import '../widgets/album_card.dart';
import '../widgets/create_album_modal.dart';

/// Main vocabulary screen with tabs for By Level, Albums, and All Words
class VocabularyScreen extends ConsumerStatefulWidget {
  const VocabularyScreen({super.key});

  @override
  ConsumerState<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends ConsumerState<VocabularyScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showCreateAlbumModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CreateAlbumModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final savedWordsAsync = ref.watch(savedWordsProvider);
    final albumsAsync = ref.watch(vocabularyAlbumsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.background,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
        elevation: 0,
        title: Text(
          'My Words',
          style: TextStyle(
            color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => setState(() => _searchQuery = value),
                  decoration: InputDecoration(
                    hintText: 'Search words...',
                    hintStyle: TextStyle(
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _searchQuery = '');
                            },
                          )
                        : null,
                    filled: true,
                    fillColor:
                        isDark ? AppColors.darkBackground : AppColors.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  style: TextStyle(
                    color:
                        isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                  ),
                ),
              ),
              // Tab bar
              TabBar(
                controller: _tabController,
                labelColor: AppColors.primary,
                unselectedLabelColor:
                    isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                indicatorColor: AppColors.primary,
                tabs: const [
                  Tab(text: 'By Level'),
                  Tab(text: 'Albums'),
                  Tab(text: 'All Words'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: By Level
          _buildByLevelTab(savedWordsAsync, isDark),
          // Tab 2: Albums
          _buildAlbumsTab(albumsAsync, isDark),
          // Tab 3: All Words
          _buildAllWordsTab(savedWordsAsync, isDark),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateAlbumModal,
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildByLevelTab(
    AsyncValue<List<SavedWord>> savedWordsAsync,
    bool isDark,
  ) {
    return savedWordsAsync.when(
      data: (savedWords) {
        // Filter by search query
        final filteredWords = _searchQuery.isEmpty
            ? savedWords
            : savedWords
                .where((w) =>
                    w.odId.toLowerCase().contains(_searchQuery.toLowerCase()))
                .toList();

        // Group words by level (A1, A2, B1, B2)
        // For now, we'll use a placeholder since we don't have level info in SavedWord
        // In a real implementation, you'd need to fetch vocabulary details to get levels
        final levels = ['A1', 'A2', 'B1', 'B2'];

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: levels.length,
          itemBuilder: (context, index) {
            final level = levels[index];
            // For demonstration, distribute words across levels
            final levelWords = filteredWords
                .skip(index * (filteredWords.length ~/ 4))
                .take(filteredWords.length ~/ 4 + 1)
                .toList();

            return LevelSection(
              level: level,
              words: levelWords,
              isDark: isDark,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load words',
              style: TextStyle(
                color:
                    isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () =>
                  ref.invalidate(savedWordsProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlbumsTab(
    AsyncValue<List<VocabularyAlbum>> albumsAsync,
    bool isDark,
  ) {
    return albumsAsync.when(
      data: (albums) {
        if (albums.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.folder_outlined,
                  size: 64,
                  color:
                      isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                ),
                const SizedBox(height: 16),
                Text(
                  'No albums yet',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color:
                        isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Create your first vocabulary album',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _showCreateAlbumModal,
                  icon: const Icon(Icons.add),
                  label: const Text('Create Album'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.85,
          ),
          itemCount: albums.length,
          itemBuilder: (context, index) {
            final album = albums[index];
            return AlbumCard(
              album: album,
              isDark: isDark,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load albums',
              style: TextStyle(
                color:
                    isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => ref.invalidate(vocabularyAlbumsProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAllWordsTab(
    AsyncValue<List<SavedWord>> savedWordsAsync,
    bool isDark,
  ) {
    return savedWordsAsync.when(
      data: (savedWords) {
        // Filter by search query
        final filteredWords = _searchQuery.isEmpty
            ? savedWords
            : savedWords
                .where((w) =>
                    w.odId.toLowerCase().contains(_searchQuery.toLowerCase()))
                .toList();

        if (filteredWords.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.book_outlined,
                  size: 64,
                  color:
                      isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                ),
                const SizedBox(height: 16),
                Text(
                  _searchQuery.isEmpty ? 'No saved words yet' : 'No words found',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color:
                        isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _searchQuery.isEmpty
                      ? 'Start reading stories to save vocabulary'
                      : 'Try a different search term',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: filteredWords.length,
          itemBuilder: (context, index) {
            final savedWord = filteredWords[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: WordCard(
                savedWord: savedWord,
                isDark: isDark,
              ),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load words',
              style: TextStyle(
                color:
                    isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () =>
                  ref.invalidate(savedWordsProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
