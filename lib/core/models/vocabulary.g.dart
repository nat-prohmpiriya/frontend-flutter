// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Vocabulary _$VocabularyFromJson(Map<String, dynamic> json) => _Vocabulary(
  id: json['id'] as String,
  word: json['word'] as String,
  definition: json['definition'] as String,
  partOfSpeech: json['partOfSpeech'] as String,
  pronunciation: json['pronunciation'] as String?,
  audioUrl: json['audioUrl'] as String?,
  translations:
      (json['translations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
  meanings:
      (json['meanings'] as List<dynamic>?)
          ?.map((e) => VocabularyMeaning.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  synonyms:
      (json['synonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  antonyms:
      (json['antonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  level: json['level'] as String?,
);

Map<String, dynamic> _$VocabularyToJson(_Vocabulary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'definition': instance.definition,
      'partOfSpeech': instance.partOfSpeech,
      'pronunciation': instance.pronunciation,
      'audioUrl': instance.audioUrl,
      'translations': instance.translations,
      'meanings': instance.meanings,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
      'level': instance.level,
    };

_VocabularyMeaning _$VocabularyMeaningFromJson(
  Map<String, dynamic> json,
) => _VocabularyMeaning(
  definition: json['definition'] as String,
  example: json['example'] as String?,
  synonyms:
      (json['synonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  antonyms:
      (json['antonyms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$VocabularyMeaningToJson(_VocabularyMeaning instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'example': instance.example,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };

_VocabularyAlbum _$VocabularyAlbumFromJson(Map<String, dynamic> json) =>
    _VocabularyAlbum(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      wordIds:
          (json['wordIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$VocabularyAlbumToJson(_VocabularyAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'wordIds': instance.wordIds,
      'createdAt': instance.createdAt.toIso8601String(),
    };
