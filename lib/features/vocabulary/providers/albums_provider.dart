import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/vocabulary.dart';
import '../data/vocabulary_repository.dart';

part 'albums_provider.g.dart';

/// Provider for fetching all vocabulary albums
@riverpod
Future<List<VocabularyAlbum>> vocabularyAlbums(Ref ref) async {
  final repository = ref.watch(vocabularyRepositoryProvider);
  return repository.getAlbums();
}

/// Provider for fetching a single album by ID
@riverpod
Future<VocabularyAlbum?> albumDetail(Ref ref, String albumId) async {
  final repository = ref.watch(vocabularyRepositoryProvider);
  final albums = await repository.getAlbums();
  return albums.firstWhere(
    (album) => album.id == albumId,
    orElse: () => throw Exception('Album not found'),
  );
}

/// Notifier for managing vocabulary albums
@riverpod
class AlbumsNotifier extends _$AlbumsNotifier {
  @override
  Future<List<VocabularyAlbum>> build() async {
    final repository = ref.watch(vocabularyRepositoryProvider);
    return repository.getAlbums();
  }

  /// Create a new album
  Future<VocabularyAlbum> createAlbum(String name, String? description) async {
    final repository = ref.read(vocabularyRepositoryProvider);

    // Create the album
    final newAlbum = await repository.createAlbum(
      name: name,
      description: description,
    );

    // Update state
    final currentAlbums = state.value ?? [];
    state = AsyncData([...currentAlbums, newAlbum]);

    return newAlbum;
  }

  /// Delete an album
  Future<void> deleteAlbum(String albumId) async {
    final repository = ref.read(vocabularyRepositoryProvider);

    // Optimistic update
    final currentAlbums = state.value ?? [];
    final filteredAlbums =
        currentAlbums.where((a) => a.id != albumId).toList();
    state = AsyncData(filteredAlbums);

    try {
      await repository.deleteAlbum(albumId);
    } catch (e) {
      // Revert on error
      state = AsyncData(currentAlbums);
      rethrow;
    }
  }

  /// Update album details
  Future<void> updateAlbum(
    String albumId, {
    String? name,
    String? description,
  }) async {
    // Optimistic update
    final currentAlbums = state.value ?? [];
    final updatedAlbums = currentAlbums.map((album) {
      if (album.id == albumId) {
        return VocabularyAlbum(
          id: album.id,
          name: name ?? album.name,
          description: description ?? album.description,
          wordIds: album.wordIds,
          createdAt: album.createdAt,
        );
      }
      return album;
    }).toList();
    state = AsyncData(updatedAlbums);

    // Note: API call would go here if the backend supports album updates
    // For now, we just update locally
  }

  /// Add a word to an album
  Future<void> addWordToAlbum(String albumId, String wordId) async {
    final repository = ref.read(vocabularyRepositoryProvider);

    // Optimistic update
    final currentAlbums = state.value ?? [];
    final updatedAlbums = currentAlbums.map((album) {
      if (album.id == albumId) {
        if (album.wordIds.contains(wordId)) {
          return album; // Word already in album
        }
        return VocabularyAlbum(
          id: album.id,
          name: album.name,
          description: album.description,
          wordIds: [...album.wordIds, wordId],
          createdAt: album.createdAt,
        );
      }
      return album;
    }).toList();
    state = AsyncData(updatedAlbums);

    try {
      await repository.addWordToAlbum(word: wordId, albumId: albumId);
      // Invalidate the album detail provider to refresh
      ref.invalidate(albumDetailProvider(albumId));
    } catch (e) {
      // Revert on error
      state = AsyncData(currentAlbums);
      rethrow;
    }
  }

  /// Remove a word from an album
  Future<void> removeWordFromAlbum(String albumId, String wordId) async {
    final repository = ref.read(vocabularyRepositoryProvider);

    // Optimistic update
    final currentAlbums = state.value ?? [];
    final updatedAlbums = currentAlbums.map((album) {
      if (album.id == albumId) {
        return VocabularyAlbum(
          id: album.id,
          name: album.name,
          description: album.description,
          wordIds: album.wordIds.where((id) => id != wordId).toList(),
          createdAt: album.createdAt,
        );
      }
      return album;
    }).toList();
    state = AsyncData(updatedAlbums);

    try {
      await repository.removeWordFromAlbum(word: wordId, albumId: albumId);
      // Invalidate the album detail provider to refresh
      ref.invalidate(albumDetailProvider(albumId));
    } catch (e) {
      // Revert on error
      state = AsyncData(currentAlbums);
      rethrow;
    }
  }
}

/// Provider for getting words in an album with their vocabulary details
@riverpod
Future<List<String>> albumWords(Ref ref, String albumId) async {
  final albumAsync = await ref.watch(albumDetailProvider(albumId).future);
  return albumAsync?.wordIds ?? [];
}
