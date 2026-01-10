import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/audio_settings_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/speed_selector.dart';
import '../../providers/audio_provider.dart';

/// Mini audio player bar for story reader
class AudioPlayerBar extends ConsumerWidget {
  const AudioPlayerBar({
    super.key,
    this.audioUrlUs,
    this.audioUrlUk,
    this.showAccentSelector = true,
  });

  final String? audioUrlUs;
  final String? audioUrlUk;
  final bool showAccentSelector;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioState = ref.watch(audioPlayerProvider);
    final audioPlayer = ref.read(audioPlayerProvider.notifier);
    final audioSettings = ref.watch(audioSettingsProvider);

    final hasMultipleAccents = audioUrlUs != null && audioUrlUk != null;
    final currentAccent = audioSettings.value?.accent ?? 'us';
    final currentSpeed = audioSettings.value?.speed ?? 1.0;

    // Get the appropriate audio URL based on accent
    String? getCurrentAudioUrl() {
      if (hasMultipleAccents) {
        return currentAccent == 'uk' ? audioUrlUk : audioUrlUs;
      }
      return audioUrlUs ?? audioUrlUk;
    }

    final audioUrl = getCurrentAudioUrl();
    final hasAudio = audioUrl != null;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Progress slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 6,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 14,
                ),
                activeTrackColor: AppColors.primary,
                inactiveTrackColor: AppColors.primary.withValues(alpha: 0.2),
                thumbColor: AppColors.primary,
                overlayColor: AppColors.primary.withValues(alpha: 0.2),
              ),
              child: Slider(
                value: _clampPosition(audioState),
                max: _getDurationSeconds(audioState),
                onChanged: hasAudio
                    ? (value) {
                        audioPlayer.seek(Duration(seconds: value.toInt()));
                      }
                    : null,
              ),
            ),
            // Time display
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(audioState.position),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  Text(
                    _formatDuration(audioState.duration),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Controls row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Speed selector
                SpeedSelector(
                  currentSpeed: currentSpeed,
                  onSpeedChanged: (speed) {
                    ref.read(audioSettingsProvider.notifier).setSpeed(speed);
                    audioPlayer.setSpeed(speed);
                  },
                ),
                const SizedBox(width: 16),
                // Skip backward 10s
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  iconSize: 32,
                  color: hasAudio ? AppColors.textPrimary : Colors.grey,
                  onPressed: hasAudio
                      ? () {
                          final newPosition = audioState.position -
                              const Duration(seconds: 10);
                          audioPlayer.seek(
                            newPosition < Duration.zero
                                ? Duration.zero
                                : newPosition,
                          );
                        }
                      : null,
                ),
                const SizedBox(width: 8),
                // Play/Pause button
                _PlayPauseButton(
                  isPlaying: audioState.isPlaying,
                  isLoading: audioState.isLoading || audioState.isBuffering,
                  hasAudio: hasAudio,
                  onPressed: hasAudio
                      ? () async {
                          // Load audio if not loaded yet
                          if (audioState.currentUrl != audioUrl) {
                            await audioPlayer.setSource(audioUrl);
                            // Apply current speed setting
                            audioPlayer.setSpeed(currentSpeed);
                          }
                          await audioPlayer.togglePlayPause();
                        }
                      : null,
                ),
                const SizedBox(width: 8),
                // Skip forward 10s
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  iconSize: 32,
                  color: hasAudio ? AppColors.textPrimary : Colors.grey,
                  onPressed: hasAudio
                      ? () {
                          final newPosition = audioState.position +
                              const Duration(seconds: 10);
                          audioPlayer.seek(
                            newPosition > audioState.duration
                                ? audioState.duration
                                : newPosition,
                          );
                        }
                      : null,
                ),
                const SizedBox(width: 16),
                // Accent selector (US/UK)
                if (showAccentSelector && hasMultipleAccents)
                  _AccentSelector(
                    currentAccent: currentAccent,
                    onAccentChanged: (accent) async {
                      await ref
                          .read(audioSettingsProvider.notifier)
                          .setAccent(accent);
                      audioPlayer.setAccent(accent);
                      // Reload audio with new accent
                      final newUrl = accent == 'uk' ? audioUrlUk : audioUrlUs;
                      if (newUrl != null) {
                        await audioPlayer.setSource(newUrl);
                        audioPlayer.setSpeed(currentSpeed);
                      }
                    },
                  )
                else
                  const SizedBox(width: 48), // Placeholder for layout balance
              ],
            ),
          ],
        ),
      ),
    );
  }

  double _clampPosition(AudioState state) {
    final maxDuration = _getDurationSeconds(state);
    if (maxDuration <= 0) return 0;
    final position = state.position.inSeconds.toDouble();
    return position.clamp(0, maxDuration);
  }

  double _getDurationSeconds(AudioState state) {
    final seconds = state.duration.inSeconds.toDouble();
    return seconds > 0 ? seconds : 1;
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

/// Play/Pause button with loading indicator
class _PlayPauseButton extends StatelessWidget {
  const _PlayPauseButton({
    required this.isPlaying,
    required this.isLoading,
    required this.hasAudio,
    required this.onPressed,
  });

  final bool isPlaying;
  final bool isLoading;
  final bool hasAudio;
  final VoidCallback? onPressed;

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
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 28,
                  ),
          ),
        ),
      ),
    );
  }
}

/// Accent selector toggle (US/UK)
class _AccentSelector extends StatelessWidget {
  const _AccentSelector({
    required this.currentAccent,
    required this.onAccentChanged,
  });

  final String currentAccent;
  final ValueChanged<String> onAccentChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _AccentOption(
            label: 'US',
            isSelected: currentAccent == 'us',
            onTap: () => onAccentChanged('us'),
          ),
          _AccentOption(
            label: 'UK',
            isSelected: currentAccent == 'uk',
            onTap: () => onAccentChanged('uk'),
          ),
        ],
      ),
    );
  }
}

class _AccentOption extends StatelessWidget {
  const _AccentOption({
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primary,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
