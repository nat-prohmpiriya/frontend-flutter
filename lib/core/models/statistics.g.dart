// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyActivity _$DailyActivityFromJson(Map<String, dynamic> json) =>
    _DailyActivity(
      date: DateTime.parse(json['date'] as String),
      pagesRead: (json['pagesRead'] as num?)?.toInt() ?? 0,
      minutesSpent: (json['minutesSpent'] as num?)?.toInt() ?? 0,
      wordsLearned: (json['wordsLearned'] as num?)?.toInt() ?? 0,
      quizzesTaken: (json['quizzesTaken'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DailyActivityToJson(_DailyActivity instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'pagesRead': instance.pagesRead,
      'minutesSpent': instance.minutesSpent,
      'wordsLearned': instance.wordsLearned,
      'quizzesTaken': instance.quizzesTaken,
    };

_Achievement _$AchievementFromJson(Map<String, dynamic> json) => _Achievement(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  iconUrl: json['iconUrl'] as String,
  earnedAt: json['earnedAt'] == null
      ? null
      : DateTime.parse(json['earnedAt'] as String),
  isLocked: json['isLocked'] as bool? ?? false,
);

Map<String, dynamic> _$AchievementToJson(_Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
      'earnedAt': instance.earnedAt?.toIso8601String(),
      'isLocked': instance.isLocked,
    };

_ActivityItem _$ActivityItemFromJson(Map<String, dynamic> json) =>
    _ActivityItem(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      iconUrl: json['iconUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ActivityItemToJson(_ActivityItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
      'iconUrl': instance.iconUrl,
      'metadata': instance.metadata,
    };

_VocabularyStats _$VocabularyStatsFromJson(Map<String, dynamic> json) =>
    _VocabularyStats(
      learning: (json['learning'] as num?)?.toInt() ?? 0,
      learned: (json['learned'] as num?)?.toInt() ?? 0,
      difficult: (json['difficult'] as num?)?.toInt() ?? 0,
      a1Words: (json['a1Words'] as num?)?.toInt() ?? 0,
      a2Words: (json['a2Words'] as num?)?.toInt() ?? 0,
      b1Words: (json['b1Words'] as num?)?.toInt() ?? 0,
      b2Words: (json['b2Words'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VocabularyStatsToJson(_VocabularyStats instance) =>
    <String, dynamic>{
      'learning': instance.learning,
      'learned': instance.learned,
      'difficult': instance.difficult,
      'a1Words': instance.a1Words,
      'a2Words': instance.a2Words,
      'b1Words': instance.b1Words,
      'b2Words': instance.b2Words,
    };

_ExtendedStatistics _$ExtendedStatisticsFromJson(Map<String, dynamic> json) =>
    _ExtendedStatistics(
      totalReadingTime: (json['totalReadingTime'] as num?)?.toInt() ?? 0,
      storiesCompleted: (json['storiesCompleted'] as num?)?.toInt() ?? 0,
      wordsLearned: (json['wordsLearned'] as num?)?.toInt() ?? 0,
      quizzesTaken: (json['quizzesTaken'] as num?)?.toInt() ?? 0,
      streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
      totalCoins: (json['totalCoins'] as num?)?.toInt() ?? 0,
      voiceRecordings: (json['voiceRecordings'] as num?)?.toInt() ?? 0,
      averageScore: (json['averageScore'] as num?)?.toDouble() ?? 0.0,
      weeklyActivity:
          (json['weeklyActivity'] as List<dynamic>?)
              ?.map((e) => DailyActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vocabularyStats: json['vocabularyStats'] == null
          ? null
          : VocabularyStats.fromJson(
              json['vocabularyStats'] as Map<String, dynamic>,
            ),
      achievements:
          (json['achievements'] as List<dynamic>?)
              ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recentActivity:
          (json['recentActivity'] as List<dynamic>?)
              ?.map((e) => ActivityItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExtendedStatisticsToJson(_ExtendedStatistics instance) =>
    <String, dynamic>{
      'totalReadingTime': instance.totalReadingTime,
      'storiesCompleted': instance.storiesCompleted,
      'wordsLearned': instance.wordsLearned,
      'quizzesTaken': instance.quizzesTaken,
      'streakDays': instance.streakDays,
      'totalCoins': instance.totalCoins,
      'voiceRecordings': instance.voiceRecordings,
      'averageScore': instance.averageScore,
      'weeklyActivity': instance.weeklyActivity,
      'vocabularyStats': instance.vocabularyStats,
      'achievements': instance.achievements,
      'recentActivity': instance.recentActivity,
    };
