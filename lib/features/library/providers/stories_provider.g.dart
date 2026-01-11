// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StoriesFilter)
const storiesFilterProvider = StoriesFilterProvider._();

final class StoriesFilterProvider
    extends
        $NotifierProvider<
          StoriesFilter,
          ({String? category, String? level, String? search})
        > {
  const StoriesFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storiesFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storiesFilterHash();

  @$internal
  @override
  StoriesFilter create() => StoriesFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({String? category, String? level, String? search}) value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({String? category, String? level, String? search})
          >(value),
    );
  }
}

String _$storiesFilterHash() => r'682d5e1bed919e8f877e067e4d130733288142d1';

abstract class _$StoriesFilter
    extends $Notifier<({String? category, String? level, String? search})> {
  ({String? category, String? level, String? search}) build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              ({String? category, String? level, String? search}),
              ({String? category, String? level, String? search})
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({String? category, String? level, String? search}),
                ({String? category, String? level, String? search})
              >,
              ({String? category, String? level, String? search}),
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(stories)
const storiesProvider = StoriesProvider._();

final class StoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Story>>,
          List<Story>,
          FutureOr<List<Story>>
        >
    with $FutureModifier<List<Story>>, $FutureProvider<List<Story>> {
  const StoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storiesHash();

  @$internal
  @override
  $FutureProviderElement<List<Story>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Story>> create(Ref ref) {
    return stories(ref);
  }
}

String _$storiesHash() => r'c57f85b9a1984d8dc6912a4ceb940ec891b8b898';

@ProviderFor(storyDetail)
const storyDetailProvider = StoryDetailFamily._();

final class StoryDetailProvider
    extends $FunctionalProvider<AsyncValue<Story>, Story, FutureOr<Story>>
    with $FutureModifier<Story>, $FutureProvider<Story> {
  const StoryDetailProvider._({
    required StoryDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'storyDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storyDetailHash();

  @override
  String toString() {
    return r'storyDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Story> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Story> create(Ref ref) {
    final argument = this.argument as String;
    return storyDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is StoryDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storyDetailHash() => r'6d4017e31dd16c8ccab5852d96c4d251ec8c289e';

final class StoryDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Story>, String> {
  const StoryDetailFamily._()
    : super(
        retry: null,
        name: r'storyDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StoryDetailProvider call(String slug) =>
      StoryDetailProvider._(argument: slug, from: this);

  @override
  String toString() => r'storyDetailProvider';
}
