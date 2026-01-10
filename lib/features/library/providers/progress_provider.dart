import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/progress.dart';
import '../data/progress_repository.dart';

part 'progress_provider.g.dart';

/// Provider for user's overall progress
@riverpod
Future<Progress> userProgress(Ref ref) async {
  final repository = ref.watch(progressRepositoryProvider);
  return repository.getProgress();
}

/// Provider for user statistics
@riverpod
Future<Statistics> userStatistics(Ref ref) async {
  final repository = ref.watch(progressRepositoryProvider);
  return repository.getStatistics();
}

/// Provider for fetching a specific story's progress (read-only)
@riverpod
Future<StoryProgress?> fetchStoryProgress(Ref ref, String slug) async {
  final repository = ref.watch(progressRepositoryProvider);
  return repository.getStoryProgress(slug);
}

/// Notifier for managing story progress updates
@riverpod
class StoryProgressNotifier extends _$StoryProgressNotifier {
  @override
  Future<StoryProgress?> build(String slug) async {
    final repository = ref.watch(progressRepositoryProvider);
    return repository.getStoryProgress(slug);
  }

  /// Update the current reading position
  Future<void> updatePosition({
    required int currentEpisode,
    required int currentPage,
  }) async {
    final repository = ref.read(progressRepositoryProvider);
    final updated = await repository.updateStoryProgress(
      slug: slug,
      currentEpisode: currentEpisode,
      currentPage: currentPage,
      status: 'in_progress',
    );
    state = AsyncData(updated);
  }

  /// Mark the story as completed
  Future<void> markCompleted() async {
    final repository = ref.read(progressRepositoryProvider);
    final current = state.value;
    final updated = await repository.updateStoryProgress(
      slug: slug,
      currentEpisode: current?.currentEpisode ?? 1,
      currentPage: current?.currentPage ?? 1,
      status: 'completed',
    );
    state = AsyncData(updated);
  }

  /// Submit a game result for an episode
  Future<EpisodeGameResult> submitGameResult({
    required int episodeNumber,
    required int score,
    required String tier,
    required int timeTaken,
  }) async {
    final repository = ref.read(progressRepositoryProvider);
    final result = await repository.submitGameResult(
      slug: slug,
      episodeNumber: episodeNumber,
      score: score,
      tier: tier,
      timeTaken: timeTaken,
    );

    // Refresh progress after submitting game result
    ref.invalidateSelf();

    return result;
  }
}
