// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_settings_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AudioSettingsState _$AudioSettingsStateFromJson(Map<String, dynamic> json) =>
    _AudioSettingsState(
      speed: (json['speed'] as num?)?.toDouble() ?? 1.0,
      accent: json['accent'] as String? ?? 'us',
    );

Map<String, dynamic> _$AudioSettingsStateToJson(_AudioSettingsState instance) =>
    <String, dynamic>{'speed': instance.speed, 'accent': instance.accent};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AudioSettings)
const audioSettingsProvider = AudioSettingsProvider._();

final class AudioSettingsProvider
    extends $AsyncNotifierProvider<AudioSettings, AudioSettingsState> {
  const AudioSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioSettingsHash();

  @$internal
  @override
  AudioSettings create() => AudioSettings();
}

String _$audioSettingsHash() => r'cbddada0bd6d94d0c8acb4d45b0a35e282c51b8e';

abstract class _$AudioSettings extends $AsyncNotifier<AudioSettingsState> {
  FutureOr<AudioSettingsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<AudioSettingsState>, AudioSettingsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AudioSettingsState>, AudioSettingsState>,
              AsyncValue<AudioSettingsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
