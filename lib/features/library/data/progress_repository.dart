import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_endpoints.dart';
import '../../../core/models/progress.dart';

part 'progress_repository.g.dart';

@riverpod
ProgressRepository progressRepository(Ref ref) {
  return ProgressRepository(ref.watch(apiClientProvider));
}

class ProgressRepository {
  final ApiClient _api;

  ProgressRepository(this._api);

  /// Get all user progress
  Future<Progress> getProgress() async {
    final response = await _api.get(ApiEndpoints.progress);
    return Progress.fromJson(response.data as Map<String, dynamic>);
  }

  /// Get progress for a specific story
  Future<StoryProgress?> getStoryProgress(String slug) async {
    final response = await _api.get(ApiEndpoints.storyProgress(slug));
    if (response.data == null) return null;
    return StoryProgress.fromJson(response.data as Map<String, dynamic>);
  }

  /// Update progress for a specific story
  Future<StoryProgress> updateStoryProgress({
    required String slug,
    required int currentEpisode,
    required int currentPage,
    String? status,
  }) async {
    final response = await _api.put(
      ApiEndpoints.storyProgress(slug),
      data: {
        'currentEpisode': currentEpisode,
        'currentPage': currentPage,
        if (status != null) 'status': status,
      },
    );
    return StoryProgress.fromJson(response.data as Map<String, dynamic>);
  }

  /// Get user statistics
  Future<Statistics> getStatistics() async {
    final response = await _api.get(ApiEndpoints.progressStatistics);
    return Statistics.fromJson(response.data as Map<String, dynamic>);
  }

  /// Submit game result for an episode
  Future<EpisodeGameResult> submitGameResult({
    required String slug,
    required int episodeNumber,
    required int score,
    required String tier,
    required int timeTaken,
  }) async {
    final response = await _api.post(
      ApiEndpoints.progressGames,
      data: {
        'storySlug': slug,
        'episodeNumber': episodeNumber,
        'score': score,
        'tier': tier,
        'timeTaken': timeTaken,
      },
    );
    return EpisodeGameResult.fromJson(response.data as Map<String, dynamic>);
  }
}
