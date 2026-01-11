import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
abstract class Story with _$Story {
  const factory Story({
    required String id,
    required String slug,
    required Map<String, String> title, // Changed from LocalizedText to Map
    @Default('en') String language,
    @Default('A1') String level, // A1, A2, B1, B2
    @Default('') String category,
    @Default([]) List<String> tags,
    @Default(0) int estimatedTime,
    @Default(0) int totalWords,
    @Default(0) int targetVocabulary,
    @Default('') String coverImageUrl,
    @Default([]) List<Episode> episodes,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    required int episodeNumber,
    required Map<String, String> title, // Changed from LocalizedText to Map
    @Default([]) List<Page> pages,
    @Default([]) List<VocabularyDetail> vocabularyDetails,
    MiniGame? miniGame,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}

@freezed
abstract class Page with _$Page {
  const factory Page({
    required int pageNumber,
    required String text,
    required Map<String, String> translations,
    @Default([]) List<VocabularyHighlight> vocabulary,
    required String audioUrl,
    String? imageUrl,
    @Default([]) List<WordTimestamp> wordTimestamps,
  }) = _Page;

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}

@freezed
abstract class VocabularyHighlight with _$VocabularyHighlight {
  const factory VocabularyHighlight({
    required String word,
    @Default(false) bool highlight,
  }) = _VocabularyHighlight;

  factory VocabularyHighlight.fromJson(Map<String, dynamic> json) =>
      _$VocabularyHighlightFromJson(json);
}

@freezed
abstract class WordTimestamp with _$WordTimestamp {
  const factory WordTimestamp({
    required String word,
    required double start,
    required double end,
  }) = _WordTimestamp;

  factory WordTimestamp.fromJson(Map<String, dynamic> json) =>
      _$WordTimestampFromJson(json);
}

@freezed
abstract class VocabularyDetail with _$VocabularyDetail {
  const factory VocabularyDetail({
    required String word,
    String? definition, // Optional - Next.js API doesn't provide this
    @Default('') String pos, // Changed from partOfSpeech to match Next.js API
    @Default('') String phonetic,
    String? audioUrl,
    Map<String, String>? translations,
    Map<String, String>? pronunciations,
    @Default('') String example,
    Map<String, String>? exampleTranslations,
  }) = _VocabularyDetail;

  factory VocabularyDetail.fromJson(Map<String, dynamic> json) =>
      _$VocabularyDetailFromJson(json);
}

@freezed
abstract class MiniGame with _$MiniGame {
  const factory MiniGame({
    required String type, // multipleChoice, listening, spelling, contextFill, wordMatch
    @Default([]) List<Question> questions,
  }) = _MiniGame;

  factory MiniGame.fromJson(Map<String, dynamic> json) =>
      _$MiniGameFromJson(json);
}

@freezed
abstract class Question with _$Question {
  const factory Question({
    required String id,
    required String question,
    String? audioUrl,
    @Default([]) List<String> options,
    required String correctAnswer,
    String? explanation,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
