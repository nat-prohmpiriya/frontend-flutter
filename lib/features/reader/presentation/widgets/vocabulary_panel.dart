import 'package:flutter/material.dart';

import '../../../../core/models/story.dart' as story_model;
import '../../../../core/theme/app_colors.dart';

/// Slide-in panel from RIGHT showing vocabulary words for current episode
class VocabularyPanel extends StatelessWidget {
  final bool isOpen;
  final story_model.Episode? currentEpisode;
  final String? selectedWord;
  final String nativeLanguage;
  final VoidCallback onClose;
  final Function(String word) onWordTap;
  final Function(String audioUrl)? onPlayAudio;

  /// Panel width as percentage of screen width
  static const double panelWidthFactor = 0.85;

  /// Animation duration in milliseconds
  static const int animationDurationMs = 250;

  const VocabularyPanel({
    super.key,
    required this.isOpen,
    required this.currentEpisode,
    this.selectedWord,
    this.nativeLanguage = 'th',
    required this.onClose,
    required this.onWordTap,
    this.onPlayAudio,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final panelWidth = screenWidth * panelWidthFactor;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: animationDurationMs),
      curve: Curves.easeOut,
      right: isOpen ? 0 : -panelWidth,
      top: 0,
      bottom: 0,
      width: panelWidth,
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          // Close panel on swipe right
          if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
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
                offset: const Offset(-4, 0),
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

                // Vocabulary list
                Expanded(
                  child: _buildVocabularyList(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final vocabCount = currentEpisode?.vocabularyDetails.length ?? 0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.library_books_outlined,
              color: AppColors.secondary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vocabulary',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '$vocabCount words in this episode',
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

  Widget _buildVocabularyList(BuildContext context) {
    if (currentEpisode == null || currentEpisode!.vocabularyDetails.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.library_books_outlined,
                size: 48,
                color: AppColors.textSecondary.withValues(alpha: 0.5),
              ),
              const SizedBox(height: 16),
              Text(
                'No vocabulary',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'No vocabulary words found for this episode',
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

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: currentEpisode!.vocabularyDetails.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final vocab = currentEpisode!.vocabularyDetails[index];
        final isSelected = selectedWord == vocab.word;

        return _buildVocabularyCard(context, vocab, isSelected);
      },
    );
  }

  Widget _buildVocabularyCard(
    BuildContext context,
    story_model.VocabularyDetail vocab,
    bool isSelected,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => onWordTap(vocab.word),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.1)
              : (isDark ? AppColors.darkBackground : AppColors.background),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (isDark ? AppColors.darkBorder : AppColors.border),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Word and audio button row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Word
                      Text(
                        vocab.word,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? AppColors.primary
                                      : (isDark
                                          ? AppColors.darkTextPrimary
                                          : AppColors.textPrimary),
                                ),
                      ),

                      // Pronunciation
                      if (vocab.pronunciation != null &&
                          vocab.pronunciation!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            '/${vocab.pronunciation}/',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.textSecondary,
                                      fontStyle: FontStyle.italic,
                                    ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Part of speech badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getPartOfSpeechColor(vocab.partOfSpeech)
                        .withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    vocab.partOfSpeech,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: _getPartOfSpeechColor(vocab.partOfSpeech),
                    ),
                  ),
                ),

                // Audio button
                if (vocab.audioUrl != null && vocab.audioUrl!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(
                      onPressed: () => onPlayAudio?.call(vocab.audioUrl!),
                      icon: const Icon(Icons.volume_up, size: 20),
                      color: AppColors.primary,
                      tooltip: 'Listen',
                      style: IconButton.styleFrom(
                        backgroundColor:
                            AppColors.primary.withValues(alpha: 0.1),
                        minimumSize: const Size(36, 36),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 12),

            // Definition
            Text(
              vocab.definition,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                    height: 1.5,
                  ),
            ),

            // Translation
            if (vocab.translations != null && vocab.translations!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.translate,
                      size: 14,
                      color: AppColors.textSecondary.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        vocab.translations![nativeLanguage] ??
                            vocab.translations!['th'] ??
                            vocab.translations!.values.first,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getPartOfSpeechColor(String pos) {
    switch (pos.toLowerCase()) {
      case 'noun':
      case 'n':
        return AppColors.levelA2; // Blue
      case 'verb':
      case 'v':
        return AppColors.levelB1; // Orange
      case 'adjective':
      case 'adj':
        return AppColors.levelB2; // Purple
      case 'adverb':
      case 'adv':
        return AppColors.secondary; // Green
      case 'preposition':
      case 'prep':
        return AppColors.levelA1; // Green
      default:
        return AppColors.textSecondary;
    }
  }
}
