// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for fetching vocabulary details for a specific word

@ProviderFor(vocabularyDetail)
const vocabularyDetailProvider = VocabularyDetailFamily._();

/// Provider for fetching vocabulary details for a specific word

final class VocabularyDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Vocabulary>,
          Vocabulary,
          FutureOr<Vocabulary>
        >
    with $FutureModifier<Vocabulary>, $FutureProvider<Vocabulary> {
  /// Provider for fetching vocabulary details for a specific word
  const VocabularyDetailProvider._({
    required VocabularyDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'vocabularyDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vocabularyDetailHash();

  @override
  String toString() {
    return r'vocabularyDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Vocabulary> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Vocabulary> create(Ref ref) {
    final argument = this.argument as String;
    return vocabularyDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VocabularyDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vocabularyDetailHash() => r'c36d0eeedac4e6b633850bf81b914d0a3cf054b4';

/// Provider for fetching vocabulary details for a specific word

final class VocabularyDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Vocabulary>, String> {
  const VocabularyDetailFamily._()
    : super(
        retry: null,
        name: r'vocabularyDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider for fetching vocabulary details for a specific word

  VocabularyDetailProvider call(String word) =>
      VocabularyDetailProvider._(argument: word, from: this);

  @override
  String toString() => r'vocabularyDetailProvider';
}

/// Notifier for managing saved words

@ProviderFor(SavedWordsNotifier)
const savedWordsProvider = SavedWordsNotifierProvider._();

/// Notifier for managing saved words
final class SavedWordsNotifierProvider
    extends $AsyncNotifierProvider<SavedWordsNotifier, List<SavedWord>> {
  /// Notifier for managing saved words
  const SavedWordsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedWordsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedWordsNotifierHash();

  @$internal
  @override
  SavedWordsNotifier create() => SavedWordsNotifier();
}

String _$savedWordsNotifierHash() =>
    r'81a92fe572c195256f765b64e4ed6105c34b792f';

/// Notifier for managing saved words

abstract class _$SavedWordsNotifier extends $AsyncNotifier<List<SavedWord>> {
  FutureOr<List<SavedWord>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<SavedWord>>, List<SavedWord>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SavedWord>>, List<SavedWord>>,
              AsyncValue<List<SavedWord>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider to check if a specific word is saved

@ProviderFor(isWordSaved)
const isWordSavedProvider = IsWordSavedFamily._();

/// Provider to check if a specific word is saved

final class IsWordSavedProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Provider to check if a specific word is saved
  const IsWordSavedProvider._({
    required IsWordSavedFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isWordSavedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isWordSavedHash();

  @override
  String toString() {
    return r'isWordSavedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as String;
    return isWordSaved(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsWordSavedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isWordSavedHash() => r'c6a2497b6796b7a26921410c462c31f2f56e11e9';

/// Provider to check if a specific word is saved

final class IsWordSavedFamily extends $Family
    with $FunctionalFamilyOverride<bool, String> {
  const IsWordSavedFamily._()
    : super(
        retry: null,
        name: r'isWordSavedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider to check if a specific word is saved

  IsWordSavedProvider call(String word) =>
      IsWordSavedProvider._(argument: word, from: this);

  @override
  String toString() => r'isWordSavedProvider';
}
