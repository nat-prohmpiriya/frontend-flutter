// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for fetching all vocabulary albums

@ProviderFor(vocabularyAlbums)
const vocabularyAlbumsProvider = VocabularyAlbumsProvider._();

/// Provider for fetching all vocabulary albums

final class VocabularyAlbumsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<VocabularyAlbum>>,
          List<VocabularyAlbum>,
          FutureOr<List<VocabularyAlbum>>
        >
    with
        $FutureModifier<List<VocabularyAlbum>>,
        $FutureProvider<List<VocabularyAlbum>> {
  /// Provider for fetching all vocabulary albums
  const VocabularyAlbumsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vocabularyAlbumsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vocabularyAlbumsHash();

  @$internal
  @override
  $FutureProviderElement<List<VocabularyAlbum>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<VocabularyAlbum>> create(Ref ref) {
    return vocabularyAlbums(ref);
  }
}

String _$vocabularyAlbumsHash() => r'1727e73294d9c2b220555b2a4b3ef0416a83393c';

/// Provider for fetching a single album by ID

@ProviderFor(albumDetail)
const albumDetailProvider = AlbumDetailFamily._();

/// Provider for fetching a single album by ID

final class AlbumDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<VocabularyAlbum?>,
          VocabularyAlbum?,
          FutureOr<VocabularyAlbum?>
        >
    with $FutureModifier<VocabularyAlbum?>, $FutureProvider<VocabularyAlbum?> {
  /// Provider for fetching a single album by ID
  const AlbumDetailProvider._({
    required AlbumDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'albumDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$albumDetailHash();

  @override
  String toString() {
    return r'albumDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<VocabularyAlbum?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<VocabularyAlbum?> create(Ref ref) {
    final argument = this.argument as String;
    return albumDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$albumDetailHash() => r'227fd4d1922c7d8d6a38e63bad7d126102dec172';

/// Provider for fetching a single album by ID

final class AlbumDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<VocabularyAlbum?>, String> {
  const AlbumDetailFamily._()
    : super(
        retry: null,
        name: r'albumDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for fetching a single album by ID

  AlbumDetailProvider call(String albumId) =>
      AlbumDetailProvider._(argument: albumId, from: this);

  @override
  String toString() => r'albumDetailProvider';
}

/// Notifier for managing vocabulary albums

@ProviderFor(AlbumsNotifier)
const albumsProvider = AlbumsNotifierProvider._();

/// Notifier for managing vocabulary albums
final class AlbumsNotifierProvider
    extends $AsyncNotifierProvider<AlbumsNotifier, List<VocabularyAlbum>> {
  /// Notifier for managing vocabulary albums
  const AlbumsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'albumsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$albumsNotifierHash();

  @$internal
  @override
  AlbumsNotifier create() => AlbumsNotifier();
}

String _$albumsNotifierHash() => r'a4c437d321e3fbb725d3d73426891297ad0e856c';

/// Notifier for managing vocabulary albums

abstract class _$AlbumsNotifier extends $AsyncNotifier<List<VocabularyAlbum>> {
  FutureOr<List<VocabularyAlbum>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<VocabularyAlbum>>, List<VocabularyAlbum>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<VocabularyAlbum>>,
                List<VocabularyAlbum>
              >,
              AsyncValue<List<VocabularyAlbum>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider for getting words in an album with their vocabulary details

@ProviderFor(albumWords)
const albumWordsProvider = AlbumWordsFamily._();

/// Provider for getting words in an album with their vocabulary details

final class AlbumWordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  /// Provider for getting words in an album with their vocabulary details
  const AlbumWordsProvider._({
    required AlbumWordsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'albumWordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$albumWordsHash();

  @override
  String toString() {
    return r'albumWordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    final argument = this.argument as String;
    return albumWords(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is AlbumWordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$albumWordsHash() => r'abbdb3545712070a47d471f2642bfbd54fbcad76';

/// Provider for getting words in an album with their vocabulary details

final class AlbumWordsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<String>>, String> {
  const AlbumWordsFamily._()
    : super(
        retry: null,
        name: r'albumWordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for getting words in an album with their vocabulary details

  AlbumWordsProvider call(String albumId) =>
      AlbumWordsProvider._(argument: albumId, from: this);

  @override
  String toString() => r'albumWordsProvider';
}
