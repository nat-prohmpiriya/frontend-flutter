import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/providers/preferences_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../providers/reader_provider.dart';
import '../widgets/overlay_controls.dart';
import '../widgets/page_view_widget.dart';
import '../widgets/translation_panel.dart';
import '../widgets/vocabulary_panel.dart';

/// Main reader screen with vertical swipe navigation
class ReaderScreen extends ConsumerStatefulWidget {
  final String slug;
  final int initialEpisode;

  const ReaderScreen({
    super.key,
    required this.slug,
    this.initialEpisode = 1,
  });

  @override
  ConsumerState<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends ConsumerState<ReaderScreen> {
  late PageController _pageController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Timer? _overlayTimer;
  bool _isAudioPlaying = false;

  /// Swipe threshold in pixels
  static const double swipeThreshold = 50.0;

  /// Overlay auto-hide delay in seconds
  static const int overlayHideDelay = 3;

  /// Horizontal swipe start position
  double? _horizontalDragStart;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Load story after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(readerProvider(widget.slug).notifier)
          .loadStory(initialEpisode: widget.initialEpisode);
    });

    // Set immersive mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // Start overlay timer
    _startOverlayTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _audioPlayer.dispose();
    _overlayTimer?.cancel();

    // Restore system UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  void _startOverlayTimer() {
    _overlayTimer?.cancel();
    _overlayTimer = Timer(const Duration(seconds: overlayHideDelay), () {
      if (mounted) {
        ref.read(readerProvider(widget.slug).notifier).hideOverlay();
      }
    });
  }

  void _onTapScreen() {
    final notifier = ref.read(readerProvider(widget.slug).notifier);
    notifier.toggleOverlayControls();
    _startOverlayTimer();
  }

  void _onPageChanged(int page) {
    // Page controller uses 0-based index
    final notifier = ref.read(readerProvider(widget.slug).notifier);
    notifier.goToPage(page + 1);
  }

  Future<void> _playAudio(String audioUrl) async {
    try {
      await _audioPlayer.setUrl(audioUrl);
      await _audioPlayer.play();
      setState(() => _isAudioPlaying = true);

      // Listen for playback completion
      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          setState(() => _isAudioPlaying = false);
        }
      });
    } catch (e) {
      // Handle audio error silently
      setState(() => _isAudioPlaying = false);
    }
  }

  Future<void> _toggleAudio() async {
    final currentPage = ref
        .read(readerProvider(widget.slug).notifier)
        .getCurrentPage();

    if (currentPage?.audioUrl != null && currentPage!.audioUrl.isNotEmpty) {
      if (_isAudioPlaying) {
        await _audioPlayer.pause();
        setState(() => _isAudioPlaying = false);
      } else {
        await _playAudio(currentPage.audioUrl);
      }
    }
  }

  void _handleHorizontalDragStart(DragStartDetails details) {
    _horizontalDragStart = details.globalPosition.dx;
  }

  void _handleHorizontalDragEnd(DragEndDetails details) {
    if (_horizontalDragStart == null) return;

    final endX = details.globalPosition.dx;
    final delta = endX - _horizontalDragStart!;
    final notifier = ref.read(readerProvider(widget.slug).notifier);
    final readerState = ref.read(readerProvider(widget.slug));

    // Swipe right -> show translation panel
    if (delta > swipeThreshold && !readerState.isTranslationPanelOpen) {
      notifier.toggleTranslationPanel();
    }
    // Swipe left -> show vocabulary panel
    else if (delta < -swipeThreshold && !readerState.isVocabularyPanelOpen) {
      notifier.toggleVocabularyPanel();
    }
    // Swipe to close panels
    else if (delta < -swipeThreshold && readerState.isTranslationPanelOpen) {
      notifier.toggleTranslationPanel();
    } else if (delta > swipeThreshold && readerState.isVocabularyPanelOpen) {
      notifier.toggleVocabularyPanel();
    }

    _horizontalDragStart = null;
  }

  @override
  Widget build(BuildContext context) {
    final readerState = ref.watch(readerProvider(widget.slug));
    final notifier = ref.read(readerProvider(widget.slug).notifier);
    final preferencesAsync = ref.watch(appPreferencesProvider);
    final nativeLanguage = preferencesAsync.value?.appLanguage ?? 'th';

    if (readerState.isLoading) {
      return _buildLoadingScreen();
    }

    if (readerState.error != null) {
      return _buildErrorScreen(readerState.error!);
    }

    if (readerState.story == null) {
      return _buildErrorScreen('Story not found');
    }

    final story = readerState.story!;
    final currentEpisode = notifier.getCurrentEpisode();
    final currentPage = notifier.getCurrentPage();

    // Update page controller when page changes externally
    if (_pageController.hasClients) {
      final targetPage = readerState.currentPage - 1;
      if (_pageController.page?.round() != targetPage) {
        _pageController.animateToPage(
          targetPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.surface,
      body: GestureDetector(
        onTap: _onTapScreen,
        onHorizontalDragStart: _handleHorizontalDragStart,
        onHorizontalDragEnd: _handleHorizontalDragEnd,
        child: Stack(
          children: [
            // Main page view
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              onPageChanged: _onPageChanged,
              itemCount: currentEpisode?.pages.length ?? 0,
              itemBuilder: (context, index) {
                final page = currentEpisode?.pages[index];
                if (page == null) return const SizedBox.shrink();

                return PageViewWidget(
                  page: page,
                  level: story.level,
                  nativeLanguage: nativeLanguage,
                  onWordTap: (word) {
                    notifier.selectWord(word);
                    notifier.toggleVocabularyPanel();
                  },
                  onPlayAudio: () => _playAudio(page.audioUrl),
                );
              },
            ),

            // Overlay controls
            OverlayControls(
              isVisible: readerState.showOverlayControls,
              title: story.title.en,
              currentEpisode: readerState.currentEpisode,
              totalEpisodes: story.episodes.length,
              currentPage: readerState.currentPage,
              totalPages: currentEpisode?.pages.length ?? 0,
              canGoPrevious: notifier.canGoPrevious(),
              canGoNext: notifier.canGoNext(),
              isAudioPlaying: _isAudioPlaying,
              onBack: () => context.pop(),
              onPrevious: () => notifier.previousPage(),
              onNext: () => notifier.nextPage(),
              onSettings: () => _showSettingsModal(context),
              onToggleAudio: _toggleAudio,
              onShowTranslation: () => notifier.toggleTranslationPanel(),
              onShowVocabulary: () => notifier.toggleVocabularyPanel(),
            ),

            // Translation panel (slides from left)
            TranslationPanel(
              isOpen: readerState.isTranslationPanelOpen,
              currentPage: currentPage,
              nativeLanguage: nativeLanguage,
              onClose: () => notifier.toggleTranslationPanel(),
            ),

            // Vocabulary panel (slides from right)
            VocabularyPanel(
              isOpen: readerState.isVocabularyPanelOpen,
              currentEpisode: currentEpisode,
              selectedWord: readerState.selectedWord,
              nativeLanguage: nativeLanguage,
              onClose: () => notifier.toggleVocabularyPanel(),
              onWordTap: (word) => notifier.selectWord(word),
              onPlayAudio: (audioUrl) => _playAudio(audioUrl),
            ),

            // Backdrop for panels
            if (readerState.isTranslationPanelOpen ||
                readerState.isVocabularyPanelOpen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => notifier.closePanels(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    color: Colors.black.withValues(
                      alpha: (readerState.isTranslationPanelOpen ||
                              readerState.isVocabularyPanelOpen)
                          ? 0.4
                          : 0.0,
                    ),
                  ),
                ),
              ),

            // Re-render panels on top of backdrop
            if (readerState.isTranslationPanelOpen)
              TranslationPanel(
                isOpen: readerState.isTranslationPanelOpen,
                currentPage: currentPage,
                nativeLanguage: nativeLanguage,
                onClose: () => notifier.toggleTranslationPanel(),
              ),
            if (readerState.isVocabularyPanelOpen)
              VocabularyPanel(
                isOpen: readerState.isVocabularyPanelOpen,
                currentEpisode: currentEpisode,
                selectedWord: readerState.selectedWord,
                nativeLanguage: nativeLanguage,
                onClose: () => notifier.toggleVocabularyPanel(),
                onWordTap: (word) => notifier.selectWord(word),
                onPlayAudio: (audioUrl) => _playAudio(audioUrl),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.surface,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: AppColors.primary,
            ),
            SizedBox(height: 16),
            Text(
              'Loading story...',
              style: TextStyle(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorScreen(String error) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.surface,
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
              Text(
                'Failed to load story',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                error,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(readerProvider(widget.slug).notifier)
                      .loadStory(initialEpisode: widget.initialEpisode);
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

  void _showSettingsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.darkSurface
          : AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => _ReaderSettingsSheet(),
    );
  }
}

/// Reader settings bottom sheet
class _ReaderSettingsSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              'Reader Settings',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 24),

            // Text size setting
            _buildSettingRow(
              context,
              icon: Icons.text_fields,
              title: 'Text Size',
              subtitle: 'Adjust reading text size',
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      // TODO: Decrease text size
                    },
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  const Text('18'),
                  IconButton(
                    onPressed: () {
                      // TODO: Increase text size
                    },
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Auto-play audio setting
            _buildSettingRow(
              context,
              icon: Icons.volume_up,
              title: 'Auto-play Audio',
              subtitle: 'Play audio when page changes',
              trailing: Switch(
                value: false,
                onChanged: (value) {
                  // TODO: Toggle auto-play
                },
                activeTrackColor: AppColors.primary,
              ),
            ),

            const SizedBox(height: 16),

            // Show images setting
            _buildSettingRow(
              context,
              icon: Icons.image,
              title: 'Show Images',
              subtitle: 'Display story illustrations',
              trailing: Switch(
                value: true,
                onChanged: (value) {
                  // TODO: Toggle images
                },
                activeTrackColor: AppColors.primary,
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
            ],
          ),
        ),
        trailing,
      ],
    );
  }
}
