import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_endpoints.dart';
import '../../../core/models/vocabulary.dart';
import '../../../core/models/progress.dart';

part 'vocabulary_repository.g.dart';

@riverpod
VocabularyRepository vocabularyRepository(Ref ref) {
  return VocabularyRepository(ref.watch(apiClientProvider));
}

class VocabularyRepository {
  final ApiClient _api;

  VocabularyRepository(this._api);

  /// Get vocabulary details for a word
  Future<Vocabulary> getVocabulary(String word) async {
    final response = await _api.get(ApiEndpoints.vocabularyWord(word));
    return Vocabulary.fromJson(response.data as Map<String, dynamic>);
  }

  /// Get all saved words
  Future<List<SavedWord>> getSavedWords() async {
    final response = await _api.get(ApiEndpoints.savedWords);
    final data = response.data as List;
    return data
        .map((json) => SavedWord.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Save a word to user's vocabulary
  Future<SavedWord> saveWord({
    required String word,
    String? albumId,
  }) async {
    final response = await _api.post(
      ApiEndpoints.savedWords,
      data: {
        'word': word,
        if (albumId != null) 'albumId': albumId,
      },
    );
    return SavedWord.fromJson(response.data as Map<String, dynamic>);
  }

  /// Remove a saved word
  Future<void> removeSavedWord(String word) async {
    await _api.delete(ApiEndpoints.vocabularyWord(word));
  }

  /// Update saved word status
  Future<SavedWord> updateWordStatus({
    required String word,
    required String status,
  }) async {
    final response = await _api.put(
      ApiEndpoints.vocabularyWord(word),
      data: {'status': status},
    );
    return SavedWord.fromJson(response.data as Map<String, dynamic>);
  }

  /// Get all vocabulary albums
  Future<List<VocabularyAlbum>> getAlbums() async {
    final response = await _api.get(ApiEndpoints.vocabularyAlbums);
    final data = response.data as List;
    return data
        .map((json) => VocabularyAlbum.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Create a new vocabulary album
  Future<VocabularyAlbum> createAlbum({
    required String name,
    String? description,
  }) async {
    final response = await _api.post(
      ApiEndpoints.vocabularyAlbums,
      data: {
        'name': name,
        if (description != null) 'description': description,
      },
    );
    return VocabularyAlbum.fromJson(response.data as Map<String, dynamic>);
  }

  /// Delete a vocabulary album
  Future<void> deleteAlbum(String albumId) async {
    await _api.delete('${ApiEndpoints.vocabularyAlbums}/$albumId');
  }

  /// Add word to album
  Future<void> addWordToAlbum({
    required String word,
    required String albumId,
  }) async {
    await _api.post(
      '${ApiEndpoints.vocabularyAlbums}/$albumId/words',
      data: {'word': word},
    );
  }

  /// Remove word from album
  Future<void> removeWordFromAlbum({
    required String word,
    required String albumId,
  }) async {
    await _api.delete('${ApiEndpoints.vocabularyAlbums}/$albumId/words/$word');
  }
}
