import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/story.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/game_provider.dart';

/// Word Match game widget
/// Left column: English words, Right column: Thai definitions (shuffled)
/// Tap to select pairs
class WordMatchGame extends ConsumerWidget {
  final List<Question> questions;
  final VoidCallback onComplete;
  final VoidCallback onQuit;

  const WordMatchGame({
    super.key,
    required this.questions,
    required this.onComplete,
    required this.onQuit,
  });

  /// Design constants
  static const double padding = 24.0;
  static const Color matchedColor = Color(0xFF22C55E);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final gameNotifier = ref.read(gameProvider.notifier);

    // Start game if not started
    if (gameState.questions.isEmpty && questions.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        gameNotifier.startGame(GameType.wordMatch, questions);
      });
      return const Center(child: CircularProgressIndicator());
    }

    // Check if game is over
    if (gameState.isGameOver && gameState.result != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onComplete();
      });
      return const Center(child: CircularProgressIndicator());
    }

    // Get words and definitions
    final words = gameState.questions.map((q) => q.questionText).toList();
    final definitions = gameState.shuffledDefinitions.isNotEmpty
        ? gameState.shuffledDefinitions
        : gameState.questions
            .map((q) =>
                q.options.isNotEmpty ? q.options[q.correctIndex] : '')
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              _buildHeader(context, gameState, onQuit),

              const SizedBox(height: 16),

              // Instructions
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Tap an English word, then tap its Thai translation to match them.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 24),

              // Word columns
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // English column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'English',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              itemCount: words.length,
                              itemBuilder: (context, index) {
                                final word = words[index];
                                return _buildWordButton(
                                  context,
                                  ref,
                                  word: word,
                                  isEnglish: true,
                                  gameState: gameState,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Thai column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Thai',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              itemCount: definitions.length,
                              itemBuilder: (context, index) {
                                final definition = definitions[index];
                                return _buildWordButton(
                                  context,
                                  ref,
                                  word: definition,
                                  isEnglish: false,
                                  gameState: gameState,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    GameState gameState,
    VoidCallback onQuit,
  ) {
    final matchedCount = gameState.matchedPairs.length;
    final totalPairs = gameState.questions.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Match the Words',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Matched: $matchedCount/$totalPairs | Wrong: ${gameState.wrongAttempts}',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: onQuit,
          icon: const Icon(Icons.close),
          color: AppColors.textSecondary,
          iconSize: 28,
        ),
      ],
    );
  }

  Widget _buildWordButton(
    BuildContext context,
    WidgetRef ref, {
    required String word,
    required bool isEnglish,
    required GameState gameState,
  }) {
    final gameNotifier = ref.read(gameProvider.notifier);

    // Check if this word is matched
    bool isMatched = false;
    if (isEnglish) {
      isMatched = gameState.matchedPairs.containsKey(word);
    } else {
      isMatched = gameState.matchedPairs.values.contains(word);
    }

    // Check if this is the selected word
    final isSelected = isEnglish && gameState.selectedWord == word;

    // Determine button style
    Color backgroundColor = Colors.white;
    Color borderColor = AppColors.border;
    Color textColor = AppColors.textPrimary;

    if (isMatched) {
      backgroundColor = matchedColor.withValues(alpha: 0.1);
      borderColor = matchedColor;
      textColor = matchedColor;
    } else if (isSelected) {
      backgroundColor = AppColors.primary.withValues(alpha: 0.1);
      borderColor = AppColors.primary;
      textColor = AppColors.primary;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: isMatched
              ? null
              : () {
                  if (isEnglish) {
                    gameNotifier.selectWord(word);
                  } else {
                    gameNotifier.matchDefinition(word);
                  }
                },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    word,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                ),
                if (isMatched)
                  const Icon(
                    Icons.check_circle,
                    color: matchedColor,
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
