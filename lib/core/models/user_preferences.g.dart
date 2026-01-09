// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    _UserPreferences(
      fontSize:
          $enumDecodeNullable(_$FontSizeEnumMap, json['fontSize']) ??
          FontSize.medium,
      darkMode: json['darkMode'] as bool? ?? false,
      notifications: json['notifications'] as bool? ?? true,
      soundEffects: json['soundEffects'] as bool? ?? true,
      appLanguage: json['appLanguage'] as String? ?? 'th',
    );

Map<String, dynamic> _$UserPreferencesToJson(_UserPreferences instance) =>
    <String, dynamic>{
      'fontSize': _$FontSizeEnumMap[instance.fontSize]!,
      'darkMode': instance.darkMode,
      'notifications': instance.notifications,
      'soundEffects': instance.soundEffects,
      'appLanguage': instance.appLanguage,
    };

const _$FontSizeEnumMap = {
  FontSize.small: 'small',
  FontSize.medium: 'medium',
  FontSize.large: 'large',
};
