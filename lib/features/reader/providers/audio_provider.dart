import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart' as just_audio;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_provider.freezed.dart';
part 'audio_provider.g.dart';

@freezed
abstract class AudioState with _$AudioState {
  const factory AudioState({
    @Default(false) bool isPlaying,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default(1.0) double speed,
    @Default('us') String accent,
    String? currentUrl,
    String? error,
    @Default(false) bool isLoading,
    @Default(false) bool isBuffering,
  }) = _AudioState;

  factory AudioState.initial() => const AudioState();
}

@riverpod
class AudioPlayer extends _$AudioPlayer {
  late final just_audio.AudioPlayer _player;

  @override
  AudioState build() {
    _player = just_audio.AudioPlayer();

    // Listen to player state changes
    _player.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;

      state = state.copyWith(
        isPlaying: isPlaying,
        isBuffering: processingState == just_audio.ProcessingState.buffering,
        isLoading: processingState == just_audio.ProcessingState.loading,
      );

      // Handle completion
      if (processingState == just_audio.ProcessingState.completed) {
        state = state.copyWith(isPlaying: false, position: Duration.zero);
        _player.seek(Duration.zero);
        _player.pause();
      }
    });

    // Listen to position changes
    _player.positionStream.listen((position) {
      state = state.copyWith(position: position);
    });

    // Listen to duration changes
    _player.durationStream.listen((duration) {
      if (duration != null) {
        state = state.copyWith(duration: duration);
      }
    });

    // Handle errors
    _player.playbackEventStream.listen(
      (_) {},
      onError: (Object e, StackTrace st) {
        state = state.copyWith(error: e.toString(), isPlaying: false);
      },
    );

    ref.onDispose(() => _player.dispose());

    return AudioState.initial();
  }

  /// Set audio source from URL
  Future<void> setSource(String url) async {
    if (state.currentUrl == url) return;

    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        currentUrl: url,
      );

      await _player.setUrl(url);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  /// Play audio
  Future<void> play() async {
    try {
      await _player.play();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Pause audio
  Future<void> pause() async {
    try {
      await _player.pause();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Stop audio and reset position
  Future<void> stop() async {
    try {
      await _player.stop();
      state = state.copyWith(position: Duration.zero);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Seek to position
  Future<void> seek(Duration position) async {
    try {
      await _player.seek(position);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  /// Set playback speed
  void setSpeed(double speed) {
    _player.setSpeed(speed);
    state = state.copyWith(speed: speed);
  }

  /// Set accent preference (US/UK)
  void setAccent(String accent) {
    state = state.copyWith(accent: accent);
  }

  /// Toggle play/pause
  Future<void> togglePlayPause() async {
    if (state.isPlaying) {
      await pause();
    } else {
      await play();
    }
  }
}
