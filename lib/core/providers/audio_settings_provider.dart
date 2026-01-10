import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'preferences_provider.dart';

part 'audio_settings_provider.freezed.dart';
part 'audio_settings_provider.g.dart';

const _audioSettingsKey = 'audio_settings';

@freezed
abstract class AudioSettingsState with _$AudioSettingsState {
  const factory AudioSettingsState({
    @Default(1.0) double speed,
    @Default('us') String accent,
  }) = _AudioSettingsState;

  factory AudioSettingsState.fromJson(Map<String, dynamic> json) =>
      _$AudioSettingsStateFromJson(json);
}

@riverpod
class AudioSettings extends _$AudioSettings {
  @override
  FutureOr<AudioSettingsState> build() async {
    return _loadSettings();
  }

  Future<AudioSettingsState> _loadSettings() async {
    try {
      final prefs = await ref.read(sharedPreferencesProvider.future);
      final jsonString = prefs.getString(_audioSettingsKey);
      if (jsonString != null) {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        return AudioSettingsState.fromJson(json);
      }
    } catch (e) {
      // Return default settings on error
    }
    return const AudioSettingsState();
  }

  Future<void> _saveSettings(AudioSettingsState settings) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final jsonString = jsonEncode(settings.toJson());
    await prefs.setString(_audioSettingsKey, jsonString);
  }

  /// Set playback speed
  Future<void> setSpeed(double speed) async {
    final current = await future;
    final updated = current.copyWith(speed: speed);
    state = AsyncData(updated);
    await _saveSettings(updated);
  }

  /// Set accent preference (us/uk)
  Future<void> setAccent(String accent) async {
    final current = await future;
    final updated = current.copyWith(accent: accent);
    state = AsyncData(updated);
    await _saveSettings(updated);
  }
}

/// Available playback speeds
const List<double> availablePlaybackSpeeds = [
  0.5,
  0.75,
  1.0,
  1.25,
  1.5,
  2.0,
];

/// Available accents
const List<String> availableAccents = ['us', 'uk'];

/// Display label for speed
String speedLabel(double speed) {
  if (speed == 1.0) return '1x';
  if (speed == speed.toInt()) return '${speed.toInt()}x';
  return '${speed}x';
}

/// Display label for accent
String accentLabel(String accent) {
  switch (accent.toLowerCase()) {
    case 'us':
      return 'US';
    case 'uk':
      return 'UK';
    default:
      return accent.toUpperCase();
  }
}
