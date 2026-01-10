import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress.freezed.dart';
part 'progress.g.dart';

@freezed
abstract class Progress with _$Progress {
  const factory Progress({
    required String odId,
    @Default({}) Map<String, StoryProgress> stories,
    @Default([]) List<SavedWord> savedWords,
    @Default([]) List<String> achievements,
    Statistics? statistics,
  }) = _Progress;

  factory Progress.fromJson(Map<String, dynamic> json) =>
      _$ProgressFromJson(json);
}

@freezed
abstract class StoryProgress with _$StoryProgress {
  const factory StoryProgress({
    required String status, // not_started, in_progress, completed
    @Default(1) int currentEpisode,
    @Default(1) int currentPage,
    @Default(0) int roundsCompleted,
    DateTime? lastAccessedAt,
    DateTime? completedAt,
    @Default({}) Map<int, EpisodeGameResult> episodeGames,
  }) = _StoryProgress;

  factory StoryProgress.fromJson(Map<String, dynamic> json) =>
      _$StoryProgressFromJson(json);
}

@freezed
abstract class EpisodeGameResult with _$EpisodeGameResult {
  const factory EpisodeGameResult({
    @Default(false) bool completed,
    @Default(0) int score,
    @Default('fail') String tier, // fail, pass, good, perfect
    @Default(0) int coinsEarned,
    @Default(0) int timeTaken,
    @Default(0) int attempts,
  }) = _EpisodeGameResult;

  factory EpisodeGameResult.fromJson(Map<String, dynamic> json) =>
      _$EpisodeGameResultFromJson(json);
}

@freezed
abstract class SavedWord with _$SavedWord {
  const factory SavedWord({
    required String odId,
    required DateTime savedAt,
    @Default('learning') String status, // learning, learned, difficult
    String? albumId,
  }) = _SavedWord;

  factory SavedWord.fromJson(Map<String, dynamic> json) =>
      _$SavedWordFromJson(json);
}

@freezed
abstract class Statistics with _$Statistics {
  const factory Statistics({
    @Default(0) int totalReadingTime,
    @Default(0) int storiesCompleted,
    @Default(0) int wordsLearned,
    @Default(0) int quizzesTaken,
    @Default(0) int streakDays,
    @Default(0) int totalCoins,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}
