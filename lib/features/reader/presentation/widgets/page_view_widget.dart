import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/models/story.dart' as story_model;
import '../../../../core/theme/app_colors.dart';

/// Individual page display widget with story content
class PageViewWidget extends StatelessWidget {
  final story_model.Page page;
  final String level;
  final String nativeLanguage;
  final Function(String word) onWordTap;
  final VoidCallback? onPlayAudio;

  const PageViewWidget({
    super.key,
    required this.page,
    required this.level,
    this.nativeLanguage = 'th',
    required this.onWordTap,
    this.onPlayAudio,
  });

  /// Get image height factor based on CEFR level
  /// A1: larger images (beginners need more visual context)
  /// B2: smaller images (advanced learners focus on text)
  double _getImageHeightFactor() {
    switch (level.toUpperCase()) {
      case 'A1':
        return 0.45;
      case 'A2':
        return 0.40;
      case 'B1':
        return 0.35;
      case 'B2':
        return 0.30;
      default:
        return 0.40;
    }
  }

  /// Get text size based on CEFR level
  double _getTextSize() {
    switch (level.toUpperCase()) {
      case 'A1':
        return 22.0;
      case 'A2':
        return 20.0;
      case 'B1':
        return 19.0;
      case 'B2':
        return 18.0;
      default:
        return 20.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * _getImageHeightFactor();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Story image
          if (page.imageUrl != null && page.imageUrl!.isNotEmpty)
            _buildStoryImage(imageHeight),

          const SizedBox(height: 20),

          // Text content with vocabulary highlighting
          _buildTextContent(context),

          const SizedBox(height: 24),

          // Audio play button
          if (page.audioUrl.isNotEmpty) _buildAudioButton(context),

          const SizedBox(height: 16),

          // Page number indicator
          _buildPageIndicator(context),

          // Bottom padding for overlay controls
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _buildStoryImage(double height) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: page.imageUrl!,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 48,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final text = page.text;
    final vocabularyHighlights = page.vocabulary;

    if (vocabularyHighlights.isEmpty) {
      // No vocabulary highlights, render plain text
      return Text(
        text,
        style: TextStyle(
          fontSize: _getTextSize(),
          height: 1.8,
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkTextPrimary
              : AppColors.textPrimary,
        ),
      );
    }

    // Build rich text with tappable vocabulary words
    return _buildHighlightedText(context, text, vocabularyHighlights);
  }

  Widget _buildHighlightedText(
    BuildContext context,
    String text,
    List<story_model.VocabularyHighlight> highlights,
  ) {
    // Sort highlights by start index
    final sortedHighlights = List<story_model.VocabularyHighlight>.from(highlights)
      ..sort((a, b) => a.startIndex.compareTo(b.startIndex));

    final spans = <InlineSpan>[];
    int currentIndex = 0;

    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.darkTextPrimary
        : AppColors.textPrimary;

    for (final highlight in sortedHighlights) {
      // Add text before this highlight
      if (highlight.startIndex > currentIndex) {
        spans.add(TextSpan(
          text: text.substring(currentIndex, highlight.startIndex),
          style: TextStyle(
            fontSize: _getTextSize(),
            height: 1.8,
            color: textColor,
          ),
        ));
      }

      // Add the highlighted word as a tappable span
      final word = text.substring(highlight.startIndex, highlight.endIndex);
      spans.add(WidgetSpan(
        alignment: PlaceholderAlignment.baseline,
        baseline: TextBaseline.alphabetic,
        child: GestureDetector(
          onTap: () => onWordTap(highlight.word),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: _getLevelColor(highlight.level).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: _getLevelColor(highlight.level).withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Text(
              word,
              style: TextStyle(
                fontSize: _getTextSize(),
                height: 1.8,
                color: _getLevelColor(highlight.level),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ));

      currentIndex = highlight.endIndex;
    }

    // Add remaining text after last highlight
    if (currentIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentIndex),
        style: TextStyle(
          fontSize: _getTextSize(),
          height: 1.8,
          color: textColor,
        ),
      ));
    }

    return Text.rich(
      TextSpan(children: spans),
    );
  }

  Color _getLevelColor(String? level) {
    switch (level?.toUpperCase()) {
      case 'A1':
        return AppColors.levelA1;
      case 'A2':
        return AppColors.levelA2;
      case 'B1':
        return AppColors.levelB1;
      case 'B2':
        return AppColors.levelB2;
      default:
        return AppColors.primary;
    }
  }

  Widget _buildAudioButton(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: onPlayAudio,
        icon: const Icon(Icons.volume_up, size: 20),
        label: const Text('Listen'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicator(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          'Page ${page.pageNumber}',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
