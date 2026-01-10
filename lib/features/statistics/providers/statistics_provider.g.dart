// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for user statistics

@ProviderFor(userStatistics)
const userStatisticsProvider = UserStatisticsProvider._();

/// Provider for user statistics

final class UserStatisticsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Statistics>,
          Statistics,
          FutureOr<Statistics>
        >
    with $FutureModifier<Statistics>, $FutureProvider<Statistics> {
  /// Provider for user statistics
  const UserStatisticsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userStatisticsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userStatisticsHash();

  @$internal
  @override
  $FutureProviderElement<Statistics> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Statistics> create(Ref ref) {
    return userStatistics(ref);
  }
}

String _$userStatisticsHash() => r'9a8e291d3f69fdee6538a4ba33a69aa5b2feb662';

/// Provider for weekly activity data (last 7 days)

@ProviderFor(weeklyActivity)
const weeklyActivityProvider = WeeklyActivityProvider._();

/// Provider for weekly activity data (last 7 days)

final class WeeklyActivityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DailyActivity>>,
          List<DailyActivity>,
          FutureOr<List<DailyActivity>>
        >
    with
        $FutureModifier<List<DailyActivity>>,
        $FutureProvider<List<DailyActivity>> {
  /// Provider for weekly activity data (last 7 days)
  const WeeklyActivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weeklyActivityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weeklyActivityHash();

  @$internal
  @override
  $FutureProviderElement<List<DailyActivity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DailyActivity>> create(Ref ref) {
    return weeklyActivity(ref);
  }
}

String _$weeklyActivityHash() => r'7fc85549c1c235ff04853c430177d64eefda3736';

/// Provider for monthly activity data (last 30 days)

@ProviderFor(monthlyActivity)
const monthlyActivityProvider = MonthlyActivityProvider._();

/// Provider for monthly activity data (last 30 days)

final class MonthlyActivityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DailyActivity>>,
          List<DailyActivity>,
          FutureOr<List<DailyActivity>>
        >
    with
        $FutureModifier<List<DailyActivity>>,
        $FutureProvider<List<DailyActivity>> {
  /// Provider for monthly activity data (last 30 days)
  const MonthlyActivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyActivityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyActivityHash();

  @$internal
  @override
  $FutureProviderElement<List<DailyActivity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DailyActivity>> create(Ref ref) {
    return monthlyActivity(ref);
  }
}

String _$monthlyActivityHash() => r'4d94a8b3de790d46a19e3690360378b74c88901d';

/// Provider for user achievements

@ProviderFor(achievements)
const achievementsProvider = AchievementsProvider._();

/// Provider for user achievements

final class AchievementsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Achievement>>,
          List<Achievement>,
          FutureOr<List<Achievement>>
        >
    with
        $FutureModifier<List<Achievement>>,
        $FutureProvider<List<Achievement>> {
  /// Provider for user achievements
  const AchievementsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'achievementsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$achievementsHash();

  @$internal
  @override
  $FutureProviderElement<List<Achievement>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Achievement>> create(Ref ref) {
    return achievements(ref);
  }
}

String _$achievementsHash() => r'260398fd88f46be468626bd5eda35883f1133f64';

/// Provider for vocabulary statistics

@ProviderFor(vocabularyStats)
const vocabularyStatsProvider = VocabularyStatsProvider._();

/// Provider for vocabulary statistics

final class VocabularyStatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<VocabularyStats>,
          VocabularyStats,
          FutureOr<VocabularyStats>
        >
    with $FutureModifier<VocabularyStats>, $FutureProvider<VocabularyStats> {
  /// Provider for vocabulary statistics
  const VocabularyStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vocabularyStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vocabularyStatsHash();

  @$internal
  @override
  $FutureProviderElement<VocabularyStats> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VocabularyStats> create(Ref ref) {
    return vocabularyStats(ref);
  }
}

String _$vocabularyStatsHash() => r'3d3ac69656234c5473cf3171e5ea7e0ea0f01cd9';

/// Provider for recent activity feed

@ProviderFor(recentActivity)
const recentActivityProvider = RecentActivityProvider._();

/// Provider for recent activity feed

final class RecentActivityProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ActivityItem>>,
          List<ActivityItem>,
          FutureOr<List<ActivityItem>>
        >
    with
        $FutureModifier<List<ActivityItem>>,
        $FutureProvider<List<ActivityItem>> {
  /// Provider for recent activity feed
  const RecentActivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentActivityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentActivityHash();

  @$internal
  @override
  $FutureProviderElement<List<ActivityItem>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ActivityItem>> create(Ref ref) {
    return recentActivity(ref);
  }
}

String _$recentActivityHash() => r'10475b559079424388c7e5abb5651b26af812182';
