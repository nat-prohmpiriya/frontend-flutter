import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/story.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../library/data/story_repository.dart';
import '../../providers/game_provider.dart';
import '../widgets/game_results_screen.dart';
import '../widgets/listening_quiz_game.dart';
import '../widgets/multiple_choice_game.dart';
import '../widgets/word_match_game.dart';
import 'game_selection_screen.dart';

/// Game flow states
enum GameFlow {
  loading,
  selection,
  playing,
  results,
}

/// Main game screen that manages the full game flow
/// Handles: intro -> game selection -> questions -> results
class GameScreen extends ConsumerStatefulWidget {
  final String storySlug;
  final int episodeNumber;

  const GameScreen({
    super.key,
    required this.storySlug,
    required this.episodeNumber,
  });

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  GameFlow _flow = GameFlow.loading;
  GameType? _selectedGameType;
  Episode? _episode;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadStory();
  }

  Future<void> _loadStory() async {
    try {
      final storyRepository = ref.read(storyRepositoryProvider);
      final story = await storyRepository.getStory(widget.storySlug);

      if (story.id.isNotEmpty) {
        final episode = story.episodes.firstWhere(
          (e) => e.episodeNumber == widget.episodeNumber,
          orElse: () => story.episodes.first,
        );

        setState(() {
          _episode = episode;
          _flow = GameFlow.selection;
        });
      } else {
        setState(() {
          _error = 'Story not found';
        });
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  void _onSelectGame(GameType type) {
    setState(() {
      _selectedGameType = type;
      _flow = GameFlow.playing;
    });
  }

  void _onGameComplete() {
    setState(() {
      _flow = GameFlow.results;
    });
  }

  void _onRetry() {
    // Reset game and start again
    ref.read(gameProvider.notifier).resetGame();
    setState(() {
      _flow = GameFlow.playing;
    });
  }

  void _onContinue() {
    // Navigate back or to next episode
    context.pop();
  }

  void _onBackToLibrary() {
    // Navigate to library
    context.go('/library');
  }

  void _onQuit() {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Quit Game?'),
        content: const Text(
          'Your progress will be lost. Are you sure you want to quit?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(gameProvider.notifier).resetGame();
              context.pop();
            },
            child: const Text(
              'Quit',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _onSkip() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // Show loading state
    if (_flow == GameFlow.loading) {
      return _buildLoadingScreen();
    }

    // Show error state
    if (_error != null) {
      return _buildErrorScreen();
    }

    // Show appropriate screen based on flow
    switch (_flow) {
      case GameFlow.selection:
        return GameSelectionScreen(
          episode: _episode!,
          onSelectGame: _onSelectGame,
          onSkip: _onSkip,
        );

      case GameFlow.playing:
        return _buildGameWidget();

      case GameFlow.results:
        final gameState = ref.watch(gameProvider);
        if (gameState.result == null) {
          return _buildLoadingScreen();
        }
        return GameResultsScreen(
          result: gameState.result!,
          onContinue: _onContinue,
          onRetry: _onRetry,
          onBackToLibrary: _onBackToLibrary,
        );

      default:
        return _buildLoadingScreen();
    }
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'Loading game...',
              style: TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
        title: const Text('Error'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: AppColors.error,
              ),
              const SizedBox(height: 16),
              const Text(
                'Failed to load game',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _error ?? 'Unknown error',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _error = null;
                    _flow = GameFlow.loading;
                  });
                  _loadStory();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGameWidget() {
    if (_episode == null || _selectedGameType == null) {
      return _buildLoadingScreen();
    }

    // Get questions from mini game or generate from vocabulary
    List<Question> questions = [];

    if (_episode!.miniGame != null && _episode!.miniGame!.questions.isNotEmpty) {
      questions = _episode!.miniGame!.questions;
    } else {
      // Generate questions from vocabulary
      questions = _generateQuestionsFromVocabulary(_episode!);
    }

    if (questions.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.quiz_outlined,
                    size: 64,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No questions available',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This episode does not have enough vocabulary for games.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    switch (_selectedGameType!) {
      case GameType.multipleChoice:
        return MultipleChoiceGame(
          questions: questions,
          onComplete: _onGameComplete,
          onQuit: _onQuit,
        );

      case GameType.listening:
        // Filter questions with audio
        final audioQuestions =
            questions.where((q) => q.audioUrl != null && q.audioUrl!.isNotEmpty).toList();
        if (audioQuestions.isEmpty) {
          return _buildNoAudioScreen();
        }
        return ListeningQuizGame(
          questions: audioQuestions,
          onComplete: _onGameComplete,
          onQuit: _onQuit,
        );

      case GameType.wordMatch:
        return WordMatchGame(
          questions: questions,
          onComplete: _onGameComplete,
          onQuit: _onQuit,
        );
    }
  }

  Widget _buildNoAudioScreen() {
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
                  'No audio available',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This episode does not have audio for listening quiz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _flow = GameFlow.selection;
                    });
                  },
                  child: const Text('Choose Another Game'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Generate questions from vocabulary when mini game is not available
  List<Question> _generateQuestionsFromVocabulary(Episode episode) {
    final vocabulary = episode.vocabularyDetails;
    if (vocabulary.length < 4) return [];

    final questions = <Question>[];

    for (int i = 0; i < vocabulary.length && i < 10; i++) {
      final word = vocabulary[i];

      // Get correct answer from translation or definition (both may be null)
      final correctAnswer = word.translations?['th'] ??
          word.definition ??
          word.word;

      // Get 3 wrong options (filter out nulls)
      final wrongOptions = vocabulary
          .where((v) => v.word != word.word)
          .map((v) => v.translations?['th'] ?? v.definition ?? v.word)
          .where((ans) => ans != correctAnswer)
          .take(3)
          .toList();

      if (wrongOptions.length < 3) continue;

      final options = [correctAnswer, ...wrongOptions]..shuffle();

      questions.add(Question(
        id: 'gen-$i',
        question: 'What is the meaning of "${word.word}"?',
        audioUrl: word.audioUrl,
        options: options,
        correctAnswer: correctAnswer,
        explanation: word.definition ?? 'Correct answer: $correctAnswer',
      ));
    }

    return questions;
  }
}
