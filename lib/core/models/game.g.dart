// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameResult _$GameResultFromJson(Map<String, dynamic> json) => _GameResult(
  score: (json['score'] as num).toInt(),
  correctCount: (json['correctCount'] as num).toInt(),
  totalQuestions: (json['totalQuestions'] as num).toInt(),
  tier: json['tier'] as String,
  coinsEarned: (json['coinsEarned'] as num).toInt(),
  timeTaken: (json['timeTaken'] as num).toInt(),
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswerRecord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$GameResultToJson(_GameResult instance) =>
    <String, dynamic>{
      'score': instance.score,
      'correctCount': instance.correctCount,
      'totalQuestions': instance.totalQuestions,
      'tier': instance.tier,
      'coinsEarned': instance.coinsEarned,
      'timeTaken': instance.timeTaken,
      'answers': instance.answers,
    };

_AnswerRecord _$AnswerRecordFromJson(Map<String, dynamic> json) =>
    _AnswerRecord(
      questionId: json['questionId'] as String,
      selectedIndex: (json['selectedIndex'] as num).toInt(),
      isCorrect: json['isCorrect'] as bool,
      timeTaken: (json['timeTaken'] as num).toInt(),
      usedHint: json['usedHint'] as bool? ?? false,
    );

Map<String, dynamic> _$AnswerRecordToJson(_AnswerRecord instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'selectedIndex': instance.selectedIndex,
      'isCorrect': instance.isCorrect,
      'timeTaken': instance.timeTaken,
      'usedHint': instance.usedHint,
    };
