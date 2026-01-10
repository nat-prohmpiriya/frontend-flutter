import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
abstract class Story with _$Story {
  const factory Story({
    required String id,
    required String slug,
    required LocalizedText title,
    required String language,
    required String level, // A1, A2, B1, B2
    required String category,
    @Default([]) List<String> tags,
    required int estimatedTime,
    required int totalWords,
    required int targetVocabulary,
    required String coverImageUrl,
    @Default([]) List<Episode> episodes,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

@freezed
abstract class LocalizedText with _$LocalizedText {
  const factory LocalizedText({
    required String en,
    required String th,
  }) = _LocalizedText;

  factory LocalizedText.fromJson(Map<String, dynamic> json) =>
      _$LocalizedTextFromJson(json);
}

@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    required int episodeNumber,
    required LocalizedText title,
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
    required int startIndex,
    required int endIndex,
    String? level,
  }) = _VocabularyHighlight;

  factory VocabularyHighlight.fromJson(Map<String, dynamic> json) =>
      _$VocabularyHighlightFromJson(json);
}

@freezed
abstract class WordTimestamp with _$WordTimestamp {
  const factory WordTimestamp({
    required String word,
    required double startTime,
    required double endTime,
  }) = _WordTimestamp;

  factory WordTimestamp.fromJson(Map<String, dynamic> json) =>
      _$WordTimestampFromJson(json);
}

@freezed
abstract class VocabularyDetail with _$VocabularyDetail {
  const factory VocabularyDetail({
    required String word,
    required String definition,
    required String partOfSpeech,
    String? pronunciation,
    String? audioUrl,
    Map<String, String>? translations,
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
    required String questionText,
    String? audioUrl,
    @Default([]) List<String> options,
    required int correctIndex,
    String? explanation,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
