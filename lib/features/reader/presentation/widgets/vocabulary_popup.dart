import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart' as just_audio;

import '../../../../core/models/vocabulary.dart';
import '../../../../core/providers/audio_settings_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../vocabulary/providers/vocabulary_provider.dart';

/// Bottom sheet popup for vocabulary word details
class VocabularyPopup extends ConsumerStatefulWidget {
  const VocabularyPopup({
    super.key,
    required this.word,
    this.vocabulary,
    this.audioUrlUs,
    this.audioUrlUk,
  });

  final String word;
  final Vocabulary? vocabulary;
  final String? audioUrlUs;
  final String? audioUrlUk;

  /// Show the vocabulary popup as a modal bottom sheet
  static Future<void> show(
    BuildContext context, {
    required String word,
    Vocabulary? vocabulary,
    String? audioUrlUs,
    String? audioUrlUk,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      builder: (context) => VocabularyPopup(
        word: word,
        vocabulary: vocabulary,
        audioUrlUs: audioUrlUs,
        audioUrlUk: audioUrlUk,
      ),
    );
  }

  @override
  ConsumerState<VocabularyPopup> createState() => _VocabularyPopupState();
}

class _VocabularyPopupState extends ConsumerState<VocabularyPopup> {
  late final just_audio.AudioPlayer _audioPlayer;
  bool _isPlayingAudio = false;
  String _currentAccent = 'us';

  @override
  void initState() {
    super.initState();
    _audioPlayer = just_audio.AudioPlayer();
    _loadAccentPreference();
  }

  Future<void> _loadAccentPreference() async {
    final settings = await ref.read(audioSettingsProvider.future);
    if (mounted) {
      setState(() {
        _currentAccent = settings.accent;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    final audioUrl = _currentAccent == 'uk'
        ? (widget.audioUrlUk ?? widget.vocabulary?.audioUrl)
        : (widget.audioUrlUs ?? widget.vocabulary?.audioUrl);

    if (audioUrl == null) return;

    setState(() => _isPlayingAudio = true);

    try {
      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();
      await _audioPlayer.playerStateStream.firstWhere(
        (state) => state.processingState == just_audio.ProcessingState.completed,
      );
    } catch (e) {
      debugPrint('Error playing audio: $e');
    } finally {
      if (mounted) {
        setState(() => _isPlayingAudio = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Try to fetch vocabulary details if not provided
    final vocabAsync = widget.vocabulary != null
        ? AsyncData<Vocabulary>(widget.vocabulary!)
        : ref.watch(vocabularyDetailProvider(widget.word));

    final isSaved = ref.watch(isWordSavedProvider(widget.word));

    return DraggableScrollableSheet(
      initialChildSize: 1.0,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              // Content
              Expanded(
                child: vocabAsync.when(
                  data: (vocab) => _buildContent(
                    context,
                    vocab,
                    isSaved,
                    scrollController,
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, _) => _buildErrorContent(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    Vocabulary vocab,
    bool isSaved,
    ScrollController scrollController,
  ) {
    final hasMultipleAccents =
        widget.audioUrlUs != null && widget.audioUrlUk != null;

    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Word header with audio button
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Word in large text
                    Text(
                      vocab.word,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                    ),
                    const SizedBox(height: 4),
                    // Phonetic/IPA pronunciation
                    if (vocab.pronunciation != null)
                      Text(
                        vocab.pronunciation!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.textSecondary,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                  ],
                ),
              ),
              // Audio play button with accent toggle
              Column(
                children: [
                  _AudioPlayButton(
                    isPlaying: _isPlayingAudio,
                    onPressed: _playAudio,
                    hasAudio: vocab.audioUrl != null ||
                        widget.audioUrlUs != null ||
                        widget.audioUrlUk != null,
                  ),
                  if (hasMultipleAccents) ...[
                    const SizedBox(height: 8),
                    _AccentToggle(
                      currentAccent: _currentAccent,
                      onAccentChanged: (accent) {
                        setState(() => _currentAccent = accent);
                        ref.read(audioSettingsProvider.notifier).setAccent(accent);
                      },
                    ),
                  ],
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Part of speech tag
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.purple.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              vocab.partOfSpeech,
              style: const TextStyle(
                color: AppColors.purple,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Definition
          Text(
            'Definition',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            vocab.definition,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          // Thai translation
          if (vocab.translations.containsKey('th')) ...[
            const SizedBox(height: 16),
            Text(
              'Thai',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              vocab.translations['th']!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primary,
                  ),
            ),
          ],
          // Example sentences from meanings
          if (vocab.meanings.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Examples',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 8),
            ...vocab.meanings
                .where((m) => m.example != null)
                .take(2)
                .map((meaning) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                          border: const Border(
                            left: BorderSide(
                              color: AppColors.primary,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          meaning.example!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                    )),
          ],
          // Synonyms
          if (vocab.synonyms.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              'Synonyms',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: vocab.synonyms
                  .take(5)
                  .map((syn) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          syn,
                          style: const TextStyle(
                            color: AppColors.secondary,
                            fontSize: 13,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ],
          const SizedBox(height: 24),
          // Save Word button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _toggleSaveWord(vocab.word, isSaved),
              icon: Icon(
                isSaved ? Icons.bookmark : Icons.bookmark_border,
              ),
              label: Text(isSaved ? 'Saved' : 'Save Word'),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSaved ? AppColors.secondary : AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Show basic word info even on error
            Text(
              widget.word,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Could not load vocabulary details',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                ref.invalidate(vocabularyDetailProvider(widget.word));
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _toggleSaveWord(String word, bool isSaved) async {
    final notifier = ref.read(savedWordsProvider.notifier);
    try {
      if (isSaved) {
        await notifier.removeWord(word);
      } else {
        await notifier.saveWord(word);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to ${isSaved ? 'remove' : 'save'} word'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}

/// Audio play button widget
class _AudioPlayButton extends StatelessWidget {
  const _AudioPlayButton({
    required this.isPlaying,
    required this.onPressed,
    required this.hasAudio,
  });

  final bool isPlaying;
  final VoidCallback onPressed;
  final bool hasAudio;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: hasAudio ? AppColors.primary : Colors.grey[300],
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: hasAudio ? onPressed : null,
          customBorder: const CircleBorder(),
          child: Center(
            child: isPlaying
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Icon(
                    Icons.volume_up,
                    color: hasAudio ? Colors.white : Colors.grey,
                    size: 24,
                  ),
          ),
        ),
      ),
    );
  }
}

/// Accent toggle for US/UK pronunciation
class _AccentToggle extends StatelessWidget {
  const _AccentToggle({
    required this.currentAccent,
    required this.onAccentChanged,
  });

  final String currentAccent;
  final ValueChanged<String> onAccentChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _AccentButton(
            label: 'US',
            isSelected: currentAccent == 'us',
            onTap: () => onAccentChanged('us'),
          ),
          _AccentButton(
            label: 'UK',
            isSelected: currentAccent == 'uk',
            onTap: () => onAccentChanged('uk'),
          ),
        ],
      ),
    );
  }
}

class _AccentButton extends StatelessWidget {
  const _AccentButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textSecondary,
            fontWeight: FontWeight.w600,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
