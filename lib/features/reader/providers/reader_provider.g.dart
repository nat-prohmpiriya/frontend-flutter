// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReaderNotifier)
const readerProvider = ReaderNotifierFamily._();

final class ReaderNotifierProvider
    extends $NotifierProvider<ReaderNotifier, ReaderState> {
  const ReaderNotifierProvider._({
    required ReaderNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'readerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$readerNotifierHash();

  @override
  String toString() {
    return r'readerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReaderNotifier create() => ReaderNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReaderState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReaderState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ReaderNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$readerNotifierHash() => r'15c61dd97c42cbe27ad83684ac7b9af1329eaa10';

final class ReaderNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ReaderNotifier,
          ReaderState,
          ReaderState,
          ReaderState,
          String
        > {
  const ReaderNotifierFamily._()
    : super(
        retry: null,
        name: r'readerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReaderNotifierProvider call(String storySlug) =>
      ReaderNotifierProvider._(argument: storySlug, from: this);

  @override
  String toString() => r'readerProvider';
}

abstract class _$ReaderNotifier extends $Notifier<ReaderState> {
  late final _$args = ref.$arg as String;
  String get storySlug => _$args;

  ReaderState build(String storySlug);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ReaderState, ReaderState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReaderState, ReaderState>,
              ReaderState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
