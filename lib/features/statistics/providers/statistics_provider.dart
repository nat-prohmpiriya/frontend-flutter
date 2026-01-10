import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/progress.dart';
import '../../../core/models/statistics.dart';
import '../../library/data/progress_repository.dart';

part 'statistics_provider.g.dart';

/// Provider for user statistics
@riverpod
Future<Statistics> userStatistics(Ref ref) async {
  final repository = ref.watch(progressRepositoryProvider);
  return repository.getStatistics();
}

/// Provider for weekly activity data (last 7 days)
@riverpod
Future<List<DailyActivity>> weeklyActivity(Ref ref) async {
  // Generate mock data for now - in production, this would fetch from API
  final now = DateTime.now();
  return List.generate(7, (index) {
    final date = now.subtract(Duration(days: 6 - index));
    return DailyActivity(
      date: date,
      pagesRead: (index * 3 + 5) % 20 + 2,
      minutesSpent: (index * 7 + 10) % 45 + 5,
      wordsLearned: (index * 2 + 3) % 10 + 1,
      quizzesTaken: index % 3,
    );
  });
}

/// Provider for monthly activity data (last 30 days)
@riverpod
Future<List<DailyActivity>> monthlyActivity(Ref ref) async {
  // Generate mock data for now - in production, this would fetch from API
  final now = DateTime.now();
  return List.generate(30, (index) {
    final date = now.subtract(Duration(days: 29 - index));
    return DailyActivity(
      date: date,
      pagesRead: (index * 3 + 5) % 25 + 2,
      minutesSpent: (index * 7 + 10) % 60 + 5,
      wordsLearned: (index * 2 + 3) % 15 + 1,
      quizzesTaken: index % 4,
    );
  });
}

/// Provider for user achievements
@riverpod
Future<List<Achievement>> achievements(Ref ref) async {
  // Mock achievements data - in production, this would fetch from API
  return [
    Achievement(
      id: 'first_story',
      name: 'First Story',
      description: 'Complete your first story',
      iconUrl: 'assets/icons/achievement_book.png',
      earnedAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
    Achievement(
      id: 'word_collector_10',
      name: 'Word Collector',
      description: 'Save 10 words to your vocabulary',
      iconUrl: 'assets/icons/achievement_words.png',
      earnedAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Achievement(
      id: 'streak_7',
      name: 'Week Warrior',
      description: 'Maintain a 7-day streak',
      iconUrl: 'assets/icons/achievement_streak.png',
      earnedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    const Achievement(
      id: 'streak_30',
      name: 'Month Master',
      description: 'Maintain a 30-day streak',
      iconUrl: 'assets/icons/achievement_month.png',
      isLocked: true,
    ),
    const Achievement(
      id: 'quiz_perfect',
      name: 'Perfect Score',
      description: 'Get 100% on any quiz',
      iconUrl: 'assets/icons/achievement_quiz.png',
      isLocked: true,
    ),
    const Achievement(
      id: 'polyglot',
      name: 'Polyglot',
      description: 'Learn 100 words',
      iconUrl: 'assets/icons/achievement_polyglot.png',
      isLocked: true,
    ),
  ];
}

/// Provider for vocabulary statistics
@riverpod
Future<VocabularyStats> vocabularyStats(Ref ref) async {
  // Mock data - in production, this would fetch from API
  return const VocabularyStats(
    learning: 25,
    learned: 42,
    difficult: 8,
    a1Words: 30,
    a2Words: 25,
    b1Words: 15,
    b2Words: 5,
  );
}

/// Provider for recent activity feed
@riverpod
Future<List<ActivityItem>> recentActivity(Ref ref) async {
  // Mock data - in production, this would fetch from API
  final now = DateTime.now();
  return [
    ActivityItem(
      id: '1',
      type: 'story_completed',
      title: 'Story Completed',
      description: 'Finished "The Little Prince" Chapter 3',
      timestamp: now.subtract(const Duration(hours: 2)),
    ),
    ActivityItem(
      id: '2',
      type: 'word_saved',
      title: 'Words Saved',
      description: 'Added 5 new words to vocabulary',
      timestamp: now.subtract(const Duration(hours: 5)),
    ),
    ActivityItem(
      id: '3',
      type: 'quiz_result',
      title: 'Quiz Completed',
      description: 'Scored 85% on vocabulary quiz',
      timestamp: now.subtract(const Duration(days: 1)),
      metadata: {'score': 85},
    ),
    ActivityItem(
      id: '4',
      type: 'achievement',
      title: 'Achievement Unlocked',
      description: 'Earned "Word Collector" badge',
      timestamp: now.subtract(const Duration(days: 2)),
    ),
    ActivityItem(
      id: '5',
      type: 'story_completed',
      title: 'Story Completed',
      description: 'Finished "Alice in Wonderland" Chapter 1',
      timestamp: now.subtract(const Duration(days: 3)),
    ),
  ];
}
