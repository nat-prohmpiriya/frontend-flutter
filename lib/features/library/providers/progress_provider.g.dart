// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for user's overall progress

@ProviderFor(userProgress)
const userProgressProvider = UserProgressProvider._();

/// Provider for user's overall progress

final class UserProgressProvider
    extends
        $FunctionalProvider<AsyncValue<Progress>, Progress, FutureOr<Progress>>
    with $FutureModifier<Progress>, $FutureProvider<Progress> {
  /// Provider for user's overall progress
  const UserProgressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProgressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProgressHash();

  @$internal
  @override
  $FutureProviderElement<Progress> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Progress> create(Ref ref) {
    return userProgress(ref);
  }
}

String _$userProgressHash() => r'935a7b5787fcb1ac4b03f7012ce332e466be0cf6';

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

/// Provider for fetching a specific story's progress (read-only)

@ProviderFor(fetchStoryProgress)
const fetchStoryProgressProvider = FetchStoryProgressFamily._();

/// Provider for fetching a specific story's progress (read-only)

final class FetchStoryProgressProvider
    extends
        $FunctionalProvider<
          AsyncValue<StoryProgress?>,
          StoryProgress?,
          FutureOr<StoryProgress?>
        >
    with $FutureModifier<StoryProgress?>, $FutureProvider<StoryProgress?> {
  /// Provider for fetching a specific story's progress (read-only)
  const FetchStoryProgressProvider._({
    required FetchStoryProgressFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchStoryProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchStoryProgressHash();

  @override
  String toString() {
    return r'fetchStoryProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<StoryProgress?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<StoryProgress?> create(Ref ref) {
    final argument = this.argument as String;
    return fetchStoryProgress(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchStoryProgressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchStoryProgressHash() =>
    r'977abf98fcd4dfb0b62bf63c9c4f7fce31c3ec4e';

/// Provider for fetching a specific story's progress (read-only)

final class FetchStoryProgressFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<StoryProgress?>, String> {
  const FetchStoryProgressFamily._()
    : super(
        retry: null,
        name: r'fetchStoryProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for fetching a specific story's progress (read-only)

  FetchStoryProgressProvider call(String slug) =>
      FetchStoryProgressProvider._(argument: slug, from: this);

  @override
  String toString() => r'fetchStoryProgressProvider';
}

/// Notifier for managing story progress updates

@ProviderFor(StoryProgressNotifier)
const storyProgressProvider = StoryProgressNotifierFamily._();

/// Notifier for managing story progress updates
final class StoryProgressNotifierProvider
    extends $AsyncNotifierProvider<StoryProgressNotifier, StoryProgress?> {
  /// Notifier for managing story progress updates
  const StoryProgressNotifierProvider._({
    required StoryProgressNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'storyProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storyProgressNotifierHash();

  @override
  String toString() {
    return r'storyProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  StoryProgressNotifier create() => StoryProgressNotifier();

  @override
  bool operator ==(Object other) {
    return other is StoryProgressNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storyProgressNotifierHash() =>
    r'217c63b155743068e180df0c2c16aba05be87fc2';

/// Notifier for managing story progress updates

final class StoryProgressNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          StoryProgressNotifier,
          AsyncValue<StoryProgress?>,
          StoryProgress?,
          FutureOr<StoryProgress?>,
          String
        > {
  const StoryProgressNotifierFamily._()
    : super(
        retry: null,
        name: r'storyProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Notifier for managing story progress updates

  StoryProgressNotifierProvider call(String slug) =>
      StoryProgressNotifierProvider._(argument: slug, from: this);

  @override
  String toString() => r'storyProgressProvider';
}

/// Notifier for managing story progress updates

abstract class _$StoryProgressNotifier extends $AsyncNotifier<StoryProgress?> {
  late final _$args = ref.$arg as String;
  String get slug => _$args;

  FutureOr<StoryProgress?> build(String slug);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<StoryProgress?>, StoryProgress?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<StoryProgress?>, StoryProgress?>,
              AsyncValue<StoryProgress?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
