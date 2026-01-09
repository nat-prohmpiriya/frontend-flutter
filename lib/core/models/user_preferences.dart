import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

enum FontSize { small, medium, large }

@freezed
abstract class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default(FontSize.medium) FontSize fontSize,
    @Default(false) bool darkMode,
    @Default(true) bool notifications,
    @Default(true) bool soundEffects,
    @Default('th') String appLanguage,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}
