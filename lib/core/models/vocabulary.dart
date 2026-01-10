import 'package:freezed_annotation/freezed_annotation.dart';

part 'vocabulary.freezed.dart';
part 'vocabulary.g.dart';

@freezed
abstract class Vocabulary with _$Vocabulary {
  const factory Vocabulary({
    required String id,
    required String word,
    required String definition,
    required String partOfSpeech,
    String? pronunciation,
    String? audioUrl,
    @Default({}) Map<String, String> translations,
    @Default([]) List<VocabularyMeaning> meanings,
    @Default([]) List<String> synonyms,
    @Default([]) List<String> antonyms,
    String? level,
  }) = _Vocabulary;

  factory Vocabulary.fromJson(Map<String, dynamic> json) =>
      _$VocabularyFromJson(json);
}

@freezed
abstract class VocabularyMeaning with _$VocabularyMeaning {
  const factory VocabularyMeaning({
    required String definition,
    String? example,
    @Default([]) List<String> synonyms,
    @Default([]) List<String> antonyms,
  }) = _VocabularyMeaning;

  factory VocabularyMeaning.fromJson(Map<String, dynamic> json) =>
      _$VocabularyMeaningFromJson(json);
}

@freezed
abstract class VocabularyAlbum with _$VocabularyAlbum {
  const factory VocabularyAlbum({
    required String id,
    required String name,
    String? description,
    @Default([]) List<String> wordIds,
    required DateTime createdAt,
  }) = _VocabularyAlbum;

  factory VocabularyAlbum.fromJson(Map<String, dynamic> json) =>
      _$VocabularyAlbumFromJson(json);
}
