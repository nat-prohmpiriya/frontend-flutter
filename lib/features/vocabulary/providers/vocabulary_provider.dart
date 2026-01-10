import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/vocabulary.dart';
import '../../../core/models/progress.dart';
import '../data/vocabulary_repository.dart';

part 'vocabulary_provider.g.dart';

/// Provider for fetching vocabulary details for a specific word
@riverpod
Future<Vocabulary> vocabularyDetail(Ref ref, String word) async {
  final repository = ref.watch(vocabularyRepositoryProvider);
  return repository.getVocabulary(word);
}

/// Notifier for managing saved words
@riverpod
class SavedWordsNotifier extends _$SavedWordsNotifier {
  @override
  Future<List<SavedWord>> build() async {
    final repository = ref.watch(vocabularyRepositoryProvider);
    return repository.getSavedWords();
  }

  /// Save a word to user's vocabulary
  Future<void> saveWord(String word, {String? albumId}) async {
    final repository = ref.read(vocabularyRepositoryProvider);

    // Optimistic update
    final currentWords = state.value ?? [];
    final newSavedWord = SavedWord(
      odId: word,
      savedAt: DateTime.now(),
      status: 'learning',
      albumId: albumId,
    );
    state = AsyncData([...currentWords, newSavedWord]);

    try {
      final savedWord = await repository.saveWord(word: word, albumId: albumId);

      // Update with actual saved word from server
      final updatedWords = [...currentWords, savedWord];
      state = AsyncData(updatedWords);
    } catch (e) {
      // Revert on error
      state = AsyncData(currentWords);
      rethrow;
    }
  }

  /// Remove a word from user's vocabulary
  Future<void> removeWord(String word) async {
    final repository = ref.read(vocabularyRepositoryProvider);

    // Optimistic update
    final currentWords = state.value ?? [];
    final filteredWords = currentWords.where((w) => w.odId != word).toList();
    state = AsyncData(filteredWords);

    try {
      await repository.removeSavedWord(word);
    } catch (e) {
      // Revert on error
      state = AsyncData(currentWords);
      rethrow;
    }
  }

  /// Update word status (learning, learned, difficult)
  Future<void> updateWordStatus(String word, String status) async {
    final repository = ref.read(vocabularyRepositoryProvider);

    // Optimistic update
    final currentWords = state.value ?? [];
    final updatedWords = currentWords.map((w) {
      if (w.odId == word) {
        return SavedWord(
          odId: w.odId,
          savedAt: w.savedAt,
          status: status,
          albumId: w.albumId,
        );
      }
      return w;
    }).toList();
    state = AsyncData(updatedWords);

    try {
      await repository.updateWordStatus(word: word, status: status);
    } catch (e) {
      // Revert on error
      state = AsyncData(currentWords);
      rethrow;
    }
  }

  /// Check if a word is saved
  bool isWordSaved(String word) {
    final words = state.value ?? [];
    return words.any((w) => w.odId == word);
  }
}

/// Provider to check if a specific word is saved
@riverpod
bool isWordSaved(Ref ref, String word) {
  final savedWords = ref.watch(savedWordsProvider);
  return savedWords.when(
    data: (words) => words.any((w) => w.odId == word),
    loading: () => false,
    error: (_, __) => false,
  );
}
