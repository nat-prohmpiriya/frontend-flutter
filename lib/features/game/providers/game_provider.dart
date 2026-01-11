import 'dart:async';
import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/game.dart';
import '../../../core/models/story.dart';

part 'game_provider.freezed.dart';
part 'game_provider.g.dart';

/// Game types supported
enum GameType {
  multipleChoice,
  listening,
  wordMatch,
}

/// Game state for managing game flow
@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required GameType gameType,
    required List<Question> questions,
    @Default(0) int currentQuestionIndex,
    @Default([]) List<AnswerRecord> answers,
    @Default(false) bool isHintUsed,
    @Default([]) List<int> eliminatedOptions,
    @Default(false) bool isAnswered,
    @Default(false) bool isGameOver,
    @Default(10) int timeLeft,
    @Default(false) bool isTimerRunning,
    int? selectedAnswerIndex,
    GameResult? result,
    // Word match specific
    @Default({}) Map<String, String> matchedPairs,
    String? selectedWord,
    @Default(0) int wrongAttempts,
    @Default([]) List<String> shuffledDefinitions,
  }) = _GameState;
}

/// Game notifier for managing game logic
@riverpod
class GameNotifier extends _$GameNotifier {
  Timer? _timer;
  DateTime? _gameStartTime;

  @override
  GameState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const GameState(
      gameType: GameType.multipleChoice,
      questions: [],
    );
  }

  /// Start a new game with the given type and questions
  void startGame(GameType type, List<Question> questions) {
    _gameStartTime = DateTime.now();

    // For word match, generate shuffled definitions
    List<String> shuffledDefs = [];
    if (type == GameType.wordMatch && questions.isNotEmpty) {
      // Use the question options as definitions for word match
      shuffledDefs = questions.map((q) => q.options.isNotEmpty ? q.correctAnswer : '').toList();
      shuffledDefs.shuffle(Random());
    }

    state = GameState(
      gameType: type,
      questions: questions,
      currentQuestionIndex: 0,
      answers: [],
      isHintUsed: false,
      eliminatedOptions: [],
      isAnswered: false,
      isGameOver: false,
      timeLeft: 10,
      isTimerRunning: true,
      shuffledDefinitions: shuffledDefs,
    );

    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timeLeft > 0 && !state.isAnswered && state.isTimerRunning) {
        state = state.copyWith(timeLeft: state.timeLeft - 1);
      } else if (state.timeLeft == 0 && !state.isAnswered) {
        timeUp();
      }
    });
  }

  /// Select an answer for multiple choice or listening quiz
  void selectAnswer(int index) {
    if (state.isAnswered || state.isGameOver) return;

    final currentQuestion = state.questions[state.currentQuestionIndex];
    final selectedAnswer = currentQuestion.options[index];
    final isCorrect = selectedAnswer == currentQuestion.correctAnswer;

    final answerRecord = AnswerRecord(
      questionId: currentQuestion.id,
      selectedIndex: index,
      isCorrect: isCorrect,
      timeTaken: 10 - state.timeLeft,
      usedHint: state.isHintUsed,
    );

    state = state.copyWith(
      selectedAnswerIndex: index,
      isAnswered: true,
      isTimerRunning: false,
      answers: [...state.answers, answerRecord],
    );
  }

  /// Use hint to eliminate 2 wrong answers
  void useHint() {
    if (state.isHintUsed || state.isAnswered || state.isGameOver) return;

    final currentQuestion = state.questions[state.currentQuestionIndex];
    final wrongIndices = <int>[];

    for (int i = 0; i < currentQuestion.options.length; i++) {
      if (currentQuestion.options[i] != currentQuestion.correctAnswer) {
        wrongIndices.add(i);
      }
    }

    wrongIndices.shuffle(Random());
    final eliminatedIndices = wrongIndices.take(2).toList();

    state = state.copyWith(
      isHintUsed: true,
      eliminatedOptions: eliminatedIndices,
    );
  }

  /// Handle time up - auto-submit wrong answer
  void timeUp() {
    if (state.isAnswered || state.isGameOver) return;

    final currentQuestion = state.questions[state.currentQuestionIndex];

    final answerRecord = AnswerRecord(
      questionId: currentQuestion.id,
      selectedIndex: -1, // No answer selected
      isCorrect: false,
      timeTaken: 10,
      usedHint: state.isHintUsed,
    );

    state = state.copyWith(
      isAnswered: true,
      isTimerRunning: false,
      answers: [...state.answers, answerRecord],
    );
  }

  /// Move to next question or finish game
  void nextQuestion() {
    if (state.currentQuestionIndex >= state.questions.length - 1) {
      // Game over
      final result = calculateResult();
      state = state.copyWith(
        isGameOver: true,
        result: result,
      );
      _timer?.cancel();
    } else {
      // Next question
      state = state.copyWith(
        currentQuestionIndex: state.currentQuestionIndex + 1,
        isAnswered: false,
        selectedAnswerIndex: null,
        eliminatedOptions: [],
        timeLeft: 10,
        isTimerRunning: true,
      );
    }
  }

  /// Word Match: Select a word from left column
  void selectWord(String word) {
    if (state.matchedPairs.containsKey(word)) return;
    state = state.copyWith(selectedWord: word);
  }

  /// Word Match: Try to match with a definition
  void matchDefinition(String definition) {
    if (state.selectedWord == null) return;
    if (state.matchedPairs.values.contains(definition)) return;

    final selectedWord = state.selectedWord!;

    // Find if this is a correct match
    final question = state.questions.firstWhere(
      (q) => q.question == selectedWord,
      orElse: () => const Question(
        id: '',
        question: '',
        correctAnswer: '',
      ),
    );

    final correctDef = question.correctAnswer;

    if (definition == correctDef) {
      // Correct match
      final newMatchedPairs = Map<String, String>.from(state.matchedPairs);
      newMatchedPairs[selectedWord] = definition;

      state = state.copyWith(
        matchedPairs: newMatchedPairs,
        selectedWord: null,
      );

      // Check if game is complete
      if (newMatchedPairs.length == state.questions.length) {
        final result = _calculateWordMatchResult();
        state = state.copyWith(
          isGameOver: true,
          result: result,
        );
        _timer?.cancel();
      }
    } else {
      // Wrong match
      state = state.copyWith(
        wrongAttempts: state.wrongAttempts + 1,
        selectedWord: null,
      );
    }
  }

  GameResult _calculateWordMatchResult() {
    final timeTaken = DateTime.now().difference(_gameStartTime!).inSeconds;
    final score = max(0, 100 - state.wrongAttempts * 5);
    final tier = GameTier.fromScore(score);

    return GameResult(
      score: score,
      correctCount: state.matchedPairs.length,
      totalQuestions: state.questions.length,
      tier: tier.name,
      coinsEarned: tier.coinsReward,
      timeTaken: timeTaken,
      answers: [],
    );
  }

  /// Calculate final game result
  GameResult calculateResult() {
    final correctCount = state.answers.where((a) => a.isCorrect).length;
    final totalQuestions = state.questions.length;
    final score = totalQuestions > 0
        ? ((correctCount / totalQuestions) * 100).round()
        : 0;

    final tier = GameTier.fromScore(score);
    final timeTaken = DateTime.now().difference(_gameStartTime!).inSeconds;

    return GameResult(
      score: score,
      correctCount: correctCount,
      totalQuestions: totalQuestions,
      tier: tier.name,
      coinsEarned: tier.coinsReward,
      timeTaken: timeTaken,
      answers: state.answers,
    );
  }

  /// Reset game state
  void resetGame() {
    _timer?.cancel();
    state = const GameState(
      gameType: GameType.multipleChoice,
      questions: [],
    );
  }

  /// Get current question
  Question? get currentQuestion {
    if (state.questions.isEmpty) return null;
    if (state.currentQuestionIndex >= state.questions.length) return null;
    return state.questions[state.currentQuestionIndex];
  }
}
