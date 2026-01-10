import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/story.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/game_provider.dart';
import 'hint_button.dart';
import 'question_timer.dart';

/// Multiple Choice game widget
/// Shows question text and 4 answer options (A, B, C, D)
class MultipleChoiceGame extends ConsumerWidget {
  final List<Question> questions;
  final VoidCallback onComplete;
  final VoidCallback onQuit;

  const MultipleChoiceGame({
    super.key,
    required this.questions,
    required this.onComplete,
    required this.onQuit,
  });

  /// Design constants
  static const double questionPadding = 24.0;
  static const double answerButtonHeight = 56.0;
  static const Color correctColor = Color(0xFF22C55E);
  static const Color incorrectColor = Color(0xFFEF4444);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final gameNotifier = ref.read(gameProvider.notifier);

    // Start game if not started
    if (gameState.questions.isEmpty && questions.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        gameNotifier.startGame(GameType.multipleChoice, questions);
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

    final currentQuestion = gameNotifier.currentQuestion;
    if (currentQuestion == null) {
      return const Center(child: Text('No questions available'));
    }

    final totalQuestions = gameState.questions.length;
    final currentIndex = gameState.currentQuestionIndex;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(questionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              _buildHeader(
                context,
                currentIndex: currentIndex,
                totalQuestions: totalQuestions,
                onQuit: onQuit,
              ),

              const SizedBox(height: 16),

              // Timer
              Center(
                child: QuestionTimer(
                  timeLeft: gameState.timeLeft,
                  totalTime: 10,
                ),
              ),

              const SizedBox(height: 24),

              // Question
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Question text
                      Text(
                        currentQuestion.questionText,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          height: 1.4,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Answer options
                      ...List.generate(
                        currentQuestion.options.length,
                        (index) => _buildAnswerOption(
                          context,
                          ref,
                          index: index,
                          option: currentQuestion.options[index],
                          correctIndex: currentQuestion.correctIndex,
                          gameState: gameState,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Hint button (show after some attempts or always available)
                      if (!gameState.isHintUsed && !gameState.isAnswered)
                        Center(
                          child: HintButton(
                            onPressed: () => gameNotifier.useHint(),
                            isUsed: gameState.isHintUsed,
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // Next button
              if (gameState.isAnswered)
                ElevatedButton(
                  onPressed: () => gameNotifier.nextQuestion(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    currentIndex < totalQuestions - 1
                        ? 'Next Question'
                        : 'View Results',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              const SizedBox(height: 12),

              // Score indicator
              _buildScoreIndicator(gameState),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context, {
    required int currentIndex,
    required int totalQuestions,
    required VoidCallback onQuit,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Question ${currentIndex + 1}/$totalQuestions',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        IconButton(
          onPressed: onQuit,
          icon: const Icon(Icons.close),
          color: AppColors.textSecondary,
        ),
      ],
    );
  }

  Widget _buildAnswerOption(
    BuildContext context,
    WidgetRef ref, {
    required int index,
    required String option,
    required int correctIndex,
    required GameState gameState,
  }) {
    final gameNotifier = ref.read(gameProvider.notifier);
    final isEliminated = gameState.eliminatedOptions.contains(index);
    final isCorrect = index == correctIndex;
    final isSelected = gameState.selectedAnswerIndex == index;
    final isAnswered = gameState.isAnswered;

    // Determine button style
    Color backgroundColor = Colors.white;
    Color borderColor = AppColors.border;
    Color textColor = AppColors.textPrimary;
    IconData? trailingIcon;
    Color? iconColor;

    if (isEliminated) {
      backgroundColor = Colors.grey.shade100;
      borderColor = Colors.grey.shade300;
      textColor = Colors.grey.shade400;
    } else if (isAnswered) {
      if (isCorrect) {
        backgroundColor = correctColor.withValues(alpha: 0.1);
        borderColor = correctColor;
        textColor = correctColor;
        trailingIcon = Icons.check_circle;
        iconColor = correctColor;
      } else if (isSelected) {
        backgroundColor = incorrectColor.withValues(alpha: 0.1);
        borderColor = incorrectColor;
        textColor = incorrectColor;
        trailingIcon = Icons.cancel;
        iconColor = incorrectColor;
      } else {
        backgroundColor = Colors.grey.shade50;
        borderColor = Colors.grey.shade200;
        textColor = Colors.grey.shade400;
      }
    }

    final optionLabel = String.fromCharCode(65 + index); // A, B, C, D

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: isAnswered || isEliminated
              ? null
              : () => gameNotifier.selectAnswer(index),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: answerButtonHeight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Option label (A, B, C, D)
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: isEliminated
                        ? Colors.grey.shade200
                        : borderColor.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    optionLabel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Option text
                Expanded(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                      decoration:
                          isEliminated ? TextDecoration.lineThrough : null,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Trailing icon
                if (trailingIcon != null)
                  Icon(
                    trailingIcon,
                    color: iconColor,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreIndicator(GameState gameState) {
    final correctCount = gameState.answers.where((a) => a.isCorrect).length;
    final answeredCount = gameState.answers.length;

    return Center(
      child: Text(
        'Score: $correctCount/$answeredCount correct',
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
