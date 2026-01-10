import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/progress.dart';
import '../../../../core/models/statistics.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/statistics_provider.dart';
import '../widgets/achievement_badge.dart';
import '../widgets/activity_list.dart';
import '../widgets/reading_progress_chart.dart';
import '../widgets/streak_display.dart';
import '../widgets/summary_card.dart';
import '../widgets/vocabulary_progress_chart.dart';

/// Main statistics screen with user learning progress
class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statisticsAsync = ref.watch(userStatisticsProvider);
    final weeklyActivityAsync = ref.watch(weeklyActivityProvider);
    final monthlyActivityAsync = ref.watch(monthlyActivityProvider);
    final vocabularyStatsAsync = ref.watch(vocabularyStatsProvider);
    final achievementsAsync = ref.watch(achievementsProvider);
    final recentActivityAsync = ref.watch(recentActivityProvider);

    // Get streak and coins from statistics
    final streakDays = statisticsAsync.maybeWhen(
      data: (stats) => stats.streakDays,
      orElse: () => 0,
    );
    final totalCoins = statisticsAsync.maybeWhen(
      data: (stats) => stats.totalCoins,
      orElse: () => 0,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _Header(coins: totalCoins),
              ),
            ),
            // Content
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Streak Display
                  StreakDisplay(
                    streakDays: streakDays,
                    weekActivity: _getWeekActivity(weeklyActivityAsync),
                  ),
                  const SizedBox(height: 16),
                  // Summary Cards Row
                  statisticsAsync.when(
                    data: (stats) => _SummaryCardsRow(statistics: stats),
                    loading: () => const _SummaryCardsLoading(),
                    error: (_, __) => const _SummaryCardsError(),
                  ),
                  const SizedBox(height: 16),
                  // Reading Progress Chart
                  _buildReadingChart(weeklyActivityAsync, monthlyActivityAsync),
                  const SizedBox(height: 16),
                  // Vocabulary Progress Chart
                  vocabularyStatsAsync.when(
                    data: (stats) => VocabularyProgressChart(stats: stats),
                    loading: () => const _ChartLoading(),
                    error: (_, __) => const _ChartError(title: 'Vocabulary'),
                  ),
                  const SizedBox(height: 16),
                  // Achievements
                  achievementsAsync.when(
                    data: (achievements) => AchievementGrid(
                      achievements: achievements,
                      showDetails: false,
                    ),
                    loading: () => const _AchievementsLoading(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 16),
                  // Recent Activity
                  recentActivityAsync.when(
                    data: (activities) => ActivityList(activities: activities),
                    loading: () => const _ActivityLoading(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 24),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<bool> _getWeekActivity(AsyncValue<List<DailyActivity>> asyncValue) {
    return asyncValue.maybeWhen(
      data: (activities) {
        return activities.map((a) => a.minutesSpent > 0).toList();
      },
      orElse: () => List.filled(7, false),
    );
  }

  Widget _buildReadingChart(
    AsyncValue<List<DailyActivity>> weeklyAsync,
    AsyncValue<List<DailyActivity>> monthlyAsync,
  ) {
    final weeklyData = weeklyAsync.maybeWhen(
      data: (data) => data,
      orElse: () => <DailyActivity>[],
    );
    final monthlyData = monthlyAsync.maybeWhen(
      data: (data) => data,
      orElse: () => <DailyActivity>[],
    );

    if (weeklyAsync.isLoading && monthlyAsync.isLoading) {
      return const _ChartLoading();
    }

    return ReadingProgressChart(
      weeklyData: weeklyData,
      monthlyData: monthlyData,
    );
  }
}

class _Header extends StatelessWidget {
  final int coins;

  const _Header({required this.coins});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.bar_chart,
                    color: AppColors.primary,
                    size: 28,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Track your learning progress',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        // Coins display
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.secondary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: AppColors.secondary,
                size: 20,
              ),
              const SizedBox(width: 6),
              Text(
                '$coins',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummaryCardsRow extends StatelessWidget {
  final Statistics statistics;

  const _SummaryCardsRow({required this.statistics});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: [
        SummaryCards.storiesRead(
          count: statistics.storiesCompleted,
          trend: '+2',
        ),
        SummaryCards.wordsLearned(
          count: statistics.wordsLearned,
          trend: '+5',
        ),
        SummaryCards.totalReadingTime(
          minutes: statistics.totalReadingTime,
          trend: '+15m',
        ),
        SummaryCards.quizzesTaken(
          count: statistics.quizzesTaken,
          trend: '+1',
        ),
      ],
    );
  }
}

class _SummaryCardsLoading extends StatelessWidget {
  const _SummaryCardsLoading();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: List.generate(4, (_) => const _ShimmerCard()),
    );
  }
}

class _SummaryCardsError extends StatelessWidget {
  const _SummaryCardsError();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: [
        SummaryCards.storiesRead(count: 0),
        SummaryCards.wordsLearned(count: 0),
        SummaryCards.totalReadingTime(minutes: 0),
        SummaryCards.quizzesTaken(count: 0),
      ],
    );
  }
}

class _ShimmerCard extends StatelessWidget {
  const _ShimmerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

class _ChartLoading extends StatelessWidget {
  const _ChartLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

class _ChartError extends StatelessWidget {
  final String title;

  const _ChartError({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          'Failed to load $title chart',
          style: const TextStyle(color: AppColors.textSecondary),
        ),
      ),
    );
  }
}

class _AchievementsLoading extends StatelessWidget {
  const _AchievementsLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

class _ActivityLoading extends StatelessWidget {
  const _ActivityLoading();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}
