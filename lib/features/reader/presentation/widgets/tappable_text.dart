import 'package:flutter/material.dart';

import '../../../../core/models/vocabulary.dart';
import '../../../../core/theme/app_colors.dart';
import 'vocabulary_popup.dart';

/// Word timestamp for karaoke highlighting
class WordTimestamp {
  const WordTimestamp({
    required this.word,
    required this.startTime,
    required this.endTime,
  });

  final String word;
  final Duration startTime;
  final Duration endTime;
}

/// Vocabulary highlight info
class VocabularyHighlight {
  const VocabularyHighlight({
    required this.word,
    this.vocabulary,
    this.audioUrlUs,
    this.audioUrlUk,
  });

  final String word;
  final Vocabulary? vocabulary;
  final String? audioUrlUs;
  final String? audioUrlUk;
}

/// Widget to render story text with tappable vocabulary words
class TappableText extends StatelessWidget {
  const TappableText({
    super.key,
    required this.text,
    this.vocabularyHighlights = const [],
    this.wordTimestamps = const [],
    this.currentPosition = Duration.zero,
    this.textStyle,
    this.highlightStyle,
    this.karaokeStyle,
    this.onWordTap,
    this.enableKaraoke = false,
  });

  /// The text to display
  final String text;

  /// List of vocabulary words to highlight
  final List<VocabularyHighlight> vocabularyHighlights;

  /// Word timestamps for karaoke highlighting
  final List<WordTimestamp> wordTimestamps;

  /// Current audio position for karaoke highlighting
  final Duration currentPosition;

  /// Base text style
  final TextStyle? textStyle;

  /// Style for highlighted vocabulary words
  final TextStyle? highlightStyle;

  /// Style for currently playing word (karaoke)
  final TextStyle? karaokeStyle;

  /// Callback when a word is tapped
  final void Function(VocabularyHighlight highlight)? onWordTap;

  /// Whether karaoke highlighting is enabled
  final bool enableKaraoke;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = textStyle ??
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.8,
              fontSize: 18,
            );

    final defaultHighlightStyle = highlightStyle ??
        defaultTextStyle?.copyWith(
          backgroundColor: AppColors.primary.withValues(alpha: 0.2),
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primary.withValues(alpha: 0.5),
          decorationStyle: TextDecorationStyle.dotted,
        );

    final defaultKaraokeStyle = karaokeStyle ??
        defaultTextStyle?.copyWith(
          backgroundColor: AppColors.primary.withValues(alpha: 0.3),
          fontWeight: FontWeight.bold,
        );

    // Build vocabulary lookup map (case-insensitive)
    final vocabMap = <String, VocabularyHighlight>{};
    for (final highlight in vocabularyHighlights) {
      vocabMap[highlight.word.toLowerCase()] = highlight;
    }

    // Find current karaoke word
    String? currentKaraokeWord;
    if (enableKaraoke) {
      for (final timestamp in wordTimestamps) {
        if (currentPosition >= timestamp.startTime &&
            currentPosition < timestamp.endTime) {
          currentKaraokeWord = timestamp.word.toLowerCase();
          break;
        }
      }
    }

    // Parse text and create spans
    final spans = _buildTextSpans(
      context,
      text,
      vocabMap,
      currentKaraokeWord,
      defaultTextStyle,
      defaultHighlightStyle,
      defaultKaraokeStyle,
    );

    return RichText(
      text: TextSpan(
        style: defaultTextStyle,
        children: spans,
      ),
    );
  }

  List<InlineSpan> _buildTextSpans(
    BuildContext context,
    String text,
    Map<String, VocabularyHighlight> vocabMap,
    String? currentKaraokeWord,
    TextStyle? baseStyle,
    TextStyle? highlightStyle,
    TextStyle? karaokeStyle,
  ) {
    final spans = <InlineSpan>[];
    final words = _tokenize(text);

    for (final token in words) {
      if (token.isWord) {
        final lowerWord = token.text.toLowerCase();
        final cleanWord = _cleanWord(lowerWord);
        final highlight = vocabMap[cleanWord];

        if (highlight != null) {
          // This is a vocabulary word
          final isKaraoke = currentKaraokeWord == cleanWord;
          spans.add(
            WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: _TappableWord(
                text: token.text,
                style: isKaraoke ? karaokeStyle : highlightStyle,
                onTap: () => _handleWordTap(context, highlight),
              ),
            ),
          );
        } else {
          // Check for karaoke highlight
          final isKaraoke = currentKaraokeWord == cleanWord;
          spans.add(
            TextSpan(
              text: token.text,
              style: isKaraoke ? karaokeStyle : baseStyle,
            ),
          );
        }
      } else {
        // Non-word token (whitespace, punctuation)
        spans.add(TextSpan(text: token.text, style: baseStyle));
      }
    }

    return spans;
  }

  void _handleWordTap(BuildContext context, VocabularyHighlight highlight) {
    if (onWordTap != null) {
      onWordTap!(highlight);
    } else {
      // Default behavior: show vocabulary popup
      VocabularyPopup.show(
        context,
        word: highlight.word,
        vocabulary: highlight.vocabulary,
        audioUrlUs: highlight.audioUrlUs,
        audioUrlUk: highlight.audioUrlUk,
      );
    }
  }

  /// Clean word by removing punctuation
  String _cleanWord(String word) {
    return word.replaceAll(RegExp(r'[^\w]'), '');
  }

  /// Tokenize text into words and non-words
  List<_Token> _tokenize(String text) {
    final tokens = <_Token>[];
    final regex = RegExp(r"([a-zA-Z']+)|([^a-zA-Z']+)");
    final matches = regex.allMatches(text);

    for (final match in matches) {
      final wordMatch = match.group(1);
      final otherMatch = match.group(2);

      if (wordMatch != null) {
        tokens.add(_Token(wordMatch, isWord: true));
      } else if (otherMatch != null) {
        tokens.add(_Token(otherMatch, isWord: false));
      }
    }

    return tokens;
  }
}

class _Token {
  const _Token(this.text, {required this.isWord});

  final String text;
  final bool isWord;
}

/// Internal tappable word widget
class _TappableWord extends StatelessWidget {
  const _TappableWord({
    required this.text,
    required this.style,
    required this.onTap,
  });

  final String text;
  final TextStyle? style;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}

/// Helper widget that wraps TappableText with scroll view
class TappableTextView extends StatelessWidget {
  const TappableTextView({
    super.key,
    required this.text,
    this.vocabularyHighlights = const [],
    this.wordTimestamps = const [],
    this.currentPosition = Duration.zero,
    this.textStyle,
    this.highlightStyle,
    this.karaokeStyle,
    this.onWordTap,
    this.enableKaraoke = false,
    this.padding = const EdgeInsets.all(20),
  });

  final String text;
  final List<VocabularyHighlight> vocabularyHighlights;
  final List<WordTimestamp> wordTimestamps;
  final Duration currentPosition;
  final TextStyle? textStyle;
  final TextStyle? highlightStyle;
  final TextStyle? karaokeStyle;
  final void Function(VocabularyHighlight highlight)? onWordTap;
  final bool enableKaraoke;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding,
      child: TappableText(
        text: text,
        vocabularyHighlights: vocabularyHighlights,
        wordTimestamps: wordTimestamps,
        currentPosition: currentPosition,
        textStyle: textStyle,
        highlightStyle: highlightStyle,
        karaokeStyle: karaokeStyle,
        onWordTap: onWordTap,
        enableKaraoke: enableKaraoke,
      ),
    );
  }
}
