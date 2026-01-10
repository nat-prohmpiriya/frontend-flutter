import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/models/vocabulary.dart';
import '../../providers/vocabulary_provider.dart';

/// Flashcard-style vocabulary review screen
/// Swipe right = knew it (mark as learned)
/// Swipe left = didn't know (mark as difficult)
class FullscreenPlayerScreen extends ConsumerStatefulWidget {
  final String albumId;
  final String albumName;
  final List<String> wordIds;

  const FullscreenPlayerScreen({
    super.key,
    required this.albumId,
    required this.albumName,
    required this.wordIds,
  });

  @override
  ConsumerState<FullscreenPlayerScreen> createState() =>
      _FullscreenPlayerScreenState();
}

class _FullscreenPlayerScreenState extends ConsumerState<FullscreenPlayerScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _showDefinition = false;
  bool _isAutoPlay = false;
  bool _isShuffle = false;
  late List<String> _wordOrder;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Swipe tracking
  double _dragOffset = 0;
  bool _isDragging = false;

  // Swipe threshold
  static const double _swipeThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    _wordOrder = List.from(widget.wordIds);
    // Hide status bar for immersive experience
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    // Restore status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  void _shuffle() {
    setState(() {
      _wordOrder.shuffle();
      _currentIndex = 0;
      _showDefinition = false;
    });
  }

  void _goToNext() {
    if (_currentIndex < _wordOrder.length - 1) {
      setState(() {
        _currentIndex++;
        _showDefinition = false;
        _dragOffset = 0;
      });
    } else {
      // Show completion dialog
      _showCompletionDialog();
    }
  }

  void _goToPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _showDefinition = false;
        _dragOffset = 0;
      });
    }
  }

  Future<void> _playAudio(String? audioUrl) async {
    if (audioUrl == null || audioUrl.isEmpty) return;

    try {
      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('Failed to play audio: $e');
    }
  }

  void _markAsLearned() {
    final wordId = _wordOrder[_currentIndex];
    ref.read(savedWordsProvider.notifier).updateWordStatus(
          wordId,
          'learned',
        );
    _goToNext();
  }

  void _markAsDifficult() {
    final wordId = _wordOrder[_currentIndex];
    ref.read(savedWordsProvider.notifier).updateWordStatus(
          wordId,
          'difficult',
        );
    _goToNext();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _isDragging = true;
      _dragOffset += details.delta.dx;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (_dragOffset.abs() > _swipeThreshold) {
      if (_dragOffset > 0) {
        // Swiped right - knew it
        _markAsLearned();
      } else {
        // Swiped left - didn't know
        _markAsDifficult();
      }
    }
    setState(() {
      _isDragging = false;
      _dragOffset = 0;
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkSurface
                : AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Row(
          children: [
            Icon(Icons.celebration, color: AppColors.success, size: 28),
            SizedBox(width: 12),
            Text('Practice Complete!'),
          ],
        ),
        content: Text(
          'You\'ve reviewed all ${widget.wordIds.length} words in "${widget.albumName}".',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 0;
                _showDefinition = false;
              });
            },
            child: const Text('Practice Again'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_wordOrder.isEmpty) {
      return Scaffold(
        backgroundColor: isDark ? AppColors.darkBackground : AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.library_books_outlined,
                size: 64,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
              ),
              const SizedBox(height: 16),
              Text(
                'No words to practice',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color:
                      isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
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
      );
    }

    final currentWordId = _wordOrder[_currentIndex];
    final vocabAsync = ref.watch(vocabularyDetailProvider(currentWordId));
    final progress = (_currentIndex + 1) / _wordOrder.length;

    // Calculate card transform based on drag
    final cardRotation = _dragOffset / 1000;
    final cardOpacity = (1 - (_dragOffset.abs() / 400)).clamp(0.5, 1.0);

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFF1E293B),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // Close button
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close, color: Colors.white70),
                  ),
                  // Album name
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          widget.albumName,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '${_currentIndex + 1} / ${_wordOrder.length}',
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Settings button
                  IconButton(
                    onPressed: () => _showSettingsSheet(isDark),
                    icon: const Icon(Icons.settings, color: Colors.white70),
                  ),
                ],
              ),
            ),
            // Progress bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white24,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.success),
                  minHeight: 6,
                ),
              ),
            ),
            // Card area
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _showDefinition = !_showDefinition),
                onHorizontalDragUpdate: _onHorizontalDragUpdate,
                onHorizontalDragEnd: _onHorizontalDragEnd,
                child: Center(
                  child: Stack(
                    children: [
                      // Swipe hint overlays
                      if (_isDragging) ...[
                        // Left hint (difficult)
                        Positioned(
                          left: 24,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 100),
                              opacity: _dragOffset < -50
                                  ? ((_dragOffset.abs() - 50) / 50).clamp(0, 1)
                                  : 0,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  color: AppColors.error,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Right hint (learned)
                        Positioned(
                          right: 24,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 100),
                              opacity: _dragOffset > 50
                                  ? ((_dragOffset - 50) / 50).clamp(0, 1)
                                  : 0,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                  color: AppColors.success,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                      // Card
                      Transform.translate(
                        offset: Offset(_dragOffset, 0),
                        child: Transform.rotate(
                          angle: cardRotation,
                          child: Opacity(
                            opacity: cardOpacity,
                            child: _buildCard(vocabAsync, isDark),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Hint text
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _showDefinition
                    ? 'Swipe right if you knew it, left if you didn\'t'
                    : 'Tap to reveal definition',
                style: const TextStyle(
                  color: Colors.white38,
                  fontSize: 14,
                ),
              ),
            ),
            // Control buttons
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Previous button
                  IconButton(
                    onPressed: _currentIndex > 0 ? _goToPrevious : null,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: _currentIndex > 0
                          ? Colors.white70
                          : Colors.white24,
                    ),
                  ),
                  // Difficult button
                  _buildActionButton(
                    icon: Icons.close,
                    color: AppColors.error,
                    label: 'Difficult',
                    onPressed: _markAsDifficult,
                  ),
                  // Audio button
                  vocabAsync.whenOrNull(
                        data: (vocab) => vocab.audioUrl != null
                            ? IconButton(
                                onPressed: () => _playAudio(vocab.audioUrl),
                                icon: const Icon(
                                  Icons.volume_up,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              )
                            : const SizedBox(width: 48),
                      ) ??
                      const SizedBox(width: 48),
                  // Learned button
                  _buildActionButton(
                    icon: Icons.check,
                    color: AppColors.success,
                    label: 'Learned',
                    onPressed: _markAsLearned,
                  ),
                  // Next button
                  IconButton(
                    onPressed: _currentIndex < _wordOrder.length - 1
                        ? _goToNext
                        : null,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: _currentIndex < _wordOrder.length - 1
                          ? Colors.white70
                          : Colors.white24,
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

  Widget _buildCard(AsyncValue<Vocabulary> vocabAsync, bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      constraints: const BoxConstraints(maxWidth: 400),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: vocabAsync.when(
            data: (vocab) => Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Word
                  Text(
                    vocab.word,
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (vocab.pronunciation != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      vocab.pronunciation!,
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  // Part of speech
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      vocab.partOfSpeech,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  // Definition (revealed on tap)
                  if (_showDefinition) ...[
                    const SizedBox(height: 32),
                    const Divider(),
                    const SizedBox(height: 16),
                    // Translation
                    if (vocab.translations.isNotEmpty)
                      Text(
                        vocab.translations['th'] ??
                            vocab.translations['en'] ??
                            '',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: 12),
                    // Definition
                    Text(
                      vocab.definition,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Example
                    if (vocab.meanings.isNotEmpty &&
                        vocab.meanings.first.example != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        '"${vocab.meanings.first.example}"',
                        style: const TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ] else ...[
                    const SizedBox(height: 48),
                    Icon(
                      Icons.touch_app,
                      size: 48,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap to reveal',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => const Center(
              child: Icon(
                Icons.error_outline,
                size: 48,
                color: AppColors.error,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: Colors.white, size: 28),
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  void _showSettingsSheet(bool isDark) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              // Title
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 20),
              // Shuffle option
              SwitchListTile(
                title: Text(
                  'Shuffle Words',
                  style: TextStyle(
                    color:
                        isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                  ),
                ),
                subtitle: Text(
                  'Randomize word order',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
                value: _isShuffle,
                onChanged: (value) {
                  setState(() => _isShuffle = value);
                  if (value) _shuffle();
                  Navigator.pop(context);
                },
                activeColor: AppColors.primary,
              ),
              // Auto-play audio option
              SwitchListTile(
                title: Text(
                  'Auto-play Audio',
                  style: TextStyle(
                    color:
                        isDark ? AppColors.darkTextPrimary : AppColors.textPrimary,
                  ),
                ),
                subtitle: Text(
                  'Play word pronunciation automatically',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.textSecondary,
                  ),
                ),
                value: _isAutoPlay,
                onChanged: (value) {
                  setState(() => _isAutoPlay = value);
                  Navigator.pop(context);
                },
                activeColor: AppColors.primary,
              ),
              const SizedBox(height: 20),
              // Restart button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        _currentIndex = 0;
                        _showDefinition = false;
                        if (_isShuffle) _shuffle();
                      });
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Restart Practice'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
