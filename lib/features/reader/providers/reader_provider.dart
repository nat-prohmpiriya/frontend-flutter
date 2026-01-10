import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/story.dart';
import '../../library/data/progress_repository.dart';
import '../../library/data/story_repository.dart';

part 'reader_provider.freezed.dart';
part 'reader_provider.g.dart';

@freezed
abstract class ReaderState with _$ReaderState {
  const factory ReaderState({
    Story? story,
    @Default(1) int currentEpisode,
    @Default(1) int currentPage,
    @Default(false) bool isLoading,
    @Default(false) bool isTranslationPanelOpen,
    @Default(false) bool isVocabularyPanelOpen,
    @Default(true) bool showOverlayControls,
    String? selectedWord,
    String? error,
  }) = _ReaderState;

  factory ReaderState.initial() => const ReaderState(isLoading: true);
}

@riverpod
class ReaderNotifier extends _$ReaderNotifier {
  @override
  ReaderState build(String storySlug) {
    return ReaderState.initial();
  }

  /// Load story and restore progress
  Future<void> loadStory({int? initialEpisode}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final storyRepo = ref.read(storyRepositoryProvider);
      final progressRepo = ref.read(progressRepositoryProvider);

      // Load story details
      final story = await storyRepo.getStory(storySlug);

      // Load saved progress
      final progress = await progressRepo.getStoryProgress(storySlug);

      state = state.copyWith(
        story: story,
        currentEpisode: initialEpisode ?? progress?.currentEpisode ?? 1,
        currentPage: initialEpisode != null ? 1 : (progress?.currentPage ?? 1),
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Navigate to next page
  void nextPage() {
    final story = state.story;
    if (story == null) return;

    final currentEpisode = _getCurrentEpisode();
    if (currentEpisode == null) return;

    final totalPages = currentEpisode.pages.length;

    if (state.currentPage < totalPages) {
      // Move to next page in current episode
      state = state.copyWith(currentPage: state.currentPage + 1);
      _saveProgress();
    } else if (state.currentEpisode < story.episodes.length) {
      // Move to first page of next episode
      state = state.copyWith(
        currentEpisode: state.currentEpisode + 1,
        currentPage: 1,
      );
      _saveProgress();
    }
  }

  /// Navigate to previous page
  void previousPage() {
    final story = state.story;
    if (story == null) return;

    if (state.currentPage > 1) {
      // Move to previous page in current episode
      state = state.copyWith(currentPage: state.currentPage - 1);
      _saveProgress();
    } else if (state.currentEpisode > 1) {
      // Move to last page of previous episode
      final prevEpisode = story.episodes[state.currentEpisode - 2];
      state = state.copyWith(
        currentEpisode: state.currentEpisode - 1,
        currentPage: prevEpisode.pages.length,
      );
      _saveProgress();
    }
  }

  /// Go to specific page
  void goToPage(int page) {
    final currentEpisode = _getCurrentEpisode();
    if (currentEpisode == null) return;

    if (page >= 1 && page <= currentEpisode.pages.length) {
      state = state.copyWith(currentPage: page);
      _saveProgress();
    }
  }

  /// Go to specific episode
  void goToEpisode(int episode) {
    final story = state.story;
    if (story == null) return;

    if (episode >= 1 && episode <= story.episodes.length) {
      state = state.copyWith(
        currentEpisode: episode,
        currentPage: 1,
      );
      _saveProgress();
    }
  }

  /// Toggle translation panel visibility
  void toggleTranslationPanel() {
    state = state.copyWith(
      isTranslationPanelOpen: !state.isTranslationPanelOpen,
      isVocabularyPanelOpen: false, // Close vocab panel when opening translation
    );
  }

  /// Toggle vocabulary panel visibility
  void toggleVocabularyPanel() {
    state = state.copyWith(
      isVocabularyPanelOpen: !state.isVocabularyPanelOpen,
      isTranslationPanelOpen: false, // Close translation panel when opening vocab
    );
  }

  /// Close all panels
  void closePanels() {
    state = state.copyWith(
      isTranslationPanelOpen: false,
      isVocabularyPanelOpen: false,
    );
  }

  /// Toggle overlay controls visibility
  void toggleOverlayControls() {
    state = state.copyWith(showOverlayControls: !state.showOverlayControls);
  }

  /// Show overlay controls
  void showOverlay() {
    state = state.copyWith(showOverlayControls: true);
  }

  /// Hide overlay controls
  void hideOverlay() {
    state = state.copyWith(showOverlayControls: false);
  }

  /// Select a vocabulary word
  void selectWord(String word) {
    state = state.copyWith(selectedWord: word);
  }

  /// Clear selected word
  void clearSelectedWord() {
    state = state.copyWith(selectedWord: null);
  }

  /// Get current episode
  Episode? _getCurrentEpisode() {
    final story = state.story;
    if (story == null || story.episodes.isEmpty) return null;
    if (state.currentEpisode < 1 ||
        state.currentEpisode > story.episodes.length) {
      return null;
    }
    return story.episodes[state.currentEpisode - 1];
  }

  /// Get current page data
  Page? getCurrentPage() {
    final episode = _getCurrentEpisode();
    if (episode == null || episode.pages.isEmpty) return null;
    if (state.currentPage < 1 || state.currentPage > episode.pages.length) {
      return null;
    }
    return episode.pages[state.currentPage - 1];
  }

  /// Get current episode data
  Episode? getCurrentEpisode() => _getCurrentEpisode();

  /// Save reading progress to server
  Future<void> _saveProgress() async {
    try {
      final progressRepo = ref.read(progressRepositoryProvider);
      await progressRepo.updateStoryProgress(
        slug: storySlug,
        currentEpisode: state.currentEpisode,
        currentPage: state.currentPage,
        status: 'in_progress',
      );
    } catch (e) {
      // Silently fail - progress saving is not critical
      // Could add logging here
    }
  }

  /// Public method to save progress
  Future<void> saveProgress() => _saveProgress();

  /// Check if we can go to next page
  bool canGoNext() {
    final story = state.story;
    if (story == null) return false;

    final currentEpisode = _getCurrentEpisode();
    if (currentEpisode == null) return false;

    // Can go next if not on last page of last episode
    final isLastPage = state.currentPage >= currentEpisode.pages.length;
    final isLastEpisode = state.currentEpisode >= story.episodes.length;

    return !(isLastPage && isLastEpisode);
  }

  /// Check if we can go to previous page
  bool canGoPrevious() {
    // Can go previous if not on first page of first episode
    return !(state.currentPage <= 1 && state.currentEpisode <= 1);
  }

  /// Get total pages in current episode
  int get totalPagesInEpisode {
    final episode = _getCurrentEpisode();
    return episode?.pages.length ?? 0;
  }

  /// Get total episodes in story
  int get totalEpisodes {
    return state.story?.episodes.length ?? 0;
  }
}
