import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Top and bottom overlay control bars
class OverlayControls extends StatelessWidget {
  final bool isVisible;
  final String title;
  final int currentEpisode;
  final int totalEpisodes;
  final int currentPage;
  final int totalPages;
  final bool canGoPrevious;
  final bool canGoNext;
  final bool isAudioPlaying;
  final VoidCallback onBack;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSettings;
  final VoidCallback onToggleAudio;
  final VoidCallback? onShowTranslation;
  final VoidCallback? onShowVocabulary;

  /// Animation duration for overlay fade
  static const int animationDurationMs = 300;

  const OverlayControls({
    super.key,
    required this.isVisible,
    required this.title,
    required this.currentEpisode,
    required this.totalEpisodes,
    required this.currentPage,
    required this.totalPages,
    required this.canGoPrevious,
    required this.canGoNext,
    this.isAudioPlaying = false,
    required this.onBack,
    required this.onPrevious,
    required this.onNext,
    required this.onSettings,
    required this.onToggleAudio,
    this.onShowTranslation,
    this.onShowVocabulary,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: animationDurationMs),
      curve: Curves.easeInOut,
      child: IgnorePointer(
        ignoring: !isVisible,
        child: Column(
          children: [
            // Top bar
            _buildTopBar(context),

            const Spacer(),

            // Bottom bar
            _buildBottomBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            (isDark ? Colors.black : Colors.black).withValues(alpha: 0.7),
            Colors.transparent,
          ],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              // Back button
              IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                color: Colors.white,
                tooltip: 'Back',
              ),

              // Title and progress
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Episode $currentEpisode/$totalEpisodes - Page $currentPage/$totalPages',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                    ),
                  ],
                ),
              ),

              // Settings button
              IconButton(
                onPressed: onSettings,
                icon: const Icon(Icons.settings_outlined, size: 22),
                color: Colors.white,
                tooltip: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            (isDark ? Colors.black : Colors.black).withValues(alpha: 0.7),
            Colors.transparent,
          ],
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Translation button
              if (onShowTranslation != null)
                _buildActionButton(
                  context,
                  icon: Icons.translate,
                  label: 'Translate',
                  onTap: onShowTranslation!,
                ),

              // Previous button
              _buildNavigationButton(
                context,
                icon: Icons.chevron_left,
                label: 'Previous',
                onTap: onPrevious,
                enabled: canGoPrevious,
              ),

              // Audio play/pause button
              _buildPlayButton(context),

              // Next button
              _buildNavigationButton(
                context,
                icon: Icons.chevron_right,
                label: 'Next',
                onTap: onNext,
                enabled: canGoNext,
              ),

              // Vocabulary button
              if (onShowVocabulary != null)
                _buildActionButton(
                  context,
                  icon: Icons.library_books_outlined,
                  label: 'Vocab',
                  onTap: onShowVocabulary!,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool enabled,
  }) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedOpacity(
        opacity: enabled ? 1.0 : 0.4,
        duration: const Duration(milliseconds: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayButton(BuildContext context) {
    return GestureDetector(
      onTap: onToggleAudio,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              isAudioPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            isAudioPlaying ? 'Pause' : 'Play',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
