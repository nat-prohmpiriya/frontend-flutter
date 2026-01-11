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

 String get id; String get slug; Map<String, String> get title;// Changed from LocalizedText to Map
 String get language; String get level;// A1, A2, B1, B2
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Story&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other.title, title)&&(identical(other.language, language) || other.language == language)&&(identical(other.level, level) || other.level == level)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.targetVocabulary, targetVocabulary) || other.targetVocabulary == targetVocabulary)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&const DeepCollectionEquality().equals(other.episodes, episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,const DeepCollectionEquality().hash(title),language,level,category,const DeepCollectionEquality().hash(tags),estimatedTime,totalWords,targetVocabulary,coverImageUrl,const DeepCollectionEquality().hash(episodes));

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
 String id, String slug, Map<String, String> title, String language, String level, String category, List<String> tags, int estimatedTime, int totalWords, int targetVocabulary, String coverImageUrl, List<Episode> episodes
});




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
as Map<String, String>,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  Map<String, String> title,  String language,  String level,  String category,  List<String> tags,  int estimatedTime,  int totalWords,  int targetVocabulary,  String coverImageUrl,  List<Episode> episodes)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  Map<String, String> title,  String language,  String level,  String category,  List<String> tags,  int estimatedTime,  int totalWords,  int targetVocabulary,  String coverImageUrl,  List<Episode> episodes)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  Map<String, String> title,  String language,  String level,  String category,  List<String> tags,  int estimatedTime,  int totalWords,  int targetVocabulary,  String coverImageUrl,  List<Episode> episodes)?  $default,) {final _that = this;
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
  const _Story({required this.id, required this.slug, required final  Map<String, String> title, this.language = 'en', this.level = 'A1', this.category = '', final  List<String> tags = const [], this.estimatedTime = 0, this.totalWords = 0, this.targetVocabulary = 0, this.coverImageUrl = '', final  List<Episode> episodes = const []}): _title = title,_tags = tags,_episodes = episodes;
  factory _Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

@override final  String id;
@override final  String slug;
 final  Map<String, String> _title;
@override Map<String, String> get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

// Changed from LocalizedText to Map
@override@JsonKey() final  String language;
@override@JsonKey() final  String level;
// A1, A2, B1, B2
@override@JsonKey() final  String category;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  int estimatedTime;
@override@JsonKey() final  int totalWords;
@override@JsonKey() final  int targetVocabulary;
@override@JsonKey() final  String coverImageUrl;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Story&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other._title, _title)&&(identical(other.language, language) || other.language == language)&&(identical(other.level, level) || other.level == level)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.estimatedTime, estimatedTime) || other.estimatedTime == estimatedTime)&&(identical(other.totalWords, totalWords) || other.totalWords == totalWords)&&(identical(other.targetVocabulary, targetVocabulary) || other.targetVocabulary == targetVocabulary)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&const DeepCollectionEquality().equals(other._episodes, _episodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,const DeepCollectionEquality().hash(_title),language,level,category,const DeepCollectionEquality().hash(_tags),estimatedTime,totalWords,targetVocabulary,coverImageUrl,const DeepCollectionEquality().hash(_episodes));

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
 String id, String slug, Map<String, String> title, String language, String level, String category, List<String> tags, int estimatedTime, int totalWords, int targetVocabulary, String coverImageUrl, List<Episode> episodes
});




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
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
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


}


/// @nodoc
mixin _$Episode {

 int get episodeNumber; Map<String, String> get title;// Changed from LocalizedText to Map
 List<Page> get pages; List<VocabularyDetail> get vocabularyDetails; MiniGame? get miniGame;
/// Create a copy of Episode
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeCopyWith<Episode> get copyWith => _$EpisodeCopyWithImpl<Episode>(this as Episode, _$identity);

  /// Serializes this Episode to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Episode&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&const DeepCollectionEquality().equals(other.title, title)&&const DeepCollectionEquality().equals(other.pages, pages)&&const DeepCollectionEquality().equals(other.vocabularyDetails, vocabularyDetails)&&(identical(other.miniGame, miniGame) || other.miniGame == miniGame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episodeNumber,const DeepCollectionEquality().hash(title),const DeepCollectionEquality().hash(pages),const DeepCollectionEquality().hash(vocabularyDetails),miniGame);

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
 int episodeNumber, Map<String, String> title, List<Page> pages, List<VocabularyDetail> vocabularyDetails, MiniGame? miniGame
});


$MiniGameCopyWith<$Res>? get miniGame;

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
as Map<String, String>,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,vocabularyDetails: null == vocabularyDetails ? _self.vocabularyDetails : vocabularyDetails // ignore: cast_nullable_to_non_nullable
as List<VocabularyDetail>,miniGame: freezed == miniGame ? _self.miniGame : miniGame // ignore: cast_nullable_to_non_nullable
as MiniGame?,
  ));
}
/// Create a copy of Episode
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int episodeNumber,  Map<String, String> title,  List<Page> pages,  List<VocabularyDetail> vocabularyDetails,  MiniGame? miniGame)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int episodeNumber,  Map<String, String> title,  List<Page> pages,  List<VocabularyDetail> vocabularyDetails,  MiniGame? miniGame)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int episodeNumber,  Map<String, String> title,  List<Page> pages,  List<VocabularyDetail> vocabularyDetails,  MiniGame? miniGame)?  $default,) {final _that = this;
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
  const _Episode({required this.episodeNumber, required final  Map<String, String> title, final  List<Page> pages = const [], final  List<VocabularyDetail> vocabularyDetails = const [], this.miniGame}): _title = title,_pages = pages,_vocabularyDetails = vocabularyDetails;
  factory _Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);

@override final  int episodeNumber;
 final  Map<String, String> _title;
@override Map<String, String> get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

// Changed from LocalizedText to Map
 final  List<Page> _pages;
// Changed from LocalizedText to Map
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Episode&&(identical(other.episodeNumber, episodeNumber) || other.episodeNumber == episodeNumber)&&const DeepCollectionEquality().equals(other._title, _title)&&const DeepCollectionEquality().equals(other._pages, _pages)&&const DeepCollectionEquality().equals(other._vocabularyDetails, _vocabularyDetails)&&(identical(other.miniGame, miniGame) || other.miniGame == miniGame));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,episodeNumber,const DeepCollectionEquality().hash(_title),const DeepCollectionEquality().hash(_pages),const DeepCollectionEquality().hash(_vocabularyDetails),miniGame);

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
 int episodeNumber, Map<String, String> title, List<Page> pages, List<VocabularyDetail> vocabularyDetails, MiniGame? miniGame
});


@override $MiniGameCopyWith<$Res>? get miniGame;

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
as int,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as Map<String, String>,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<Page>,vocabularyDetails: null == vocabularyDetails ? _self._vocabularyDetails : vocabularyDetails // ignore: cast_nullable_to_non_nullable
as List<VocabularyDetail>,miniGame: freezed == miniGame ? _self.miniGame : miniGame // ignore: cast_nullable_to_non_nullable
as MiniGame?,
  ));
}

/// Create a copy of Episode
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

 String get word; bool get highlight;
/// Create a copy of VocabularyHighlight
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyHighlightCopyWith<VocabularyHighlight> get copyWith => _$VocabularyHighlightCopyWithImpl<VocabularyHighlight>(this as VocabularyHighlight, _$identity);

  /// Serializes this VocabularyHighlight to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyHighlight&&(identical(other.word, word) || other.word == word)&&(identical(other.highlight, highlight) || other.highlight == highlight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,highlight);

@override
String toString() {
  return 'VocabularyHighlight(word: $word, highlight: $highlight)';
}


}

/// @nodoc
abstract mixin class $VocabularyHighlightCopyWith<$Res>  {
  factory $VocabularyHighlightCopyWith(VocabularyHighlight value, $Res Function(VocabularyHighlight) _then) = _$VocabularyHighlightCopyWithImpl;
@useResult
$Res call({
 String word, bool highlight
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
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? highlight = null,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,highlight: null == highlight ? _self.highlight : highlight // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  bool highlight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyHighlight() when $default != null:
return $default(_that.word,_that.highlight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  bool highlight)  $default,) {final _that = this;
switch (_that) {
case _VocabularyHighlight():
return $default(_that.word,_that.highlight);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  bool highlight)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyHighlight() when $default != null:
return $default(_that.word,_that.highlight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyHighlight implements VocabularyHighlight {
  const _VocabularyHighlight({required this.word, this.highlight = false});
  factory _VocabularyHighlight.fromJson(Map<String, dynamic> json) => _$VocabularyHighlightFromJson(json);

@override final  String word;
@override@JsonKey() final  bool highlight;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyHighlight&&(identical(other.word, word) || other.word == word)&&(identical(other.highlight, highlight) || other.highlight == highlight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,highlight);

@override
String toString() {
  return 'VocabularyHighlight(word: $word, highlight: $highlight)';
}


}

/// @nodoc
abstract mixin class _$VocabularyHighlightCopyWith<$Res> implements $VocabularyHighlightCopyWith<$Res> {
  factory _$VocabularyHighlightCopyWith(_VocabularyHighlight value, $Res Function(_VocabularyHighlight) _then) = __$VocabularyHighlightCopyWithImpl;
@override @useResult
$Res call({
 String word, bool highlight
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
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? highlight = null,}) {
  return _then(_VocabularyHighlight(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,highlight: null == highlight ? _self.highlight : highlight // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$WordTimestamp {

 String get word; double get start; double get end;
/// Create a copy of WordTimestamp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordTimestampCopyWith<WordTimestamp> get copyWith => _$WordTimestampCopyWithImpl<WordTimestamp>(this as WordTimestamp, _$identity);

  /// Serializes this WordTimestamp to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordTimestamp&&(identical(other.word, word) || other.word == word)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,start,end);

@override
String toString() {
  return 'WordTimestamp(word: $word, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $WordTimestampCopyWith<$Res>  {
  factory $WordTimestampCopyWith(WordTimestamp value, $Res Function(WordTimestamp) _then) = _$WordTimestampCopyWithImpl;
@useResult
$Res call({
 String word, double start, double end
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
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  double start,  double end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordTimestamp() when $default != null:
return $default(_that.word,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  double start,  double end)  $default,) {final _that = this;
switch (_that) {
case _WordTimestamp():
return $default(_that.word,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  double start,  double end)?  $default,) {final _that = this;
switch (_that) {
case _WordTimestamp() when $default != null:
return $default(_that.word,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordTimestamp implements WordTimestamp {
  const _WordTimestamp({required this.word, required this.start, required this.end});
  factory _WordTimestamp.fromJson(Map<String, dynamic> json) => _$WordTimestampFromJson(json);

@override final  String word;
@override final  double start;
@override final  double end;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordTimestamp&&(identical(other.word, word) || other.word == word)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,start,end);

@override
String toString() {
  return 'WordTimestamp(word: $word, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$WordTimestampCopyWith<$Res> implements $WordTimestampCopyWith<$Res> {
  factory _$WordTimestampCopyWith(_WordTimestamp value, $Res Function(_WordTimestamp) _then) = __$WordTimestampCopyWithImpl;
@override @useResult
$Res call({
 String word, double start, double end
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
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? start = null,Object? end = null,}) {
  return _then(_WordTimestamp(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as double,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$VocabularyDetail {

 String get word; String? get definition;// Optional - Next.js API doesn't provide this
 String get pos;// Changed from partOfSpeech to match Next.js API
 String get phonetic; String? get audioUrl; Map<String, String>? get translations; Map<String, String>? get pronunciations; String get example; Map<String, String>? get exampleTranslations;
/// Create a copy of VocabularyDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyDetailCopyWith<VocabularyDetail> get copyWith => _$VocabularyDetailCopyWithImpl<VocabularyDetail>(this as VocabularyDetail, _$identity);

  /// Serializes this VocabularyDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyDetail&&(identical(other.word, word) || other.word == word)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.pos, pos) || other.pos == pos)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other.translations, translations)&&const DeepCollectionEquality().equals(other.pronunciations, pronunciations)&&(identical(other.example, example) || other.example == example)&&const DeepCollectionEquality().equals(other.exampleTranslations, exampleTranslations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,definition,pos,phonetic,audioUrl,const DeepCollectionEquality().hash(translations),const DeepCollectionEquality().hash(pronunciations),example,const DeepCollectionEquality().hash(exampleTranslations));

@override
String toString() {
  return 'VocabularyDetail(word: $word, definition: $definition, pos: $pos, phonetic: $phonetic, audioUrl: $audioUrl, translations: $translations, pronunciations: $pronunciations, example: $example, exampleTranslations: $exampleTranslations)';
}


}

/// @nodoc
abstract mixin class $VocabularyDetailCopyWith<$Res>  {
  factory $VocabularyDetailCopyWith(VocabularyDetail value, $Res Function(VocabularyDetail) _then) = _$VocabularyDetailCopyWithImpl;
@useResult
$Res call({
 String word, String? definition, String pos, String phonetic, String? audioUrl, Map<String, String>? translations, Map<String, String>? pronunciations, String example, Map<String, String>? exampleTranslations
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
@pragma('vm:prefer-inline') @override $Res call({Object? word = null,Object? definition = freezed,Object? pos = null,Object? phonetic = null,Object? audioUrl = freezed,Object? translations = freezed,Object? pronunciations = freezed,Object? example = null,Object? exampleTranslations = freezed,}) {
  return _then(_self.copyWith(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,definition: freezed == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String?,pos: null == pos ? _self.pos : pos // ignore: cast_nullable_to_non_nullable
as String,phonetic: null == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,translations: freezed == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,pronunciations: freezed == pronunciations ? _self.pronunciations : pronunciations // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,exampleTranslations: freezed == exampleTranslations ? _self.exampleTranslations : exampleTranslations // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String word,  String? definition,  String pos,  String phonetic,  String? audioUrl,  Map<String, String>? translations,  Map<String, String>? pronunciations,  String example,  Map<String, String>? exampleTranslations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyDetail() when $default != null:
return $default(_that.word,_that.definition,_that.pos,_that.phonetic,_that.audioUrl,_that.translations,_that.pronunciations,_that.example,_that.exampleTranslations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String word,  String? definition,  String pos,  String phonetic,  String? audioUrl,  Map<String, String>? translations,  Map<String, String>? pronunciations,  String example,  Map<String, String>? exampleTranslations)  $default,) {final _that = this;
switch (_that) {
case _VocabularyDetail():
return $default(_that.word,_that.definition,_that.pos,_that.phonetic,_that.audioUrl,_that.translations,_that.pronunciations,_that.example,_that.exampleTranslations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String word,  String? definition,  String pos,  String phonetic,  String? audioUrl,  Map<String, String>? translations,  Map<String, String>? pronunciations,  String example,  Map<String, String>? exampleTranslations)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyDetail() when $default != null:
return $default(_that.word,_that.definition,_that.pos,_that.phonetic,_that.audioUrl,_that.translations,_that.pronunciations,_that.example,_that.exampleTranslations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyDetail implements VocabularyDetail {
  const _VocabularyDetail({required this.word, this.definition, this.pos = '', this.phonetic = '', this.audioUrl, final  Map<String, String>? translations, final  Map<String, String>? pronunciations, this.example = '', final  Map<String, String>? exampleTranslations}): _translations = translations,_pronunciations = pronunciations,_exampleTranslations = exampleTranslations;
  factory _VocabularyDetail.fromJson(Map<String, dynamic> json) => _$VocabularyDetailFromJson(json);

@override final  String word;
@override final  String? definition;
// Optional - Next.js API doesn't provide this
@override@JsonKey() final  String pos;
// Changed from partOfSpeech to match Next.js API
@override@JsonKey() final  String phonetic;
@override final  String? audioUrl;
 final  Map<String, String>? _translations;
@override Map<String, String>? get translations {
  final value = _translations;
  if (value == null) return null;
  if (_translations is EqualUnmodifiableMapView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, String>? _pronunciations;
@override Map<String, String>? get pronunciations {
  final value = _pronunciations;
  if (value == null) return null;
  if (_pronunciations is EqualUnmodifiableMapView) return _pronunciations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  String example;
 final  Map<String, String>? _exampleTranslations;
@override Map<String, String>? get exampleTranslations {
  final value = _exampleTranslations;
  if (value == null) return null;
  if (_exampleTranslations is EqualUnmodifiableMapView) return _exampleTranslations;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyDetail&&(identical(other.word, word) || other.word == word)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.pos, pos) || other.pos == pos)&&(identical(other.phonetic, phonetic) || other.phonetic == phonetic)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other._translations, _translations)&&const DeepCollectionEquality().equals(other._pronunciations, _pronunciations)&&(identical(other.example, example) || other.example == example)&&const DeepCollectionEquality().equals(other._exampleTranslations, _exampleTranslations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,word,definition,pos,phonetic,audioUrl,const DeepCollectionEquality().hash(_translations),const DeepCollectionEquality().hash(_pronunciations),example,const DeepCollectionEquality().hash(_exampleTranslations));

@override
String toString() {
  return 'VocabularyDetail(word: $word, definition: $definition, pos: $pos, phonetic: $phonetic, audioUrl: $audioUrl, translations: $translations, pronunciations: $pronunciations, example: $example, exampleTranslations: $exampleTranslations)';
}


}

/// @nodoc
abstract mixin class _$VocabularyDetailCopyWith<$Res> implements $VocabularyDetailCopyWith<$Res> {
  factory _$VocabularyDetailCopyWith(_VocabularyDetail value, $Res Function(_VocabularyDetail) _then) = __$VocabularyDetailCopyWithImpl;
@override @useResult
$Res call({
 String word, String? definition, String pos, String phonetic, String? audioUrl, Map<String, String>? translations, Map<String, String>? pronunciations, String example, Map<String, String>? exampleTranslations
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
@override @pragma('vm:prefer-inline') $Res call({Object? word = null,Object? definition = freezed,Object? pos = null,Object? phonetic = null,Object? audioUrl = freezed,Object? translations = freezed,Object? pronunciations = freezed,Object? example = null,Object? exampleTranslations = freezed,}) {
  return _then(_VocabularyDetail(
word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,definition: freezed == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String?,pos: null == pos ? _self.pos : pos // ignore: cast_nullable_to_non_nullable
as String,phonetic: null == phonetic ? _self.phonetic : phonetic // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,translations: freezed == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,pronunciations: freezed == pronunciations ? _self._pronunciations : pronunciations // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,example: null == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String,exampleTranslations: freezed == exampleTranslations ? _self._exampleTranslations : exampleTranslations // ignore: cast_nullable_to_non_nullable
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

 String get id; String get question; String? get audioUrl; List<String> get options; String get correctAnswer; String? get explanation;
/// Create a copy of Question
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionCopyWith<Question> get copyWith => _$QuestionCopyWithImpl<Question>(this as Question, _$identity);

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Question&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,audioUrl,const DeepCollectionEquality().hash(options),correctAnswer,explanation);

@override
String toString() {
  return 'Question(id: $id, question: $question, audioUrl: $audioUrl, options: $options, correctAnswer: $correctAnswer, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class $QuestionCopyWith<$Res>  {
  factory $QuestionCopyWith(Question value, $Res Function(Question) _then) = _$QuestionCopyWithImpl;
@useResult
$Res call({
 String id, String question, String? audioUrl, List<String> options, String correctAnswer, String? explanation
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? audioUrl = freezed,Object? options = null,Object? correctAnswer = null,Object? explanation = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String question,  String? audioUrl,  List<String> options,  String correctAnswer,  String? explanation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.question,_that.audioUrl,_that.options,_that.correctAnswer,_that.explanation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String question,  String? audioUrl,  List<String> options,  String correctAnswer,  String? explanation)  $default,) {final _that = this;
switch (_that) {
case _Question():
return $default(_that.id,_that.question,_that.audioUrl,_that.options,_that.correctAnswer,_that.explanation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String question,  String? audioUrl,  List<String> options,  String correctAnswer,  String? explanation)?  $default,) {final _that = this;
switch (_that) {
case _Question() when $default != null:
return $default(_that.id,_that.question,_that.audioUrl,_that.options,_that.correctAnswer,_that.explanation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Question implements Question {
  const _Question({required this.id, required this.question, this.audioUrl, final  List<String> options = const [], required this.correctAnswer, this.explanation}): _options = options;
  factory _Question.fromJson(Map<String, dynamic> json) => _$QuestionFromJson(json);

@override final  String id;
@override final  String question;
@override final  String? audioUrl;
 final  List<String> _options;
@override@JsonKey() List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  String correctAnswer;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Question&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.explanation, explanation) || other.explanation == explanation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,audioUrl,const DeepCollectionEquality().hash(_options),correctAnswer,explanation);

@override
String toString() {
  return 'Question(id: $id, question: $question, audioUrl: $audioUrl, options: $options, correctAnswer: $correctAnswer, explanation: $explanation)';
}


}

/// @nodoc
abstract mixin class _$QuestionCopyWith<$Res> implements $QuestionCopyWith<$Res> {
  factory _$QuestionCopyWith(_Question value, $Res Function(_Question) _then) = __$QuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String question, String? audioUrl, List<String> options, String correctAnswer, String? explanation
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? audioUrl = freezed,Object? options = null,Object? correctAnswer = null,Object? explanation = freezed,}) {
  return _then(_Question(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,explanation: freezed == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
