// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Story _$StoryFromJson(Map<String, dynamic> json) => _Story(
  id: json['id'] as String,
  slug: json['slug'] as String,
  title: Map<String, String>.from(json['title'] as Map),
  language: json['language'] as String? ?? 'en',
  level: json['level'] as String? ?? 'A1',
  category: json['category'] as String? ?? '',
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  estimatedTime: (json['estimatedTime'] as num?)?.toInt() ?? 0,
  totalWords: (json['totalWords'] as num?)?.toInt() ?? 0,
  targetVocabulary: (json['targetVocabulary'] as num?)?.toInt() ?? 0,
  coverImageUrl: json['coverImageUrl'] as String? ?? '',
  episodes:
      (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$StoryToJson(_Story instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'title': instance.title,
  'language': instance.language,
  'level': instance.level,
  'category': instance.category,
  'tags': instance.tags,
  'estimatedTime': instance.estimatedTime,
  'totalWords': instance.totalWords,
  'targetVocabulary': instance.targetVocabulary,
  'coverImageUrl': instance.coverImageUrl,
  'episodes': instance.episodes,
};

_Episode _$EpisodeFromJson(Map<String, dynamic> json) => _Episode(
  episodeNumber: (json['episodeNumber'] as num).toInt(),
  title: Map<String, String>.from(json['title'] as Map),
  pages:
      (json['pages'] as List<dynamic>?)
          ?.map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  vocabularyDetails:
      (json['vocabularyDetails'] as List<dynamic>?)
          ?.map((e) => VocabularyDetail.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  miniGame: json['miniGame'] == null
      ? null
      : MiniGame.fromJson(json['miniGame'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EpisodeToJson(_Episode instance) => <String, dynamic>{
  'episodeNumber': instance.episodeNumber,
  'title': instance.title,
  'pages': instance.pages,
  'vocabularyDetails': instance.vocabularyDetails,
  'miniGame': instance.miniGame,
};

_Page _$PageFromJson(Map<String, dynamic> json) => _Page(
  pageNumber: (json['pageNumber'] as num).toInt(),
  text: json['text'] as String,
  translations: Map<String, String>.from(json['translations'] as Map),
  vocabulary:
      (json['vocabulary'] as List<dynamic>?)
          ?.map((e) => VocabularyHighlight.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  audioUrl: json['audioUrl'] as String,
  imageUrl: json['imageUrl'] as String?,
  wordTimestamps:
      (json['wordTimestamps'] as List<dynamic>?)
          ?.map((e) => WordTimestamp.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$PageToJson(_Page instance) => <String, dynamic>{
  'pageNumber': instance.pageNumber,
  'text': instance.text,
  'translations': instance.translations,
  'vocabulary': instance.vocabulary,
  'audioUrl': instance.audioUrl,
  'imageUrl': instance.imageUrl,
  'wordTimestamps': instance.wordTimestamps,
};

_VocabularyHighlight _$VocabularyHighlightFromJson(Map<String, dynamic> json) =>
    _VocabularyHighlight(
      word: json['word'] as String,
      highlight: json['highlight'] as bool? ?? false,
    );

Map<String, dynamic> _$VocabularyHighlightToJson(
  _VocabularyHighlight instance,
) => <String, dynamic>{'word': instance.word, 'highlight': instance.highlight};

_WordTimestamp _$WordTimestampFromJson(Map<String, dynamic> json) =>
    _WordTimestamp(
      word: json['word'] as String,
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
    );

Map<String, dynamic> _$WordTimestampToJson(_WordTimestamp instance) =>
    <String, dynamic>{
      'word': instance.word,
      'start': instance.start,
      'end': instance.end,
    };

_VocabularyDetail _$VocabularyDetailFromJson(Map<String, dynamic> json) =>
    _VocabularyDetail(
      word: json['word'] as String,
      definition: json['definition'] as String?,
      pos: json['pos'] as String? ?? '',
      phonetic: json['phonetic'] as String? ?? '',
      audioUrl: json['audioUrl'] as String?,
      translations: (json['translations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      pronunciations: (json['pronunciations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      example: json['example'] as String? ?? '',
      exampleTranslations:
          (json['exampleTranslations'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ),
    );

Map<String, dynamic> _$VocabularyDetailToJson(_VocabularyDetail instance) =>
    <String, dynamic>{
      'word': instance.word,
      'definition': instance.definition,
      'pos': instance.pos,
      'phonetic': instance.phonetic,
      'audioUrl': instance.audioUrl,
      'translations': instance.translations,
      'pronunciations': instance.pronunciations,
      'example': instance.example,
      'exampleTranslations': instance.exampleTranslations,
    };

_MiniGame _$MiniGameFromJson(Map<String, dynamic> json) => _MiniGame(
  type: json['type'] as String,
  questions:
      (json['questions'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MiniGameToJson(_MiniGame instance) => <String, dynamic>{
  'type': instance.type,
  'questions': instance.questions,
};

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  id: json['id'] as String,
  question: json['question'] as String,
  audioUrl: json['audioUrl'] as String?,
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  correctAnswer: json['correctAnswer'] as String,
  explanation: json['explanation'] as String?,
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'audioUrl': instance.audioUrl,
  'options': instance.options,
  'correctAnswer': instance.correctAnswer,
  'explanation': instance.explanation,
};
