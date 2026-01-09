import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/user_preferences.dart';
import '../../../../core/providers/preferences_provider.dart';
import '../../../../core/theme/app_colors.dart';

class PreferencesSection extends ConsumerWidget {
  const PreferencesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferencesAsync = ref.watch(appPreferencesProvider);

    return preferencesAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
      data: (preferences) => _PreferencesContent(preferences: preferences),
    );
  }
}

class _PreferencesContent extends ConsumerWidget {
  final UserPreferences preferences;

  const _PreferencesContent({required this.preferences});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Preferences Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const Icon(Icons.settings, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text(
                      'Preferences',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // App Language
                const _SectionTitle(icon: Icons.language, title: 'App Language'),
                const SizedBox(height: 12),
                _LanguageSelector(
                  selected: preferences.appLanguage,
                  onChanged: (lang) {
                    ref
                        .read(appPreferencesProvider.notifier)
                        .setAppLanguage(lang);
                  },
                ),
                const SizedBox(height: 24),
                // Font Size
                const _SectionTitle(icon: Icons.text_fields, title: 'Font Size'),
                const SizedBox(height: 12),
                _FontSizeSelector(
                  selected: preferences.fontSize,
                  onChanged: (size) {
                    ref
                        .read(appPreferencesProvider.notifier)
                        .setFontSize(size);
                  },
                ),
                const SizedBox(height: 24),
                // Toggle Options
                _ToggleOption(
                  icon: Icons.dark_mode,
                  title: 'Dark Mode',
                  value: preferences.darkMode,
                  onChanged: (value) {
                    ref
                        .read(appPreferencesProvider.notifier)
                        .setDarkMode(value);
                  },
                ),
                const Divider(height: 24),
                _ToggleOption(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  value: preferences.notifications,
                  onChanged: (value) {
                    ref
                        .read(appPreferencesProvider.notifier)
                        .setNotifications(value);
                  },
                ),
                const Divider(height: 24),
                _ToggleOption(
                  icon: Icons.music_note,
                  title: 'Sound Effects',
                  value: preferences.soundEffects,
                  onChanged: (value) {
                    ref
                        .read(appPreferencesProvider.notifier)
                        .setSoundEffects(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const _LanguageSelector({
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final languages = [
      ('th', 'Thai'),
      ('en', 'English'),
    ];

    return Row(
      children: languages.map((lang) {
        final isSelected = selected == lang.$1;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: lang.$1 == 'th' ? 6 : 0,
              left: lang.$1 == 'en' ? 6 : 0,
            ),
            child: GestureDetector(
              onTap: () => onChanged(lang.$1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.border,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    lang.$2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _FontSizeSelector extends StatelessWidget {
  final FontSize selected;
  final ValueChanged<FontSize> onChanged;

  const _FontSizeSelector({
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final sizes = [
      (FontSize.small, 'Small', 12.0),
      (FontSize.medium, 'Medium', 14.0),
      (FontSize.large, 'Large', 16.0),
    ];

    return Row(
      children: sizes.map((size) {
        final isSelected = selected == size.$1;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: size.$1 == FontSize.small ? 0 : 4,
              right: size.$1 == FontSize.large ? 0 : 4,
            ),
            child: GestureDetector(
              onTap: () => onChanged(size.$1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withValues(alpha: 0.1)
                      : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.border,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    size.$2,
                    style: TextStyle(
                      fontSize: size.$3,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected ? AppColors.primary : AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ToggleOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleOption({
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onChanged(!value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 50,
            height: 28,
            decoration: BoxDecoration(
              color: value ? AppColors.primary : AppColors.border,
              borderRadius: BorderRadius.circular(14),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(3),
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
