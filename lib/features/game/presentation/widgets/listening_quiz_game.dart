import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/models/story.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/game_provider.dart';
import 'question_timer.dart';

/// Listening Quiz game widget
/// Plays audio and shows 4 answer options
class ListeningQuizGame extends ConsumerStatefulWidget {
  final List<Question> questions;
  final VoidCallback onComplete;
  final VoidCallback onQuit;

  const ListeningQuizGame({
    super.key,
    required this.questions,
    required this.onComplete,
    required this.onQuit,
  });

  @override
  ConsumerState<ListeningQuizGame> createState() => _ListeningQuizGameState();
}

class _ListeningQuizGameState extends ConsumerState<ListeningQuizGame> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  bool _hasAutoPlayed = false;

  /// Design constants
  static const double questionPadding = 24.0;
  static const double answerButtonHeight = 56.0;
  static const Color correctColor = Color(0xFF22C55E);
  static const Color incorrectColor = Color(0xFFEF4444);

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state.playing;
        });
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(String? audioUrl) async {
    if (audioUrl == null || audioUrl.isEmpty) return;

    try {
      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();
    } catch (e) {
      // Handle audio error silently
      debugPrint('Audio playback error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameProvider);
    final gameNotifier = ref.read(gameProvider.notifier);

    // Start game if not started
    if (gameState.questions.isEmpty && widget.questions.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        gameNotifier.startGame(GameType.listening, widget.questions);
      });
      return const Center(child: CircularProgressIndicator());
    }

    // Check if game is over
    if (gameState.isGameOver && gameState.result != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onComplete();
      });
      return const Center(child: CircularProgressIndicator());
    }

    final currentQuestion = gameNotifier.currentQuestion;
    if (currentQuestion == null) {
      return _buildNoQuestionsScreen();
    }

    // Auto-play audio on new question
    if (!_hasAutoPlayed && currentQuestion.audioUrl != null) {
      _hasAutoPlayed = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _playAudio(currentQuestion.audioUrl);
      });
    }

    // Reset auto-play flag on question change
    if (gameState.isAnswered) {
      _hasAutoPlayed = false;
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
                onQuit: widget.onQuit,
              ),

              const SizedBox(height: 16),

              // Timer
              Center(
                child: QuestionTimer(
                  timeLeft: gameState.timeLeft,
                  totalTime: 10,
                ),
              ),

              const SizedBox(height: 32),

              // Audio player button
              _buildAudioPlayer(currentQuestion.audioUrl),

              const SizedBox(height: 16),

              // Instruction text
              const Center(
                child: Text(
                  'Listen and select the word you hear',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Answer options
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      currentQuestion.options.length,
                      (index) => _buildAnswerOption(
                        context,
                        ref,
                        index: index,
                        option: currentQuestion.options[index],
                        correctAnswer: currentQuestion.correctAnswer,
                        gameState: gameState,
                      ),
                    ),
                  ),
                ),
              ),

              // Next button
              if (gameState.isAnswered)
                ElevatedButton(
                  onPressed: () {
                    _hasAutoPlayed = false;
                    gameNotifier.nextQuestion();
                  },
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

  Widget _buildNoQuestionsScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.headset_off,
                  size: 64,
                  color: AppColors.textSecondary,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Not enough vocabulary with audio for this game.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: widget.onQuit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Go Back'),
                ),
              ],
            ),
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

  Widget _buildAudioPlayer(String? audioUrl) {
    return Center(
      child: GestureDetector(
        onTap: () => _playAudio(audioUrl),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            _isPlaying ? Icons.pause : Icons.play_arrow,
            size: 56,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerOption(
    BuildContext context,
    WidgetRef ref, {
    required int index,
    required String option,
    required String correctAnswer,
    required GameState gameState,
  }) {
    final gameNotifier = ref.read(gameProvider.notifier);
    final isCorrect = option == correctAnswer;
    final isSelected = gameState.selectedAnswerIndex == index;
    final isAnswered = gameState.isAnswered;

    // Determine button style
    Color backgroundColor = Colors.white;
    Color borderColor = AppColors.border;
    Color textColor = AppColors.textPrimary;
    IconData? trailingIcon;
    Color? iconColor;

    if (isAnswered) {
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: isAnswered ? null : () => gameNotifier.selectAnswer(index),
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
                // Option text
                Expanded(
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
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
