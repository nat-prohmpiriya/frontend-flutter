import 'package:flutter/material.dart';

import '../../../../core/models/story.dart' as story_model;
import '../../../../core/theme/app_colors.dart';

/// Slide-in panel from LEFT showing full page translation
class TranslationPanel extends StatelessWidget {
  final bool isOpen;
  final story_model.Page? currentPage;
  final String nativeLanguage;
  final VoidCallback onClose;

  /// Panel width as percentage of screen width
  static const double panelWidthFactor = 0.85;

  /// Animation duration in milliseconds
  static const int animationDurationMs = 250;

  const TranslationPanel({
    super.key,
    required this.isOpen,
    required this.currentPage,
    this.nativeLanguage = 'th',
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final panelWidth = screenWidth * panelWidthFactor;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: animationDurationMs),
      curve: Curves.easeOut,
      left: isOpen ? 0 : -panelWidth,
      top: 0,
      bottom: 0,
      width: panelWidth,
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          // Close panel on swipe left
          if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
            onClose();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkSurface
                : AppColors.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(4, 0),
              ),
            ],
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(context),

                // Divider
                const Divider(height: 1),

                // Translation content
                Expanded(
                  child: _buildTranslationContent(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.translate,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Translation',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  _getLanguageName(nativeLanguage),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close),
            tooltip: 'Close',
          ),
        ],
      ),
    );
  }

  Widget _buildTranslationContent(BuildContext context) {
    if (currentPage == null) {
      return const Center(
        child: Text(
          'No translation available',
          style: TextStyle(color: AppColors.textSecondary),
        ),
      );
    }

    final translation = currentPage!.translations[nativeLanguage] ??
        currentPage!.translations['th'] ??
        currentPage!.translations.values.firstOrNull;

    if (translation == null || translation.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.translate_outlined,
                size: 48,
                color: AppColors.textSecondary.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 16),
              Text(
                'Translation not available',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'No translation found for this page in ${_getLanguageName(nativeLanguage)}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Original text header
          _buildSectionHeader(context, 'Original', Icons.article_outlined),
          const SizedBox(height: 12),
          _buildTextCard(
            context,
            currentPage!.text,
            isOriginal: true,
          ),
          const SizedBox(height: 24),

          // Translation header
          _buildSectionHeader(context, 'Translation', Icons.translate),
          const SizedBox(height: 12),
          _buildTextCard(
            context,
            translation,
            isOriginal: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }

  Widget _buildTextCard(BuildContext context, String text, {required bool isOriginal}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isOriginal
            ? (isDark
                ? AppColors.darkBackground
                : AppColors.background)
            : AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isOriginal
              ? (isDark ? AppColors.darkBorder : AppColors.border)
              : AppColors.primary.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          height: 1.8,
          color: isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
        ),
      ),
    );
  }

  String _getLanguageName(String code) {
    switch (code.toLowerCase()) {
      case 'th':
        return 'Thai';
      case 'en':
        return 'English';
      case 'zh':
        return 'Chinese';
      case 'ja':
        return 'Japanese';
      case 'ko':
        return 'Korean';
      case 'es':
        return 'Spanish';
      case 'fr':
        return 'French';
      case 'de':
        return 'German';
      default:
        return code.toUpperCase();
    }
  }
}
