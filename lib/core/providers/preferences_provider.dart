import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_preferences.dart';

part 'preferences_provider.g.dart';

const _preferencesKey = 'user_preferences';

/// SharedPreferences instance provider
@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return SharedPreferences.getInstance();
}

/// User preferences provider with local persistence
@riverpod
class AppPreferencesNotifier extends _$AppPreferencesNotifier {
  @override
  FutureOr<UserPreferences> build() async {
    return _loadPreferences();
  }

  Future<UserPreferences> _loadPreferences() async {
    try {
      final prefs = await ref.read(sharedPreferencesProvider.future);
      final jsonString = prefs.getString(_preferencesKey);
      if (jsonString != null) {
        final json = jsonDecode(jsonString) as Map<String, dynamic>;
        return UserPreferences.fromJson(json);
      }
    } catch (e) {
      // Return default preferences on error
    }
    return const UserPreferences();
  }

  Future<void> _savePreferences(UserPreferences preferences) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final jsonString = jsonEncode(preferences.toJson());
    await prefs.setString(_preferencesKey, jsonString);
  }

  /// Update font size
  Future<void> setFontSize(FontSize fontSize) async {
    final current = await future;
    final updated = current.copyWith(fontSize: fontSize);
    state = AsyncData(updated);
    await _savePreferences(updated);
  }

  /// Toggle dark mode
  Future<void> setDarkMode(bool enabled) async {
    final current = await future;
    final updated = current.copyWith(darkMode: enabled);
    state = AsyncData(updated);
    await _savePreferences(updated);
  }

  /// Toggle notifications
  Future<void> setNotifications(bool enabled) async {
    final current = await future;
    final updated = current.copyWith(notifications: enabled);
    state = AsyncData(updated);
    await _savePreferences(updated);
  }

  /// Toggle sound effects
  Future<void> setSoundEffects(bool enabled) async {
    final current = await future;
    final updated = current.copyWith(soundEffects: enabled);
    state = AsyncData(updated);
    await _savePreferences(updated);
  }

  /// Set app language
  Future<void> setAppLanguage(String language) async {
    final current = await future;
    final updated = current.copyWith(appLanguage: language);
    state = AsyncData(updated);
    await _savePreferences(updated);
  }
}

/// Theme mode provider based on preferences
@riverpod
Future<bool> isDarkMode(Ref ref) async {
  final prefs = await ref.watch(appPreferencesProvider.future);
  return prefs.darkMode;
}
