// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AudioPlayer)
const audioPlayerProvider = AudioPlayerProvider._();

final class AudioPlayerProvider
    extends $NotifierProvider<AudioPlayer, AudioState> {
  const AudioPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioPlayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioPlayerHash();

  @$internal
  @override
  AudioPlayer create() => AudioPlayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AudioState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AudioState>(value),
    );
  }
}

String _$audioPlayerHash() => r'50c3a48288d31147fc45dd8d0be25b6bc6aa7df4';

abstract class _$AudioPlayer extends $Notifier<AudioState> {
  AudioState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AudioState, AudioState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AudioState, AudioState>,
              AudioState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
