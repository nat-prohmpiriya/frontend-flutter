import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_provider.g.dart';

const String _localeKey = 'app_locale';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Future<Locale> build() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey);

    if (localeCode != null) {
      return Locale(localeCode);
    }

    return const Locale('en');
  }

  Future<void> setLocale(BuildContext context, Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);

    // Update easy_localization
    await context.setLocale(locale);

    state = AsyncData(locale);
  }

  Future<void> toggleLocale(BuildContext context) async {
    final currentLocale = state.value ?? const Locale('en');
    final newLocale = currentLocale.languageCode == 'en'
        ? const Locale('th')
        : const Locale('en');

    await setLocale(context, newLocale);
  }
}

@riverpod
List<Locale> supportedLocales(Ref ref) {
  return const [
    Locale('en'),
    Locale('th'),
  ];
}

@riverpod
Map<String, String> localeNames(Ref ref) {
  return const {
    'en': 'English',
    'th': 'ไทย',
  };
}
