import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/models/progress.dart';
import '../../providers/vocabulary_provider.dart';

/// Individual word card with word text, phonetic, definition, and status
class WordCard extends ConsumerStatefulWidget {
  final SavedWord savedWord;
  final bool isDark;
  final VoidCallback? onLongPress;

  const WordCard({
    super.key,
    required this.savedWord,
    required this.isDark,
    this.onLongPress,
  });

  @override
  ConsumerState<WordCard> createState() => _WordCardState();
}

class _WordCardState extends ConsumerState<WordCard> {
  bool _isExpanded = false;
  bool _isPlayingAudio = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  /// Get color for word status
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'learning':
        return const Color(0xFF3B82F6); // Blue
      case 'learned':
        return const Color(0xFF22C55E); // Green
      case 'difficult':
        return const Color(0xFFEF4444); // Red
      default:
        return AppColors.textSecondary;
    }
  }

  Future<void> _playAudio(String? audioUrl) async {
    if (audioUrl == null || audioUrl.isEmpty) return;

    setState(() => _isPlayingAudio = true);
    try {
      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();
    } catch (e) {
      debugPrint('Failed to play audio: $e');
    } finally {
      setState(() => _isPlayingAudio = false);
    }
  }

  void _showOptionsMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildOptionsSheet(),
    );
  }

  Widget _buildOptionsSheet() {
    return Container(
      decoration: BoxDecoration(
        color: widget.isDark ? AppColors.darkSurface : AppColors.surface,
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
                color: widget.isDark ? AppColors.darkBorder : AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            // Word title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.savedWord.odId,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Options
            _buildOptionItem(
              icon: Icons.folder_outlined,
              label: 'Move to Album',
              onTap: () {
                Navigator.pop(context);
                // TODO: Show album picker
              },
            ),
            _buildOptionItem(
              icon: Icons.check_circle_outline,
              label: 'Mark as Learned',
              onTap: () {
                Navigator.pop(context);
                ref
                    .read(savedWordsProvider.notifier)
                    .updateWordStatus(widget.savedWord.odId, 'learned');
              },
            ),
            _buildOptionItem(
              icon: Icons.warning_amber_outlined,
              label: 'Mark as Difficult',
              onTap: () {
                Navigator.pop(context);
                ref
                    .read(savedWordsProvider.notifier)
                    .updateWordStatus(widget.savedWord.odId, 'difficult');
              },
            ),
            _buildOptionItem(
              icon: Icons.delete_outline,
              label: 'Remove from My Words',
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation();
              },
              isDestructive: true,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: isDestructive
                  ? AppColors.error
                  : (widget.isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isDestructive
                    ? AppColors.error
                    : (widget.isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor:
            widget.isDark ? AppColors.darkSurface : AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Remove Word?',
          style: TextStyle(
            color: widget.isDark
                ? AppColors.darkTextPrimary
                : AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to remove "${widget.savedWord.odId}" from your saved words?',
          style: TextStyle(
            color: widget.isDark
                ? AppColors.darkTextSecondary
                : AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: widget.isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref
                  .read(savedWordsProvider.notifier)
                  .removeWord(widget.savedWord.odId);
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vocabAsync = ref.watch(vocabularyDetailProvider(widget.savedWord.odId));
    final statusColor = getStatusColor(widget.savedWord.status);

    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      onLongPress: widget.onLongPress ?? _showOptionsMenu,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Word text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.savedWord.odId,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: widget.isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.textPrimary,
                          ),
                        ),
                        // Phonetic & Part of speech
                        vocabAsync.when(
                          data: (vocab) => Row(
                            children: [
                              if (vocab.pronunciation != null) ...[
                                Text(
                                  vocab.pronunciation!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: widget.isDark
                                        ? AppColors.darkTextSecondary
                                        : AppColors.textSecondary,
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  vocab.partOfSpeech,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          loading: () => const SizedBox.shrink(),
                          error: (_, __) => const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                  // Audio button
                  vocabAsync.whenOrNull(
                        data: (vocab) => vocab.audioUrl != null
                            ? IconButton(
                                onPressed: () => _playAudio(vocab.audioUrl),
                                icon: Icon(
                                  _isPlayingAudio
                                      ? Icons.stop_circle
                                      : Icons.volume_up,
                                  color: AppColors.primary,
                                ),
                              )
                            : null,
                      ) ??
                      const SizedBox.shrink(),
                  // Status indicator
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.savedWord.status.substring(0, 1).toUpperCase() +
                              widget.savedWord.status.substring(1),
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Definition (truncated or full based on expanded state)
              vocabAsync.when(
                data: (vocab) => Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    vocab.definition,
                    maxLines: _isExpanded ? null : 2,
                    overflow:
                        _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.textSecondary,
                    ),
                  ),
                ),
                loading: () => Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: widget.isDark
                          ? AppColors.darkBorder
                          : AppColors.border,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                error: (_, __) => const SizedBox.shrink(),
              ),
              // Expanded content: translations, examples, etc.
              if (_isExpanded)
                vocabAsync.when(
                  data: (vocab) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 8),
                      // Translation
                      if (vocab.translations.isNotEmpty) ...[
                        Text(
                          'Translation',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: widget.isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          vocab.translations['th'] ?? vocab.translations['en'] ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: widget.isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                      // Meanings with examples
                      if (vocab.meanings.isNotEmpty) ...[
                        Text(
                          'Examples',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: widget.isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        ...vocab.meanings.take(2).map(
                              (meaning) => meaning.example != null
                                  ? Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        '"${meaning.example}"',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                          color: widget.isDark
                                              ? AppColors.darkTextSecondary
                                              : AppColors.textSecondary,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                        const SizedBox(height: 12),
                      ],
                      // Synonyms
                      if (vocab.synonyms.isNotEmpty) ...[
                        Text(
                          'Synonyms',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: widget.isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: vocab.synonyms.take(5).map((syn) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: widget.isDark
                                    ? AppColors.darkBorder
                                    : AppColors.background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                syn,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: widget.isDark
                                      ? AppColors.darkTextSecondary
                                      : AppColors.textSecondary,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                      const SizedBox(height: 8),
                      // View full details button
                      Center(
                        child: TextButton.icon(
                          onPressed: () {
                            context.push('/vocabulary/word/${widget.savedWord.odId}');
                          },
                          icon: const Icon(Icons.open_in_new, size: 16),
                          label: const Text('View Full Details'),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
