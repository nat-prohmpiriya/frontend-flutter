import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

/// Daily activity data for charts
@freezed
abstract class DailyActivity with _$DailyActivity {
  const factory DailyActivity({
    required DateTime date,
    @Default(0) int pagesRead,
    @Default(0) int minutesSpent,
    @Default(0) int wordsLearned,
    @Default(0) int quizzesTaken,
  }) = _DailyActivity;

  factory DailyActivity.fromJson(Map<String, dynamic> json) =>
      _$DailyActivityFromJson(json);
}

/// Achievement model
@freezed
abstract class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String name,
    required String description,
    required String iconUrl,
    DateTime? earnedAt,
    @Default(false) bool isLocked,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

/// Recent activity item for activity feed
@freezed
abstract class ActivityItem with _$ActivityItem {
  const factory ActivityItem({
    required String id,
    required String type, // story_completed, word_saved, quiz_result, achievement
    required String title,
    required String description,
    required DateTime timestamp,
    String? iconUrl,
    Map<String, dynamic>? metadata,
  }) = _ActivityItem;

  factory ActivityItem.fromJson(Map<String, dynamic> json) =>
      _$ActivityItemFromJson(json);
}

/// Vocabulary stats by status and level
@freezed
abstract class VocabularyStats with _$VocabularyStats {
  const factory VocabularyStats({
    @Default(0) int learning,
    @Default(0) int learned,
    @Default(0) int difficult,
    @Default(0) int a1Words,
    @Default(0) int a2Words,
    @Default(0) int b1Words,
    @Default(0) int b2Words,
  }) = _VocabularyStats;

  factory VocabularyStats.fromJson(Map<String, dynamic> json) =>
      _$VocabularyStatsFromJson(json);
}

/// Extended statistics with all chart data
@freezed
abstract class ExtendedStatistics with _$ExtendedStatistics {
  const factory ExtendedStatistics({
    @Default(0) int totalReadingTime,
    @Default(0) int storiesCompleted,
    @Default(0) int wordsLearned,
    @Default(0) int quizzesTaken,
    @Default(0) int streakDays,
    @Default(0) int totalCoins,
    @Default(0) int voiceRecordings,
    @Default(0.0) double averageScore,
    @Default([]) List<DailyActivity> weeklyActivity,
    VocabularyStats? vocabularyStats,
    @Default([]) List<Achievement> achievements,
    @Default([]) List<ActivityItem> recentActivity,
  }) = _ExtendedStatistics;

  factory ExtendedStatistics.fromJson(Map<String, dynamic> json) =>
      _$ExtendedStatisticsFromJson(json);
}
