import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
abstract class GameResult with _$GameResult {
  const factory GameResult({
    required int score,
    required int correctCount,
    required int totalQuestions,
    required String tier, // fail, pass, good, perfect
    required int coinsEarned,
    required int timeTaken,
    @Default([]) List<AnswerRecord> answers,
  }) = _GameResult;

  factory GameResult.fromJson(Map<String, dynamic> json) =>
      _$GameResultFromJson(json);
}

@freezed
abstract class AnswerRecord with _$AnswerRecord {
  const factory AnswerRecord({
    required String questionId,
    required int selectedIndex,
    required bool isCorrect,
    required int timeTaken,
    @Default(false) bool usedHint,
  }) = _AnswerRecord;

  factory AnswerRecord.fromJson(Map<String, dynamic> json) =>
      _$AnswerRecordFromJson(json);
}

/// Enum representing game tier based on score
enum GameTier {
  fail,
  pass,
  good,
  perfect;

  /// Calculate tier from score percentage
  static GameTier fromScore(int score) {
    if (score >= 100) return GameTier.perfect;
    if (score >= 80) return GameTier.good;
    if (score >= 60) return GameTier.pass;
    return GameTier.fail;
  }

  /// Get coins reward for this tier
  int get coinsReward {
    switch (this) {
      case GameTier.perfect:
        return 50;
      case GameTier.good:
        return 30;
      case GameTier.pass:
        return 10;
      case GameTier.fail:
        return 0;
    }
  }
}
