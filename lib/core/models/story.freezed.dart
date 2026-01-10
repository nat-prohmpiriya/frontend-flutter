// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Story {

 String get id; String get slug; LocalizedText get title; String get language; String get level;// A1, A2, B1, B2
 String get category; List<String> get tags; int get estimatedTime; int get totalWords; int get targetVocabulary; String get coverImageUrl; List<Episode> get episodes;
/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryCopyWith<Story> get copyWith => _$StoryCopyWithImpl<Story>(this as Story, _$identity);

  /// Serializes this Story to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Story&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.language, language) || other.language == language)&&(identical(other.level, level) || other.level == level)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.targetVocabulary, targetVocabulary) || other.targetVocabulary == targetVocabulary)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&const DeepCollectionEquality().equals(other.episodes, episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,language,level,category,const DeepCollectionEquality().hash(tags),estimatedTime,totalWords,targetVocabulary,coverImageUrl,const DeepCollectionEquality().hash(episodes));

@override
String toString() {
  return 'Story(id: $id, slug: $slug, title: $title, language: $language, level: $level, category: $category, tags: $tags, estimatedTime: $estimatedTime, totalWords: $totalWords, targetVocabulary: $targetVocabulary, coverImageUrl: $coverImageUrl, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class $StoryCopyWith<$Res>  {
  factory $StoryCopyWith(Story value, $Res Function(Story) _then) = _$StoryCopyWithImpl;
@useResult
$Res call({
 String id, String slug, LocalizedText title, String language, String level, String category, List<String> tags, int estimatedTime, int totalWords, int targetVocabulary, String coverImageUrl, List<Episode> episodes
});


$LocalizedTextCopyWith<$Res> get title;

}
/// @nodoc
class _$StoryCopyWithImpl<$Res>
    implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._self, this._then);

  final Story _self;
  final $Res Function(Story) _then;

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? title = null,Object? language = null,Object? level = null,Object? category = null,Object? tags = null,Object? estimatedTime = null,Object? totalWords = null,Object? targetVocabulary = null,Object? coverImageUrl = null,Object? episodes = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,estimatedTime: null == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as int,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,targetVocabulary: null == targetVocabulary ? _self.targetVocabulary : targetVocabulary // ignore: cast_nullable_to_non_nullable
as int,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,episodes: null == episodes ? _self.episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<Episode>,
  ));
}
/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}


/// Adds pattern-matching-related methods to [Story].
extension StoryPatterns on Story {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Story value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Story() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Story value)  $default,){
final _that = this;
switch (_that) {
case _Story():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Story value)?  $default,){
final _that = this;
switch (_that) {
case _Story() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  LocalizedText title,  String language,  String level,  String category,  List<String> tags,  int estimatedTime,  int totalWords,  int targetVocabulary,  String coverImageUrl,  List<Episode> episodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Story() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.language,_that.level,_that.category,_that.tags,_that.estimatedTime,_that.totalWords,_that.targetVocabulary,_that.coverImageUrl,_that.episodes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  LocalizedText title,  String language,  String level,  String category,  List<String> tags,  int estimatedTime,  int totalWords,  int targetVocabulary,  String coverImageUrl,  List<Episode> episodes)  $default,) {final _that = this;
switch (_that) {
case _Story():
return $default(_that.id,_that.slug,_that.title,_that.language,_that.level,_that.category,_that.tags,_that.estimatedTime,_that.totalWords,_that.targetVocabulary,_that.coverImageUrl,_that.episodes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  LocalizedText title,  String language,  String level,  String category,  List<String> tags,  int estimatedTime,  int totalWords,  int targetVocabulary,  String coverImageUrl,  List<Episode> episodes)?  $default,) {final _that = this;
switch (_that) {
case _Story() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.language,_that.level,_that.category,_that.tags,_that.estimatedTime,_that.totalWords,_that.targetVocabulary,_that.coverImageUrl,_that.episodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Story implements Story {
  const _Story({required this.id, required this.slug, required this.title, required this.language, required this.level, required this.category, final  List<String> tags = const [], required this.estimatedTime, required this.totalWords, required this.targetVocabulary, required this.coverImageUrl, final  List<Episode> episodes = const []}): _tags = tags,_episodes = episodes;
  factory _Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

@override final  String id;
@override final  String slug;
@override final  LocalizedText title;
@override final  String language;
@override final  String level;
// A1, A2, B1, B2
@override final  String category;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  int estimatedTime;
@override final  int totalWords;
@override final  int targetVocabulary;
@override final  String coverImageUrl;
 final  List<Episode> _episodes;
@override@JsonKey() List<Episode> get episodes {
  if (_episodes is EqualUnmodifiableListView) return _episodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_episodes);
}


/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryCopyWith<_Story> get copyWith => __$StoryCopyWithImpl<_Story>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Story&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.language, language) || other.language == language)&&(identical(other.level, level) || other.level == level)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.targetVocabulary, targetVocabulary) || other.targetVocabulary == targetVocabulary)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,language,level,category,const DeepCollectionEquality().hash(_tags),estimatedTime,totalWords,targetVocabulary,coverImageUrl,const DeepCollectionEquality().hash(_episodes));

@override
String toString() {
  return 'Story(id: $id, slug: $slug, title: $title, language: $language, level: $level, category: $category, tags: $tags, estimatedTime: $estimatedTime, totalWords: $totalWords, targetVocabulary: $targetVocabulary, coverImageUrl: $coverImageUrl, episodes: $episodes)';
}


}

/// @nodoc
abstract mixin class _$StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$StoryCopyWith(_Story value, $Res Function(_Story) _then) = __$StoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, LocalizedText title, String language, String level, String category, List<String> tags, int estimatedTime, int totalWords, int targetVocabulary, String coverImageUrl, List<Episode> episodes
});


@override $LocalizedTextCopyWith<$Res> get title;

}
/// @nodoc
class __$StoryCopyWithImpl<$Res>
    implements _$StoryCopyWith<$Res> {
  __$StoryCopyWithImpl(this._self, this._then);

  final _Story _self;
  final $Res Function(_Story) _then;

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? title = null,Object? language = null,Object? level = null,Object? category = null,Object? tags = null,Object? estimatedTime = null,Object? totalWords = null,Object? targetVocabulary = null,Object? coverImageUrl = null,Object? episodes = null,}) {
  return _then(_Story(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,estimatedTime: null == estimatedTime ? _self.estimatedTime : estimatedTime // ignore: cast_nullable_to_non_nullable
as int,totalWords: null == totalWords ? _self.totalWords : totalWords // ignore: cast_nullable_to_non_nullable
as int,targetVocabulary: null == targetVocabulary ? _self.targetVocabulary : targetVocabulary // ignore: cast_nullable_to_non_nullable
as int,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,episodes: null == episodes ? _self._episodes : episodes // ignore: cast_nullable_to_non_nullable
as List<Episode>,
  ));
}

/// Create a copy of Story
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}


/// @nodoc
mixin _$LocalizedText {

 String get en; String get th;
/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<LocalizedText> get copyWith => _$LocalizedTextCopyWithImpl<LocalizedText>(this as LocalizedText, _$identity);

  /// Serializes this LocalizedText to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedText&&(identical(other.en, en) || other.en == en)&&(identical(other.th, th) || other.th == th));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,th);

@override
String toString() {
  return 'LocalizedText(en: $en, th: $th)';
}


}

/// @nodoc
abstract mixin class $LocalizedTextCopyWith<$Res>  {
  factory $LocalizedTextCopyWith(LocalizedText value, $Res Function(LocalizedText) _then) = _$LocalizedTextCopyWithImpl;
@useResult
$Res call({
 String en, String th
});




}
/// @nodoc
class _$LocalizedTextCopyWithImpl<$Res>
    implements $LocalizedTextCopyWith<$Res> {
  _$LocalizedTextCopyWithImpl(this._self, this._then);

  final LocalizedText _self;
  final $Res Function(LocalizedText) _then;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = null,Object? th = null,}) {
  return _then(_self.copyWith(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,th: null == th ? _self.th : th // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizedText].
extension LocalizedTextPatterns on LocalizedText {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizedText value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizedText value)  $default,){
final _that = this;
switch (_that) {
case _LocalizedText():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizedText value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String en,  String th)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
return $default(_that.en,_that.th);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String en,  String th)  $default,) {final _that = this;
switch (_that) {
case _LocalizedText():
return $default(_that.en,_that.th);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String en,  String th)?  $default,) {final _that = this;
switch (_that) {
case _LocalizedText() when $default != null:
return $default(_that.en,_that.th);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalizedText implements LocalizedText {
  const _LocalizedText({required this.en, required this.th});
  factory _LocalizedText.fromJson(Map<String, dynamic> json) => _$LocalizedTextFromJson(json);

@override final  String en;
@override final  String th;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizedTextCopyWith<_LocalizedText> get copyWith => __$LocalizedTextCopyWithImpl<_LocalizedText>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizedTextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizedText&&(identical(other.en, en) || other.en == en)&&(identical(other.th, th) || other.th == th));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,en,th);

@override
String toString() {
  return 'LocalizedText(en: $en, th: $th)';
}


}

/// @nodoc
abstract mixin class _$LocalizedTextCopyWith<$Res> implements $LocalizedTextCopyWith<$Res> {
  factory _$LocalizedTextCopyWith(_LocalizedText value, $Res Function(_LocalizedText) _then) = __$LocalizedTextCopyWithImpl;
@override @useResult
$Res call({
 String en, String th
});




}
/// @nodoc
class __$LocalizedTextCopyWithImpl<$Res>
    implements _$LocalizedTextCopyWith<$Res> {
  __$LocalizedTextCopyWithImpl(this._self, this._then);

  final _LocalizedText _self;
  final $Res Function(_LocalizedText) _then;

/// Create a copy of LocalizedText
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = null,Object? th = null,}) {
  return _then(_LocalizedText(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,th: null == th ? _self.th : th // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Episode {

 int get episodeNumber; LocalizedText get title; List<Page> get pages; List<VocabularyDetail> get vocabularyDetails; MiniGame? get miniGame;
/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeCopyWith<Episode> get copyWith => _$EpisodeCopyWithImpl<Episode>(this as Episode, _$identity);

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Episode&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.pages, pages)&&const DeepCollectionEquality().equals(other.vocabularyDetails, vocabularyDetails)&&(identical(other.miniGame, miniGame) || other.miniGame == miniGame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episodeNumber,title,const DeepCollectionEquality().hash(pages),const DeepCollectionEquality().hash(vocabularyDetails),miniGame);

@override
String toString() {
  return 'Episode(episodeNumber: $episodeNumber, title: $title, pages: $pages, vocabularyDetails: $vocabularyDetails, miniGame: $miniGame)';
}


}

/// @nodoc
abstract mixin class $EpisodeCopyWith<$Res>  {
  factory $EpisodeCopyWith(Episode value, $Res Function(Episode) _then) = _$EpisodeCopyWithImpl;
@useResult
$Res call({
 int episodeNumber, LocalizedText title, List<Page> pages, List<VocabularyDetail> vocabularyDetails, MiniGame? miniGame
});


$LocalizedTextCopyWith<$Res> get title;$MiniGameCopyWith<$Res>? get miniGame;

}
/// @nodoc
class _$EpisodeCopyWithImpl<$Res>
    implements $EpisodeCopyWith<$Res> {
  _$EpisodeCopyWithImpl(this._self, this._then);

  final Episode _self;
  final $Res Function(Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? episodeNumber = null,Object? title = null,Object? pages = null,Object? vocabularyDetails = null,Object? miniGame = freezed,}) {
  return _then(_self.copyWith(
episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,vocabularyDetails: null == vocabularyDetails ? _self.vocabularyDetails : vocabularyDetails // ignore: cast_nullable_to_non_nullable
as List<VocabularyDetail>,miniGame: freezed == miniGame ? _self.miniGame : miniGame // ignore: cast_nullable_to_non_nullable
as MiniGame?,
  ));
}
/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MiniGameCopyWith<$Res>? get miniGame {
    if (_self.miniGame == null) {
    return null;
  }

  return $MiniGameCopyWith<$Res>(_self.miniGame!, (value) {
    return _then(_self.copyWith(miniGame: value));
  });
}
}


/// Adds pattern-matching-related methods to [Episode].
extension EpisodePatterns on Episode {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Episode value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Episode value)  $default,){
final _that = this;
switch (_that) {
case _Episode():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Episode value)?  $default,){
final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int episodeNumber,  LocalizedText title,  List<Page> pages,  List<VocabularyDetail> vocabularyDetails,  MiniGame? miniGame)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that.episodeNumber,_that.title,_that.pages,_that.vocabularyDetails,_that.miniGame);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int episodeNumber,  LocalizedText title,  List<Page> pages,  List<VocabularyDetail> vocabularyDetails,  MiniGame? miniGame)  $default,) {final _that = this;
switch (_that) {
case _Episode():
return $default(_that.episodeNumber,_that.title,_that.pages,_that.vocabularyDetails,_that.miniGame);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int episodeNumber,  LocalizedText title,  List<Page> pages,  List<VocabularyDetail> vocabularyDetails,  MiniGame? miniGame)?  $default,) {final _that = this;
switch (_that) {
case _Episode() when $default != null:
return $default(_that.episodeNumber,_that.title,_that.pages,_that.vocabularyDetails,_that.miniGame);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Episode implements Episode {
  const _Episode({required this.episodeNumber, required this.title, final  List<Page> pages = const [], final  List<VocabularyDetail> vocabularyDetails = const [], this.miniGame}): _pages = pages,_vocabularyDetails = vocabularyDetails;
  factory _Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

@override final  int episodeNumber;
@override final  LocalizedText title;
 final  List<Page> _pages;
@override@JsonKey() List<Page> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

 final  List<VocabularyDetail> _vocabularyDetails;
@override@JsonKey() List<VocabularyDetail> get vocabularyDetails {
  if (_vocabularyDetails is EqualUnmodifiableListView) return _vocabularyDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vocabularyDetails);
}

@override final  MiniGame? miniGame;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeCopyWith<_Episode> get copyWith => __$EpisodeCopyWithImpl<_Episode>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Episode&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._pages, _pages)&&const DeepCollectionEquality().equals(other._vocabularyDetails, _vocabularyDetails)&&(identical(other.miniGame, miniGame) || other.miniGame == miniGame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episodeNumber,title,const DeepCollectionEquality().hash(_pages),const DeepCollectionEquality().hash(_vocabularyDetails),miniGame);

@override
String toString() {
  return 'Episode(episodeNumber: $episodeNumber, title: $title, pages: $pages, vocabularyDetails: $vocabularyDetails, miniGame: $miniGame)';
}


}

/// @nodoc
abstract mixin class _$EpisodeCopyWith<$Res> implements $EpisodeCopyWith<$Res> {
  factory _$EpisodeCopyWith(_Episode value, $Res Function(_Episode) _then) = __$EpisodeCopyWithImpl;
@override @useResult
$Res call({
 int episodeNumber, LocalizedText title, List<Page> pages, List<VocabularyDetail> vocabularyDetails, MiniGame? miniGame
});


@override $LocalizedTextCopyWith<$Res> get title;@override $MiniGameCopyWith<$Res>? get miniGame;

}
/// @nodoc
class __$EpisodeCopyWithImpl<$Res>
    implements _$EpisodeCopyWith<$Res> {
  __$EpisodeCopyWithImpl(this._self, this._then);

  final _Episode _self;
  final $Res Function(_Episode) _then;

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? episodeNumber = null,Object? title = null,Object? pages = null,Object? vocabularyDetails = null,Object? miniGame = freezed,}) {
  return _then(_Episode(
episodeNumber: null == episodeNumber ? _self.episodeNumber : episodeNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as LocalizedText,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,vocabularyDetails: null == vocabularyDetails ? _self._vocabularyDetails : vocabularyDetails // ignore: cast_nullable_to_non_nullable
as List<VocabularyDetail>,miniGame: freezed == miniGame ? _self.miniGame : miniGame // ignore: cast_nullable_to_non_nullable
as MiniGame?,
  ));
}

/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get title {
  
  return $LocalizedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MiniGameCopyWith<$Res>? get miniGame {
    if (_self.miniGame == null) {
    return null;
  }

  return $MiniGameCopyWith<$Res>(_self.miniGame!, (value) {
    return _then(_self.copyWith(miniGame: value));
  });
}
}


/// @nodoc
mixin _$Page {

 int get pageNumber; String get text; Map<String, String> get translations; List<VocabularyHighlight> get vocabulary; String get audioUrl; String? get imageUrl; List<WordTimestamp> get wordTimestamps;
/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageCopyWith<Page> get copyWith => _$PageCopyWithImpl<Page>(this as Page, _$identity);

  /// Serializes this Page to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Page&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other.translations, translations)&&const DeepCollectionEquality().equals(other.vocabulary, vocabulary)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.wordTimestamps, wordTimestamps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageNumber,text,const DeepCollectionEquality().hash(translations),const DeepCollectionEquality().hash(vocabulary),audioUrl,imageUrl,const DeepCollectionEquality().hash(wordTimestamps));

@override
String toString() {
  return 'Page(pageNumber: $pageNumber, text: $text, translations: $translations, vocabulary: $vocabulary, audioUrl: $audioUrl, imageUrl: $imageUrl, wordTimestamps: $wordTimestamps)';
}


}

/// @nodoc
abstract mixin class $PageCopyWith<$Res>  {
  factory $PageCopyWith(Page value, $Res Function(Page) _then) = _$PageCopyWithImpl;
@useResult
$Res call({
 int pageNumber, String text, Map<String, String> translations, List<VocabularyHighlight> vocabulary, String audioUrl, String? imageUrl, List<WordTimestamp> wordTimestamps
});




}
/// @nodoc
class _$PageCopyWithImpl<$Res>
    implements $PageCopyWith<$Res> {
  _$PageCopyWithImpl(this._self, this._then);

  final Page _self;
  final $Res Function(Page) _then;

/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageNumber = null,Object? text = null,Object? translations = null,Object? vocabulary = null,Object? audioUrl = null,Object? imageUrl = freezed,Object? wordTimestamps = null,}) {
  return _then(_self.copyWith(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>,vocabulary: null == vocabulary ? _self.vocabulary : vocabulary // ignore: cast_nullable_to_non_nullable
as List<VocabularyHighlight>,audioUrl: null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,wordTimestamps: null == wordTimestamps ? _self.wordTimestamps : wordTimestamps // ignore: cast_nullable_to_non_nullable
as List<WordTimestamp>,
  ));
}

}


/// Adds pattern-matching-related methods to [Page].
extension PagePatterns on Page {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Page value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Page value)  $default,){
final _that = this;
switch (_that) {
case _Page():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Page value)?  $default,){
final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pageNumber,  String text,  Map<String, String> translations,  List<VocabularyHighlight> vocabulary,  String audioUrl,  String? imageUrl,  List<WordTimestamp> wordTimestamps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that.pageNumber,_that.text,_that.translations,_that.vocabulary,_that.audioUrl,_that.imageUrl,_that.wordTimestamps);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pageNumber,  String text,  Map<String, String> translations,  List<VocabularyHighlight> vocabulary,  String audioUrl,  String? imageUrl,  List<WordTimestamp> wordTimestamps)  $default,) {final _that = this;
switch (_that) {
case _Page():
return $default(_that.pageNumber,_that.text,_that.translations,_that.vocabulary,_that.audioUrl,_that.imageUrl,_that.wordTimestamps);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pageNumber,  String text,  Map<String, String> translations,  List<VocabularyHighlight> vocabulary,  String audioUrl,  String? imageUrl,  List<WordTimestamp> wordTimestamps)?  $default,) {final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that.pageNumber,_that.text,_that.translations,_that.vocabulary,_that.audioUrl,_that.imageUrl,_that.wordTimestamps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Page implements Page {
  const _Page({required this.pageNumber, required this.text, required final  Map<String, String> translations, final  List<VocabularyHighlight> vocabulary = const [], required this.audioUrl, this.imageUrl, final  List<WordTimestamp> wordTimestamps = const []}): _translations = translations,_vocabulary = vocabulary,_wordTimestamps = wordTimestamps;
  factory _Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

@override final  int pageNumber;
@override final  String text;
 final  Map<String, String> _translations;
@override Map<String, String> get translations {
  if (_translations is EqualUnmodifiableMapView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translations);
}

 final  List<VocabularyHighlight> _vocabulary;
@override@JsonKey() List<VocabularyHighlight> get vocabulary {
  if (_vocabulary is EqualUnmodifiableListView) return _vocabulary;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vocabulary);
}

@override final  String audioUrl;
@override final  String? imageUrl;
 final  List<WordTimestamp> _wordTimestamps;
@override@JsonKey() List<WordTimestamp> get wordTimestamps {
  if (_wordTimestamps is EqualUnmodifiableListView) return _wordTimestamps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wordTimestamps);
}


/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageCopyWith<_Page> get copyWith => __$PageCopyWithImpl<_Page>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Page&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.text, text) || other.text == text)&&const DeepCollectionEquality().equals(other._translations, _translations)&&const DeepCollectionEquality().equals(other._vocabulary, _vocabulary)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._wordTimestamps, _wordTimestamps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageNumber,text,const DeepCollectionEquality().hash(_translations),const DeepCollectionEquality().hash(_vocabulary),audioUrl,imageUrl,const DeepCollectionEquality().hash(_wordTimestamps));

@override
String toString() {
  return 'Page(pageNumber: $pageNumber, text: $text, translations: $translations, vocabulary: $vocabulary, audioUrl: $audioUrl, imageUrl: $imageUrl, wordTimestamps: $wordTimestamps)';
}


}

/// @nodoc
abstract mixin class _$PageCopyWith<$Res> implements $PageCopyWith<$Res> {
  factory _$PageCopyWith(_Page value, $Res Function(_Page) _then) = __$PageCopyWithImpl;
@override @useResult
$Res call({
 int pageNumber, String text, Map<String, String> translations, List<VocabularyHighlight> vocabulary, String audioUrl, String? imageUrl, List<WordTimestamp> wordTimestamps
});




}
/// @nodoc
class __$PageCopyWithImpl<$Res>
    implements _$PageCopyWith<$Res> {
  __$PageCopyWithImpl(this._self, this._then);

  final _Page _self;
  final $Res Function(_Page) _then;

/// Create a copy of Page
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageNumber = null,Object? text = null,Object? translations = null,Object? vocabulary = null,Object? audioUrl = null,Object? imageUrl = freezed,Object? wordTimestamps = null,}) {
  return _then(_Page(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,translations: null == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>,vocabulary: null == vocabulary ? _self._vocabulary : vocabulary // ignore: cast_nullable_to_non_nullable
as List<VocabularyHighlight>,audioUrl: null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,wordTimestamps: null == wordTimestamps ? _self._wordTimestamps : wordTimestamps // ignore: cast_nullable_to_non_nullable
as List<WordTimestamp>,
  ));
}


}


/// @nodoc
mixin _$VocabularyHighlight {

 String get word; int get startIndex; int get endIndex; String? get level;
/// Create a copy of VocabularyHighlight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyHighlightCopyWith<VocabularyHighlight> get copyWith => _$VocabularyHighlightCopyWithImpl<VocabularyHighlight>(this as VocabularyHighlight, _$identity);

  /// Serializes this VocabularyHighlight to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyHighlight&&(identical(other.word, word) || other.word == word)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.endIndex, endIndex) || other.endIndex == endIndex)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,startIndex,endIndex,level);

@override
String toString() {
  return 'VocabularyHighlight(word: $word, startIndex: $startIndex, endIndex: $endIndex, level: $level)';
}


}

/// @nodoc
abstract mixin class $VocabularyHighlightCopyWith<$Res>  {
  factory $VocabularyHighlightCopyWith(VocabularyHighlight value, $Res Function(VocabularyHighlight) _then) = _$VocabularyHighlightCopyWithImpl;
@useResult
$Res call({
 String word, int startIndex, int endIndex, String? level
});




}
/// @nodoc
class _$VocabularyHighlightCopyWithImpl<$Res>
    implements $VocabularyHighlightCopyWith<$Res> {
  _$VocabularyHighlightCopyWithImpl(this._self, this._then);

  final VocabularyHighlight _self;
  final $Res Function(VocabularyHighlight) _then;

/// Create a copy of VocabularyHighlight
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? startIndex = null,Object? endIndex = null,Object? level = freezed,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,endIndex: null == endIndex ? _self.endIndex : endIndex // ignore: cast_nullable_to_non_nullable
as int,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VocabularyHighlight].
extension VocabularyHighlightPatterns on VocabularyHighlight {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabularyHighlight value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabularyHighlight() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabularyHighlight value)  $default,){
final _that = this;
switch (_that) {
case _VocabularyHighlight():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabularyHighlight value)?  $default,){
final _that = this;
switch (_that) {
case _VocabularyHighlight() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  int startIndex,  int endIndex,  String? level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyHighlight() when $default != null:
return $default(_that.word,_that.startIndex,_that.endIndex,_that.level);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  int startIndex,  int endIndex,  String? level)  $default,) {final _that = this;
switch (_that) {
case _VocabularyHighlight():
return $default(_that.word,_that.startIndex,_that.endIndex,_that.level);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  int startIndex,  int endIndex,  String? level)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyHighlight() when $default != null:
return $default(_that.word,_that.startIndex,_that.endIndex,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyHighlight implements VocabularyHighlight {
  const _VocabularyHighlight({required this.word, required this.startIndex, required this.endIndex, this.level});
  factory _VocabularyHighlight.fromJson(Map<String, dynamic> json) => _$VocabularyHighlightFromJson(json);

@override final  String word;
@override final  int startIndex;
@override final  int endIndex;
@override final  String? level;

/// Create a copy of VocabularyHighlight
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyHighlightCopyWith<_VocabularyHighlight> get copyWith => __$VocabularyHighlightCopyWithImpl<_VocabularyHighlight>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyHighlightToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyHighlight&&(identical(other.word, word) || other.word == word)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.endIndex, endIndex) || other.endIndex == endIndex)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,startIndex,endIndex,level);

@override
String toString() {
  return 'VocabularyHighlight(word: $word, startIndex: $startIndex, endIndex: $endIndex, level: $level)';
}


}

/// @nodoc
abstract mixin class _$VocabularyHighlightCopyWith<$Res> implements $VocabularyHighlightCopyWith<$Res> {
  factory _$VocabularyHighlightCopyWith(_VocabularyHighlight value, $Res Function(_VocabularyHighlight) _then) = __$VocabularyHighlightCopyWithImpl;
@override @useResult
$Res call({
 String word, int startIndex, int endIndex, String? level
});




}
/// @nodoc
class __$VocabularyHighlightCopyWithImpl<$Res>
    implements _$VocabularyHighlightCopyWith<$Res> {
  __$VocabularyHighlightCopyWithImpl(this._self, this._then);

  final _VocabularyHighlight _self;
  final $Res Function(_VocabularyHighlight) _then;

/// Create a copy of VocabularyHighlight
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? startIndex = null,Object? endIndex = null,Object? level = freezed,}) {
  return _then(_VocabularyHighlight(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,startIndex: null == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as int,endIndex: null == endIndex ? _self.endIndex : endIndex // ignore: cast_nullable_to_non_nullable
as int,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$WordTimestamp {

 String get word; double get startTime; double get endTime;
/// Create a copy of WordTimestamp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordTimestampCopyWith<WordTimestamp> get copyWith => _$WordTimestampCopyWithImpl<WordTimestamp>(this as WordTimestamp, _$identity);

  /// Serializes this WordTimestamp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordTimestamp&&(identical(other.word, word) || other.word == word)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,startTime,endTime);

@override
String toString() {
  return 'WordTimestamp(word: $word, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $WordTimestampCopyWith<$Res>  {
  factory $WordTimestampCopyWith(WordTimestamp value, $Res Function(WordTimestamp) _then) = _$WordTimestampCopyWithImpl;
@useResult
$Res call({
 String word, double startTime, double endTime
});




}
/// @nodoc
class _$WordTimestampCopyWithImpl<$Res>
    implements $WordTimestampCopyWith<$Res> {
  _$WordTimestampCopyWithImpl(this._self, this._then);

  final WordTimestamp _self;
  final $Res Function(WordTimestamp) _then;

/// Create a copy of WordTimestamp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as double,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [WordTimestamp].
extension WordTimestampPatterns on WordTimestamp {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordTimestamp value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordTimestamp() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordTimestamp value)  $default,){
final _that = this;
switch (_that) {
case _WordTimestamp():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordTimestamp value)?  $default,){
final _that = this;
switch (_that) {
case _WordTimestamp() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  double startTime,  double endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordTimestamp() when $default != null:
return $default(_that.word,_that.startTime,_that.endTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  double startTime,  double endTime)  $default,) {final _that = this;
switch (_that) {
case _WordTimestamp():
return $default(_that.word,_that.startTime,_that.endTime);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  double startTime,  double endTime)?  $default,) {final _that = this;
switch (_that) {
case _WordTimestamp() when $default != null:
return $default(_that.word,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordTimestamp implements WordTimestamp {
  const _WordTimestamp({required this.word, required this.startTime, required this.endTime});
  factory _WordTimestamp.fromJson(Map<String, dynamic> json) => _$WordTimestampFromJson(json);

@override final  String word;
@override final  double startTime;
@override final  double endTime;

/// Create a copy of WordTimestamp
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordTimestampCopyWith<_WordTimestamp> get copyWith => __$WordTimestampCopyWithImpl<_WordTimestamp>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordTimestampToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordTimestamp&&(identical(other.word, word) || other.word == word)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,startTime,endTime);

@override
String toString() {
  return 'WordTimestamp(word: $word, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$WordTimestampCopyWith<$Res> implements $WordTimestampCopyWith<$Res> {
  factory _$WordTimestampCopyWith(_WordTimestamp value, $Res Function(_WordTimestamp) _then) = __$WordTimestampCopyWithImpl;
@override @useResult
$Res call({
 String word, double startTime, double endTime
});




}
/// @nodoc
class __$WordTimestampCopyWithImpl<$Res>
    implements _$WordTimestampCopyWith<$Res> {
  __$WordTimestampCopyWithImpl(this._self, this._then);

  final _WordTimestamp _self;
  final $Res Function(_WordTimestamp) _then;

/// Create a copy of WordTimestamp
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? startTime = null,Object? endTime = null,}) {
  return _then(_WordTimestamp(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as double,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$VocabularyDetail {

 String get word; String get definition; String get partOfSpeech; String? get pronunciation; String? get audioUrl; Map<String, String>? get translations;
/// Create a copy of VocabularyDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyDetailCopyWith<VocabularyDetail> get copyWith => _$VocabularyDetailCopyWithImpl<VocabularyDetail>(this as VocabularyDetail, _$identity);

  /// Serializes this VocabularyDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyDetail&&(identical(other.word, word) || other.word == word)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.pronunciation, pronunciation) || other.pronunciation == pronunciation)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other.translations, translations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,definition,partOfSpeech,pronunciation,audioUrl,const DeepCollectionEquality().hash(translations));

@override
String toString() {
  return 'VocabularyDetail(word: $word, definition: $definition, partOfSpeech: $partOfSpeech, pronunciation: $pronunciation, audioUrl: $audioUrl, translations: $translations)';
}


}

/// @nodoc
abstract mixin class $VocabularyDetailCopyWith<$Res>  {
  factory $VocabularyDetailCopyWith(VocabularyDetail value, $Res Function(VocabularyDetail) _then) = _$VocabularyDetailCopyWithImpl;
@useResult
$Res call({
 String word, String definition, String partOfSpeech, String? pronunciation, String? audioUrl, Map<String, String>? translations
});




}
/// @nodoc
class _$VocabularyDetailCopyWithImpl<$Res>
    implements $VocabularyDetailCopyWith<$Res> {
  _$VocabularyDetailCopyWithImpl(this._self, this._then);

  final VocabularyDetail _self;
  final $Res Function(VocabularyDetail) _then;

/// Create a copy of VocabularyDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? definition = null,Object? partOfSpeech = null,Object? pronunciation = freezed,Object? audioUrl = freezed,Object? translations = freezed,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,pronunciation: freezed == pronunciation ? _self.pronunciation : pronunciation // ignore: cast_nullable_to_non_nullable
as String?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,translations: freezed == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [VocabularyDetail].
extension VocabularyDetailPatterns on VocabularyDetail {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabularyDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabularyDetail() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabularyDetail value)  $default,){
final _that = this;
switch (_that) {
case _VocabularyDetail():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabularyDetail value)?  $default,){
final _that = this;
switch (_that) {
case _VocabularyDetail() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  String definition,  String partOfSpeech,  String? pronunciation,  String? audioUrl,  Map<String, String>? translations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyDetail() when $default != null:
return $default(_that.word,_that.definition,_that.partOfSpeech,_that.pronunciation,_that.audioUrl,_that.translations);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  String definition,  String partOfSpeech,  String? pronunciation,  String? audioUrl,  Map<String, String>? translations)  $default,) {final _that = this;
switch (_that) {
case _VocabularyDetail():
return $default(_that.word,_that.definition,_that.partOfSpeech,_that.pronunciation,_that.audioUrl,_that.translations);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  String definition,  String partOfSpeech,  String? pronunciation,  String? audioUrl,  Map<String, String>? translations)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyDetail() when $default != null:
return $default(_that.word,_that.definition,_that.partOfSpeech,_that.pronunciation,_that.audioUrl,_that.translations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyDetail implements VocabularyDetail {
  const _VocabularyDetail({required this.word, required this.definition, required this.partOfSpeech, this.pronunciation, this.audioUrl, final  Map<String, String>? translations}): _translations = translations;
  factory _VocabularyDetail.fromJson(Map<String, dynamic> json) => _$VocabularyDetailFromJson(json);

@override final  String word;
@override final  String definition;
@override final  String partOfSpeech;
@override final  String? pronunciation;
@override final  String? audioUrl;
 final  Map<String, String>? _translations;
@override Map<String, String>? get translations {
  final value = _translations;
  if (value == null) return null;
  if (_translations is EqualUnmodifiableMapView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of VocabularyDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyDetailCopyWith<_VocabularyDetail> get copyWith => __$VocabularyDetailCopyWithImpl<_VocabularyDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyDetail&&(identical(other.word, word) || other.word == word)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.pronunciation, pronunciation) || other.pronunciation == pronunciation)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other._translations, _translations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,definition,partOfSpeech,pronunciation,audioUrl,const DeepCollectionEquality().hash(_translations));

@override
String toString() {
  return 'VocabularyDetail(word: $word, definition: $definition, partOfSpeech: $partOfSpeech, pronunciation: $pronunciation, audioUrl: $audioUrl, translations: $translations)';
}


}

/// @nodoc
abstract mixin class _$VocabularyDetailCopyWith<$Res> implements $VocabularyDetailCopyWith<$Res> {
  factory _$VocabularyDetailCopyWith(_VocabularyDetail value, $Res Function(_VocabularyDetail) _then) = __$VocabularyDetailCopyWithImpl;
@override @useResult
$Res call({
 String word, String definition, String partOfSpeech, String? pronunciation, String? audioUrl, Map<String, String>? translations
});




}
/// @nodoc
class __$VocabularyDetailCopyWithImpl<$Res>
    implements _$VocabularyDetailCopyWith<$Res> {
  __$VocabularyDetailCopyWithImpl(this._self, this._then);

  final _VocabularyDetail _self;
  final $Res Function(_VocabularyDetail) _then;

/// Create a copy of VocabularyDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? definition = null,Object? partOfSpeech = null,Object? pronunciation = freezed,Object? audioUrl = freezed,Object? translations = freezed,}) {
  return _then(_VocabularyDetail(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,pronunciation: freezed == pronunciation ? _self.pronunciation : pronunciation // ignore: cast_nullable_to_non_nullable
as String?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,translations: freezed == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,
  ));
}


}


/// @nodoc
mixin _$MiniGame {

 String get type;// multipleChoice, listening, spelling, contextFill, wordMatch
 List<Question> get questions;
/// Create a copy of MiniGame
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MiniGameCopyWith<MiniGame> get copyWith => _$MiniGameCopyWithImpl<MiniGame>(this as MiniGame, _$identity);

  /// Serializes this MiniGame to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MiniGame&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'MiniGame(type: $type, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $MiniGameCopyWith<$Res>  {
  factory $MiniGameCopyWith(MiniGame value, $Res Function(MiniGame) _then) = _$MiniGameCopyWithImpl;
@useResult
$Res call({
 String type, List<Question> questions
});




}
/// @nodoc
class _$MiniGameCopyWithImpl<$Res>
    implements $MiniGameCopyWith<$Res> {
  _$MiniGameCopyWithImpl(this._self, this._then);

  final MiniGame _self;
  final $Res Function(MiniGame) _then;

/// Create a copy of MiniGame
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? questions = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,
  ));
}

}


/// Adds pattern-matching-related methods to [MiniGame].
extension MiniGamePatterns on MiniGame {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MiniGame value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MiniGame() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MiniGame value)  $default,){
final _that = this;
switch (_that) {
case _MiniGame():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MiniGame value)?  $default,){
final _that = this;
switch (_that) {
case _MiniGame() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  List<Question> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MiniGame() when $default != null:
return $default(_that.type,_that.questions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  List<Question> questions)  $default,) {final _that = this;
switch (_that) {
case _MiniGame():
return $default(_that.type,_that.questions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  List<Question> questions)?  $default,) {final _that = this;
switch (_that) {
case _MiniGame() when $default != null:
return $default(_that.type,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MiniGame implements MiniGame {
  const _MiniGame({required this.type, final  List<Question> questions = const []}): _questions = questions;
  factory _MiniGame.fromJson(Map<String, dynamic> json) => _$MiniGameFromJson(json);

@override final  String type;
// multipleChoice, listening, spelling, contextFill, wordMatch
 final  List<Question> _questions;
// multipleChoice, listening, spelling, contextFill, wordMatch
@override@JsonKey() List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of MiniGame
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MiniGameCopyWith<_MiniGame> get copyWith => __$MiniGameCopyWithImpl<_MiniGame>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MiniGameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MiniGame&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'MiniGame(type: $type, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$MiniGameCopyWith<$Res> implements $MiniGameCopyWith<$Res> {
  factory _$MiniGameCopyWith(_MiniGame value, $Res Function(_MiniGame) _then) = __$MiniGameCopyWithImpl;
@override @useResult
$Res call({
 String type, List<Question> questions
});




}
/// @nodoc
class __$MiniGameCopyWithImpl<$Res>
    implements _$MiniGameCopyWith<$Res> {
  __$MiniGameCopyWithImpl(this._self, this._then);

  final _MiniGame _self;
  final $Res Function(_MiniGame) _then;

/// Create a copy of MiniGame
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? questions = null,}) {
  return _then(_MiniGame(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,
  ));
}


}


/// @nodoc
mixin _$Question {

 String get id; String get questionText; String? get audioUrl; List<String> get options; int get correctIndex; String? get explanation;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCopyWith<Question> get copyWith => _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question&&(identical(other.id, id) || other.id == id)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,questionText,audioUrl,const DeepCollectionEquality().hash(options),correctIndex,explanation);

@override
String toString() {
  return 'Question(id: $id, questionText: $questionText, audioUrl: $audioUrl, options: $options, correctIndex: $correctIndex, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) = _$QuestionCopyWithImpl;
@useResult
$Res call({
 String id, String questionText, String? audioUrl, List<String> options, int correctIndex, String? explanation
});




}
/// @nodoc
class _$QuestionCopyWithImpl<$Res>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._self, this._then);

  final Question _self;
  final $Res Function(Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? questionText = null,Object? audioUrl = freezed,Object? options = null,Object? correctIndex = null,Object? explanation = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Question].
extension QuestionPatterns on Question {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Question value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Question value)  $default,){
final _that = this;
switch (_that) {
case _Question():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Question value)?  $default,){
final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String questionText,  String? audioUrl,  List<String> options,  int correctIndex,  String? explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.questionText,_that.audioUrl,_that.options,_that.correctIndex,_that.explanation);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String questionText,  String? audioUrl,  List<String> options,  int correctIndex,  String? explanation)  $default,) {final _that = this;
switch (_that) {
case _Question():
return $default(_that.id,_that.questionText,_that.audioUrl,_that.options,_that.correctIndex,_that.explanation);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String questionText,  String? audioUrl,  List<String> options,  int correctIndex,  String? explanation)?  $default,) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.questionText,_that.audioUrl,_that.options,_that.correctIndex,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Question implements Question {
  const _Question({required this.id, required this.questionText, this.audioUrl, final  List<String> options = const [], required this.correctIndex, this.explanation}): _options = options;
  factory _Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

@override final  String id;
@override final  String questionText;
@override final  String? audioUrl;
 final  List<String> _options;
@override@JsonKey() List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  int correctIndex;
@override final  String? explanation;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionCopyWith<_Question> get copyWith => __$QuestionCopyWithImpl<_Question>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Question&&(identical(other.id, id) || other.id == id)&&(identical(other.questionText, questionText) || other.questionText == questionText)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.correctIndex, correctIndex) || other.correctIndex == correctIndex)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,questionText,audioUrl,const DeepCollectionEquality().hash(_options),correctIndex,explanation);

@override
String toString() {
  return 'Question(id: $id, questionText: $questionText, audioUrl: $audioUrl, options: $options, correctIndex: $correctIndex, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) = __$QuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String questionText, String? audioUrl, List<String> options, int correctIndex, String? explanation
});




}
/// @nodoc
class __$QuestionCopyWithImpl<$Res>
    implements _$QuestionCopyWith<$Res> {
  __$QuestionCopyWithImpl(this._self, this._then);

  final _Question _self;
  final $Res Function(_Question) _then;

/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? questionText = null,Object? audioUrl = freezed,Object? options = null,Object? correctIndex = null,Object? explanation = freezed,}) {
  return _then(_Question(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctIndex: null == correctIndex ? _self.correctIndex : correctIndex // ignore: cast_nullable_to_non_nullable
as int,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
