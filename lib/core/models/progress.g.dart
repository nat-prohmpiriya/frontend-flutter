// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Progress _$ProgressFromJson(Map<String, dynamic> json) => _Progress(
  odId: json['odId'] as String,
  stories:
      (json['stories'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, StoryProgress.fromJson(e as Map<String, dynamic>)),
      ) ??
      const {},
  savedWords:
      (json['savedWords'] as List<dynamic>?)
          ?.map((e) => SavedWord.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  achievements:
      (json['achievements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  statistics: json['statistics'] == null
      ? null
      : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProgressToJson(_Progress instance) => <String, dynamic>{
  'odId': instance.odId,
  'stories': instance.stories,
  'savedWords': instance.savedWords,
  'achievements': instance.achievements,
  'statistics': instance.statistics,
};

_StoryProgress _$StoryProgressFromJson(Map<String, dynamic> json) =>
    _StoryProgress(
      status: json['status'] as String,
      currentEpisode: (json['currentEpisode'] as num?)?.toInt() ?? 1,
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
      roundsCompleted: (json['roundsCompleted'] as num?)?.toInt() ?? 0,
      lastAccessedAt: json['lastAccessedAt'] == null
          ? null
          : DateTime.parse(json['lastAccessedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      episodeGames:
          (json['episodeGames'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
              int.parse(k),
              EpisodeGameResult.fromJson(e as Map<String, dynamic>),
            ),
          ) ??
          const {},
    );

Map<String, dynamic> _$StoryProgressToJson(_StoryProgress instance) =>
    <String, dynamic>{
      'status': instance.status,
      'currentEpisode': instance.currentEpisode,
      'currentPage': instance.currentPage,
      'roundsCompleted': instance.roundsCompleted,
      'lastAccessedAt': instance.lastAccessedAt?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'episodeGames': instance.episodeGames.map(
        (k, e) => MapEntry(k.toString(), e),
      ),
    };

_EpisodeGameResult _$EpisodeGameResultFromJson(Map<String, dynamic> json) =>
    _EpisodeGameResult(
      completed: json['completed'] as bool? ?? false,
      score: (json['score'] as num?)?.toInt() ?? 0,
      tier: json['tier'] as String? ?? 'fail',
      coinsEarned: (json['coinsEarned'] as num?)?.toInt() ?? 0,
      timeTaken: (json['timeTaken'] as num?)?.toInt() ?? 0,
      attempts: (json['attempts'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$EpisodeGameResultToJson(_EpisodeGameResult instance) =>
    <String, dynamic>{
      'completed': instance.completed,
      'score': instance.score,
      'tier': instance.tier,
      'coinsEarned': instance.coinsEarned,
      'timeTaken': instance.timeTaken,
      'attempts': instance.attempts,
    };

_SavedWord _$SavedWordFromJson(Map<String, dynamic> json) => _SavedWord(
  odId: json['odId'] as String,
  savedAt: DateTime.parse(json['savedAt'] as String),
  status: json['status'] as String? ?? 'learning',
  albumId: json['albumId'] as String?,
);

Map<String, dynamic> _$SavedWordToJson(_SavedWord instance) =>
    <String, dynamic>{
      'odId': instance.odId,
      'savedAt': instance.savedAt.toIso8601String(),
      'status': instance.status,
      'albumId': instance.albumId,
    };

_Statistics _$StatisticsFromJson(Map<String, dynamic> json) => _Statistics(
  totalReadingTime: (json['totalReadingTime'] as num?)?.toInt() ?? 0,
  storiesCompleted: (json['storiesCompleted'] as num?)?.toInt() ?? 0,
  wordsLearned: (json['wordsLearned'] as num?)?.toInt() ?? 0,
  quizzesTaken: (json['quizzesTaken'] as num?)?.toInt() ?? 0,
  streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
  totalCoins: (json['totalCoins'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$StatisticsToJson(_Statistics instance) =>
    <String, dynamic>{
      'totalReadingTime': instance.totalReadingTime,
      'storiesCompleted': instance.storiesCompleted,
      'wordsLearned': instance.wordsLearned,
      'quizzesTaken': instance.quizzesTaken,
      'streakDays': instance.streakDays,
      'totalCoins': instance.totalCoins,
    };
