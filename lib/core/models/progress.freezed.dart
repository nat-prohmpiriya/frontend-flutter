// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Progress {

 String get odId; Map<String, StoryProgress> get stories; List<SavedWord> get savedWords; List<String> get achievements; Statistics? get statistics;
/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressCopyWith<Progress> get copyWith => _$ProgressCopyWithImpl<Progress>(this as Progress, _$identity);

  /// Serializes this Progress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Progress&&(identical(other.odId, odId) || other.odId == odId)&&const DeepCollectionEquality().equals(other.stories, stories)&&const DeepCollectionEquality().equals(other.savedWords, savedWords)&&const DeepCollectionEquality().equals(other.achievements, achievements)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,odId,const DeepCollectionEquality().hash(stories),const DeepCollectionEquality().hash(savedWords),const DeepCollectionEquality().hash(achievements),statistics);

@override
String toString() {
  return 'Progress(odId: $odId, stories: $stories, savedWords: $savedWords, achievements: $achievements, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class $ProgressCopyWith<$Res>  {
  factory $ProgressCopyWith(Progress value, $Res Function(Progress) _then) = _$ProgressCopyWithImpl;
@useResult
$Res call({
 String odId, Map<String, StoryProgress> stories, List<SavedWord> savedWords, List<String> achievements, Statistics? statistics
});


$StatisticsCopyWith<$Res>? get statistics;

}
/// @nodoc
class _$ProgressCopyWithImpl<$Res>
    implements $ProgressCopyWith<$Res> {
  _$ProgressCopyWithImpl(this._self, this._then);

  final Progress _self;
  final $Res Function(Progress) _then;

/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? odId = null,Object? stories = null,Object? savedWords = null,Object? achievements = null,Object? statistics = freezed,}) {
  return _then(_self.copyWith(
odId: null == odId ? _self.odId : odId // ignore: cast_nullable_to_non_nullable
as String,stories: null == stories ? _self.stories : stories // ignore: cast_nullable_to_non_nullable
as Map<String, StoryProgress>,savedWords: null == savedWords ? _self.savedWords : savedWords // ignore: cast_nullable_to_non_nullable
as List<SavedWord>,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as Statistics?,
  ));
}
/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatisticsCopyWith<$Res>? get statistics {
    if (_self.statistics == null) {
    return null;
  }

  return $StatisticsCopyWith<$Res>(_self.statistics!, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// Adds pattern-matching-related methods to [Progress].
extension ProgressPatterns on Progress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Progress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Progress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Progress value)  $default,){
final _that = this;
switch (_that) {
case _Progress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Progress value)?  $default,){
final _that = this;
switch (_that) {
case _Progress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String odId,  Map<String, StoryProgress> stories,  List<SavedWord> savedWords,  List<String> achievements,  Statistics? statistics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Progress() when $default != null:
return $default(_that.odId,_that.stories,_that.savedWords,_that.achievements,_that.statistics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String odId,  Map<String, StoryProgress> stories,  List<SavedWord> savedWords,  List<String> achievements,  Statistics? statistics)  $default,) {final _that = this;
switch (_that) {
case _Progress():
return $default(_that.odId,_that.stories,_that.savedWords,_that.achievements,_that.statistics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String odId,  Map<String, StoryProgress> stories,  List<SavedWord> savedWords,  List<String> achievements,  Statistics? statistics)?  $default,) {final _that = this;
switch (_that) {
case _Progress() when $default != null:
return $default(_that.odId,_that.stories,_that.savedWords,_that.achievements,_that.statistics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Progress implements Progress {
  const _Progress({required this.odId, final  Map<String, StoryProgress> stories = const {}, final  List<SavedWord> savedWords = const [], final  List<String> achievements = const [], this.statistics}): _stories = stories,_savedWords = savedWords,_achievements = achievements;
  factory _Progress.fromJson(Map<String, dynamic> json) => _$ProgressFromJson(json);

@override final  String odId;
 final  Map<String, StoryProgress> _stories;
@override@JsonKey() Map<String, StoryProgress> get stories {
  if (_stories is EqualUnmodifiableMapView) return _stories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_stories);
}

 final  List<SavedWord> _savedWords;
@override@JsonKey() List<SavedWord> get savedWords {
  if (_savedWords is EqualUnmodifiableListView) return _savedWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_savedWords);
}

 final  List<String> _achievements;
@override@JsonKey() List<String> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

@override final  Statistics? statistics;

/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressCopyWith<_Progress> get copyWith => __$ProgressCopyWithImpl<_Progress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Progress&&(identical(other.odId, odId) || other.odId == odId)&&const DeepCollectionEquality().equals(other._stories, _stories)&&const DeepCollectionEquality().equals(other._savedWords, _savedWords)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&(identical(other.statistics, statistics) || other.statistics == statistics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,odId,const DeepCollectionEquality().hash(_stories),const DeepCollectionEquality().hash(_savedWords),const DeepCollectionEquality().hash(_achievements),statistics);

@override
String toString() {
  return 'Progress(odId: $odId, stories: $stories, savedWords: $savedWords, achievements: $achievements, statistics: $statistics)';
}


}

/// @nodoc
abstract mixin class _$ProgressCopyWith<$Res> implements $ProgressCopyWith<$Res> {
  factory _$ProgressCopyWith(_Progress value, $Res Function(_Progress) _then) = __$ProgressCopyWithImpl;
@override @useResult
$Res call({
 String odId, Map<String, StoryProgress> stories, List<SavedWord> savedWords, List<String> achievements, Statistics? statistics
});


@override $StatisticsCopyWith<$Res>? get statistics;

}
/// @nodoc
class __$ProgressCopyWithImpl<$Res>
    implements _$ProgressCopyWith<$Res> {
  __$ProgressCopyWithImpl(this._self, this._then);

  final _Progress _self;
  final $Res Function(_Progress) _then;

/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? odId = null,Object? stories = null,Object? savedWords = null,Object? achievements = null,Object? statistics = freezed,}) {
  return _then(_Progress(
odId: null == odId ? _self.odId : odId // ignore: cast_nullable_to_non_nullable
as String,stories: null == stories ? _self._stories : stories // ignore: cast_nullable_to_non_nullable
as Map<String, StoryProgress>,savedWords: null == savedWords ? _self._savedWords : savedWords // ignore: cast_nullable_to_non_nullable
as List<SavedWord>,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<String>,statistics: freezed == statistics ? _self.statistics : statistics // ignore: cast_nullable_to_non_nullable
as Statistics?,
  ));
}

/// Create a copy of Progress
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatisticsCopyWith<$Res>? get statistics {
    if (_self.statistics == null) {
    return null;
  }

  return $StatisticsCopyWith<$Res>(_self.statistics!, (value) {
    return _then(_self.copyWith(statistics: value));
  });
}
}


/// @nodoc
mixin _$StoryProgress {

 String get status;// not_started, in_progress, completed
 int get currentEpisode; int get currentPage; int get roundsCompleted; DateTime? get lastAccessedAt; DateTime? get completedAt; Map<int, EpisodeGameResult> get episodeGames;
/// Create a copy of StoryProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoryProgressCopyWith<StoryProgress> get copyWith => _$StoryProgressCopyWithImpl<StoryProgress>(this as StoryProgress, _$identity);

  /// Serializes this StoryProgress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoryProgress&&(identical(other.status, status) || other.status == status)&&(identical(other.currentEpisode, currentEpisode) || other.currentEpisode == currentEpisode)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.roundsCompleted, roundsCompleted) || other.roundsCompleted == roundsCompleted)&&(identical(other.lastAccessedAt, lastAccessedAt) || other.lastAccessedAt == lastAccessedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.episodeGames, episodeGames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,currentEpisode,currentPage,roundsCompleted,lastAccessedAt,completedAt,const DeepCollectionEquality().hash(episodeGames));

@override
String toString() {
  return 'StoryProgress(status: $status, currentEpisode: $currentEpisode, currentPage: $currentPage, roundsCompleted: $roundsCompleted, lastAccessedAt: $lastAccessedAt, completedAt: $completedAt, episodeGames: $episodeGames)';
}


}

/// @nodoc
abstract mixin class $StoryProgressCopyWith<$Res>  {
  factory $StoryProgressCopyWith(StoryProgress value, $Res Function(StoryProgress) _then) = _$StoryProgressCopyWithImpl;
@useResult
$Res call({
 String status, int currentEpisode, int currentPage, int roundsCompleted, DateTime? lastAccessedAt, DateTime? completedAt, Map<int, EpisodeGameResult> episodeGames
});




}
/// @nodoc
class _$StoryProgressCopyWithImpl<$Res>
    implements $StoryProgressCopyWith<$Res> {
  _$StoryProgressCopyWithImpl(this._self, this._then);

  final StoryProgress _self;
  final $Res Function(StoryProgress) _then;

/// Create a copy of StoryProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? currentEpisode = null,Object? currentPage = null,Object? roundsCompleted = null,Object? lastAccessedAt = freezed,Object? completedAt = freezed,Object? episodeGames = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentEpisode: null == currentEpisode ? _self.currentEpisode : currentEpisode // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,roundsCompleted: null == roundsCompleted ? _self.roundsCompleted : roundsCompleted // ignore: cast_nullable_to_non_nullable
as int,lastAccessedAt: freezed == lastAccessedAt ? _self.lastAccessedAt : lastAccessedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,episodeGames: null == episodeGames ? _self.episodeGames : episodeGames // ignore: cast_nullable_to_non_nullable
as Map<int, EpisodeGameResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoryProgress].
extension StoryProgressPatterns on StoryProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoryProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoryProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoryProgress value)  $default,){
final _that = this;
switch (_that) {
case _StoryProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoryProgress value)?  $default,){
final _that = this;
switch (_that) {
case _StoryProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  int currentEpisode,  int currentPage,  int roundsCompleted,  DateTime? lastAccessedAt,  DateTime? completedAt,  Map<int, EpisodeGameResult> episodeGames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoryProgress() when $default != null:
return $default(_that.status,_that.currentEpisode,_that.currentPage,_that.roundsCompleted,_that.lastAccessedAt,_that.completedAt,_that.episodeGames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  int currentEpisode,  int currentPage,  int roundsCompleted,  DateTime? lastAccessedAt,  DateTime? completedAt,  Map<int, EpisodeGameResult> episodeGames)  $default,) {final _that = this;
switch (_that) {
case _StoryProgress():
return $default(_that.status,_that.currentEpisode,_that.currentPage,_that.roundsCompleted,_that.lastAccessedAt,_that.completedAt,_that.episodeGames);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  int currentEpisode,  int currentPage,  int roundsCompleted,  DateTime? lastAccessedAt,  DateTime? completedAt,  Map<int, EpisodeGameResult> episodeGames)?  $default,) {final _that = this;
switch (_that) {
case _StoryProgress() when $default != null:
return $default(_that.status,_that.currentEpisode,_that.currentPage,_that.roundsCompleted,_that.lastAccessedAt,_that.completedAt,_that.episodeGames);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoryProgress implements StoryProgress {
  const _StoryProgress({required this.status, this.currentEpisode = 1, this.currentPage = 1, this.roundsCompleted = 0, this.lastAccessedAt, this.completedAt, final  Map<int, EpisodeGameResult> episodeGames = const {}}): _episodeGames = episodeGames;
  factory _StoryProgress.fromJson(Map<String, dynamic> json) => _$StoryProgressFromJson(json);

@override final  String status;
// not_started, in_progress, completed
@override@JsonKey() final  int currentEpisode;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int roundsCompleted;
@override final  DateTime? lastAccessedAt;
@override final  DateTime? completedAt;
 final  Map<int, EpisodeGameResult> _episodeGames;
@override@JsonKey() Map<int, EpisodeGameResult> get episodeGames {
  if (_episodeGames is EqualUnmodifiableMapView) return _episodeGames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_episodeGames);
}


/// Create a copy of StoryProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoryProgressCopyWith<_StoryProgress> get copyWith => __$StoryProgressCopyWithImpl<_StoryProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoryProgressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoryProgress&&(identical(other.status, status) || other.status == status)&&(identical(other.currentEpisode, currentEpisode) || other.currentEpisode == currentEpisode)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.roundsCompleted, roundsCompleted) || other.roundsCompleted == roundsCompleted)&&(identical(other.lastAccessedAt, lastAccessedAt) || other.lastAccessedAt == lastAccessedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other._episodeGames, _episodeGames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,currentEpisode,currentPage,roundsCompleted,lastAccessedAt,completedAt,const DeepCollectionEquality().hash(_episodeGames));

@override
String toString() {
  return 'StoryProgress(status: $status, currentEpisode: $currentEpisode, currentPage: $currentPage, roundsCompleted: $roundsCompleted, lastAccessedAt: $lastAccessedAt, completedAt: $completedAt, episodeGames: $episodeGames)';
}


}

/// @nodoc
abstract mixin class _$StoryProgressCopyWith<$Res> implements $StoryProgressCopyWith<$Res> {
  factory _$StoryProgressCopyWith(_StoryProgress value, $Res Function(_StoryProgress) _then) = __$StoryProgressCopyWithImpl;
@override @useResult
$Res call({
 String status, int currentEpisode, int currentPage, int roundsCompleted, DateTime? lastAccessedAt, DateTime? completedAt, Map<int, EpisodeGameResult> episodeGames
});




}
/// @nodoc
class __$StoryProgressCopyWithImpl<$Res>
    implements _$StoryProgressCopyWith<$Res> {
  __$StoryProgressCopyWithImpl(this._self, this._then);

  final _StoryProgress _self;
  final $Res Function(_StoryProgress) _then;

/// Create a copy of StoryProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? currentEpisode = null,Object? currentPage = null,Object? roundsCompleted = null,Object? lastAccessedAt = freezed,Object? completedAt = freezed,Object? episodeGames = null,}) {
  return _then(_StoryProgress(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentEpisode: null == currentEpisode ? _self.currentEpisode : currentEpisode // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,roundsCompleted: null == roundsCompleted ? _self.roundsCompleted : roundsCompleted // ignore: cast_nullable_to_non_nullable
as int,lastAccessedAt: freezed == lastAccessedAt ? _self.lastAccessedAt : lastAccessedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,episodeGames: null == episodeGames ? _self._episodeGames : episodeGames // ignore: cast_nullable_to_non_nullable
as Map<int, EpisodeGameResult>,
  ));
}


}


/// @nodoc
mixin _$EpisodeGameResult {

 bool get completed; int get score; String get tier;// fail, pass, good, perfect
 int get coinsEarned; int get timeTaken; int get attempts;
/// Create a copy of EpisodeGameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EpisodeGameResultCopyWith<EpisodeGameResult> get copyWith => _$EpisodeGameResultCopyWithImpl<EpisodeGameResult>(this as EpisodeGameResult, _$identity);

  /// Serializes this EpisodeGameResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EpisodeGameResult&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.score, score) || other.score == score)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.coinsEarned, coinsEarned) || other.coinsEarned == coinsEarned)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completed,score,tier,coinsEarned,timeTaken,attempts);

@override
String toString() {
  return 'EpisodeGameResult(completed: $completed, score: $score, tier: $tier, coinsEarned: $coinsEarned, timeTaken: $timeTaken, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $EpisodeGameResultCopyWith<$Res>  {
  factory $EpisodeGameResultCopyWith(EpisodeGameResult value, $Res Function(EpisodeGameResult) _then) = _$EpisodeGameResultCopyWithImpl;
@useResult
$Res call({
 bool completed, int score, String tier, int coinsEarned, int timeTaken, int attempts
});




}
/// @nodoc
class _$EpisodeGameResultCopyWithImpl<$Res>
    implements $EpisodeGameResultCopyWith<$Res> {
  _$EpisodeGameResultCopyWithImpl(this._self, this._then);

  final EpisodeGameResult _self;
  final $Res Function(EpisodeGameResult) _then;

/// Create a copy of EpisodeGameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completed = null,Object? score = null,Object? tier = null,Object? coinsEarned = null,Object? timeTaken = null,Object? attempts = null,}) {
  return _then(_self.copyWith(
completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,coinsEarned: null == coinsEarned ? _self.coinsEarned : coinsEarned // ignore: cast_nullable_to_non_nullable
as int,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as int,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EpisodeGameResult].
extension EpisodeGameResultPatterns on EpisodeGameResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EpisodeGameResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EpisodeGameResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EpisodeGameResult value)  $default,){
final _that = this;
switch (_that) {
case _EpisodeGameResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EpisodeGameResult value)?  $default,){
final _that = this;
switch (_that) {
case _EpisodeGameResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool completed,  int score,  String tier,  int coinsEarned,  int timeTaken,  int attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EpisodeGameResult() when $default != null:
return $default(_that.completed,_that.score,_that.tier,_that.coinsEarned,_that.timeTaken,_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool completed,  int score,  String tier,  int coinsEarned,  int timeTaken,  int attempts)  $default,) {final _that = this;
switch (_that) {
case _EpisodeGameResult():
return $default(_that.completed,_that.score,_that.tier,_that.coinsEarned,_that.timeTaken,_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool completed,  int score,  String tier,  int coinsEarned,  int timeTaken,  int attempts)?  $default,) {final _that = this;
switch (_that) {
case _EpisodeGameResult() when $default != null:
return $default(_that.completed,_that.score,_that.tier,_that.coinsEarned,_that.timeTaken,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EpisodeGameResult implements EpisodeGameResult {
  const _EpisodeGameResult({this.completed = false, this.score = 0, this.tier = 'fail', this.coinsEarned = 0, this.timeTaken = 0, this.attempts = 0});
  factory _EpisodeGameResult.fromJson(Map<String, dynamic> json) => _$EpisodeGameResultFromJson(json);

@override@JsonKey() final  bool completed;
@override@JsonKey() final  int score;
@override@JsonKey() final  String tier;
// fail, pass, good, perfect
@override@JsonKey() final  int coinsEarned;
@override@JsonKey() final  int timeTaken;
@override@JsonKey() final  int attempts;

/// Create a copy of EpisodeGameResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EpisodeGameResultCopyWith<_EpisodeGameResult> get copyWith => __$EpisodeGameResultCopyWithImpl<_EpisodeGameResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EpisodeGameResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EpisodeGameResult&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.score, score) || other.score == score)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.coinsEarned, coinsEarned) || other.coinsEarned == coinsEarned)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completed,score,tier,coinsEarned,timeTaken,attempts);

@override
String toString() {
  return 'EpisodeGameResult(completed: $completed, score: $score, tier: $tier, coinsEarned: $coinsEarned, timeTaken: $timeTaken, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$EpisodeGameResultCopyWith<$Res> implements $EpisodeGameResultCopyWith<$Res> {
  factory _$EpisodeGameResultCopyWith(_EpisodeGameResult value, $Res Function(_EpisodeGameResult) _then) = __$EpisodeGameResultCopyWithImpl;
@override @useResult
$Res call({
 bool completed, int score, String tier, int coinsEarned, int timeTaken, int attempts
});




}
/// @nodoc
class __$EpisodeGameResultCopyWithImpl<$Res>
    implements _$EpisodeGameResultCopyWith<$Res> {
  __$EpisodeGameResultCopyWithImpl(this._self, this._then);

  final _EpisodeGameResult _self;
  final $Res Function(_EpisodeGameResult) _then;

/// Create a copy of EpisodeGameResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completed = null,Object? score = null,Object? tier = null,Object? coinsEarned = null,Object? timeTaken = null,Object? attempts = null,}) {
  return _then(_EpisodeGameResult(
completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,coinsEarned: null == coinsEarned ? _self.coinsEarned : coinsEarned // ignore: cast_nullable_to_non_nullable
as int,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as int,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SavedWord {

 String get odId; DateTime get savedAt; String get status;// learning, learned, difficult
 String? get albumId;
/// Create a copy of SavedWord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavedWordCopyWith<SavedWord> get copyWith => _$SavedWordCopyWithImpl<SavedWord>(this as SavedWord, _$identity);

  /// Serializes this SavedWord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavedWord&&(identical(other.odId, odId) || other.odId == odId)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.albumId, albumId) || other.albumId == albumId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,odId,savedAt,status,albumId);

@override
String toString() {
  return 'SavedWord(odId: $odId, savedAt: $savedAt, status: $status, albumId: $albumId)';
}


}

/// @nodoc
abstract mixin class $SavedWordCopyWith<$Res>  {
  factory $SavedWordCopyWith(SavedWord value, $Res Function(SavedWord) _then) = _$SavedWordCopyWithImpl;
@useResult
$Res call({
 String odId, DateTime savedAt, String status, String? albumId
});




}
/// @nodoc
class _$SavedWordCopyWithImpl<$Res>
    implements $SavedWordCopyWith<$Res> {
  _$SavedWordCopyWithImpl(this._self, this._then);

  final SavedWord _self;
  final $Res Function(SavedWord) _then;

/// Create a copy of SavedWord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? odId = null,Object? savedAt = null,Object? status = null,Object? albumId = freezed,}) {
  return _then(_self.copyWith(
odId: null == odId ? _self.odId : odId // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,albumId: freezed == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavedWord].
extension SavedWordPatterns on SavedWord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavedWord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavedWord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavedWord value)  $default,){
final _that = this;
switch (_that) {
case _SavedWord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavedWord value)?  $default,){
final _that = this;
switch (_that) {
case _SavedWord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String odId,  DateTime savedAt,  String status,  String? albumId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavedWord() when $default != null:
return $default(_that.odId,_that.savedAt,_that.status,_that.albumId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String odId,  DateTime savedAt,  String status,  String? albumId)  $default,) {final _that = this;
switch (_that) {
case _SavedWord():
return $default(_that.odId,_that.savedAt,_that.status,_that.albumId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String odId,  DateTime savedAt,  String status,  String? albumId)?  $default,) {final _that = this;
switch (_that) {
case _SavedWord() when $default != null:
return $default(_that.odId,_that.savedAt,_that.status,_that.albumId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavedWord implements SavedWord {
  const _SavedWord({required this.odId, required this.savedAt, this.status = 'learning', this.albumId});
  factory _SavedWord.fromJson(Map<String, dynamic> json) => _$SavedWordFromJson(json);

@override final  String odId;
@override final  DateTime savedAt;
@override@JsonKey() final  String status;
// learning, learned, difficult
@override final  String? albumId;

/// Create a copy of SavedWord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedWordCopyWith<_SavedWord> get copyWith => __$SavedWordCopyWithImpl<_SavedWord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavedWordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavedWord&&(identical(other.odId, odId) || other.odId == odId)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.albumId, albumId) || other.albumId == albumId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,odId,savedAt,status,albumId);

@override
String toString() {
  return 'SavedWord(odId: $odId, savedAt: $savedAt, status: $status, albumId: $albumId)';
}


}

/// @nodoc
abstract mixin class _$SavedWordCopyWith<$Res> implements $SavedWordCopyWith<$Res> {
  factory _$SavedWordCopyWith(_SavedWord value, $Res Function(_SavedWord) _then) = __$SavedWordCopyWithImpl;
@override @useResult
$Res call({
 String odId, DateTime savedAt, String status, String? albumId
});




}
/// @nodoc
class __$SavedWordCopyWithImpl<$Res>
    implements _$SavedWordCopyWith<$Res> {
  __$SavedWordCopyWithImpl(this._self, this._then);

  final _SavedWord _self;
  final $Res Function(_SavedWord) _then;

/// Create a copy of SavedWord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? odId = null,Object? savedAt = null,Object? status = null,Object? albumId = freezed,}) {
  return _then(_SavedWord(
odId: null == odId ? _self.odId : odId // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,albumId: freezed == albumId ? _self.albumId : albumId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Statistics {

 int get totalReadingTime; int get storiesCompleted; int get wordsLearned; int get quizzesTaken; int get streakDays; int get totalCoins;
/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatisticsCopyWith<Statistics> get copyWith => _$StatisticsCopyWithImpl<Statistics>(this as Statistics, _$identity);

  /// Serializes this Statistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Statistics&&(identical(other.totalReadingTime, totalReadingTime) || other.totalReadingTime == totalReadingTime)&&(identical(other.storiesCompleted, storiesCompleted) || other.storiesCompleted == storiesCompleted)&&(identical(other.wordsLearned, wordsLearned) || other.wordsLearned == wordsLearned)&&(identical(other.quizzesTaken, quizzesTaken) || other.quizzesTaken == quizzesTaken)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.totalCoins, totalCoins) || other.totalCoins == totalCoins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalReadingTime,storiesCompleted,wordsLearned,quizzesTaken,streakDays,totalCoins);

@override
String toString() {
  return 'Statistics(totalReadingTime: $totalReadingTime, storiesCompleted: $storiesCompleted, wordsLearned: $wordsLearned, quizzesTaken: $quizzesTaken, streakDays: $streakDays, totalCoins: $totalCoins)';
}


}

/// @nodoc
abstract mixin class $StatisticsCopyWith<$Res>  {
  factory $StatisticsCopyWith(Statistics value, $Res Function(Statistics) _then) = _$StatisticsCopyWithImpl;
@useResult
$Res call({
 int totalReadingTime, int storiesCompleted, int wordsLearned, int quizzesTaken, int streakDays, int totalCoins
});




}
/// @nodoc
class _$StatisticsCopyWithImpl<$Res>
    implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._self, this._then);

  final Statistics _self;
  final $Res Function(Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalReadingTime = null,Object? storiesCompleted = null,Object? wordsLearned = null,Object? quizzesTaken = null,Object? streakDays = null,Object? totalCoins = null,}) {
  return _then(_self.copyWith(
totalReadingTime: null == totalReadingTime ? _self.totalReadingTime : totalReadingTime // ignore: cast_nullable_to_non_nullable
as int,storiesCompleted: null == storiesCompleted ? _self.storiesCompleted : storiesCompleted // ignore: cast_nullable_to_non_nullable
as int,wordsLearned: null == wordsLearned ? _self.wordsLearned : wordsLearned // ignore: cast_nullable_to_non_nullable
as int,quizzesTaken: null == quizzesTaken ? _self.quizzesTaken : quizzesTaken // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,totalCoins: null == totalCoins ? _self.totalCoins : totalCoins // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Statistics].
extension StatisticsPatterns on Statistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Statistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Statistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Statistics value)  $default,){
final _that = this;
switch (_that) {
case _Statistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Statistics value)?  $default,){
final _that = this;
switch (_that) {
case _Statistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalReadingTime,  int storiesCompleted,  int wordsLearned,  int quizzesTaken,  int streakDays,  int totalCoins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Statistics() when $default != null:
return $default(_that.totalReadingTime,_that.storiesCompleted,_that.wordsLearned,_that.quizzesTaken,_that.streakDays,_that.totalCoins);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalReadingTime,  int storiesCompleted,  int wordsLearned,  int quizzesTaken,  int streakDays,  int totalCoins)  $default,) {final _that = this;
switch (_that) {
case _Statistics():
return $default(_that.totalReadingTime,_that.storiesCompleted,_that.wordsLearned,_that.quizzesTaken,_that.streakDays,_that.totalCoins);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalReadingTime,  int storiesCompleted,  int wordsLearned,  int quizzesTaken,  int streakDays,  int totalCoins)?  $default,) {final _that = this;
switch (_that) {
case _Statistics() when $default != null:
return $default(_that.totalReadingTime,_that.storiesCompleted,_that.wordsLearned,_that.quizzesTaken,_that.streakDays,_that.totalCoins);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Statistics implements Statistics {
  const _Statistics({this.totalReadingTime = 0, this.storiesCompleted = 0, this.wordsLearned = 0, this.quizzesTaken = 0, this.streakDays = 0, this.totalCoins = 0});
  factory _Statistics.fromJson(Map<String, dynamic> json) => _$StatisticsFromJson(json);

@override@JsonKey() final  int totalReadingTime;
@override@JsonKey() final  int storiesCompleted;
@override@JsonKey() final  int wordsLearned;
@override@JsonKey() final  int quizzesTaken;
@override@JsonKey() final  int streakDays;
@override@JsonKey() final  int totalCoins;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatisticsCopyWith<_Statistics> get copyWith => __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Statistics&&(identical(other.totalReadingTime, totalReadingTime) || other.totalReadingTime == totalReadingTime)&&(identical(other.storiesCompleted, storiesCompleted) || other.storiesCompleted == storiesCompleted)&&(identical(other.wordsLearned, wordsLearned) || other.wordsLearned == wordsLearned)&&(identical(other.quizzesTaken, quizzesTaken) || other.quizzesTaken == quizzesTaken)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.totalCoins, totalCoins) || other.totalCoins == totalCoins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalReadingTime,storiesCompleted,wordsLearned,quizzesTaken,streakDays,totalCoins);

@override
String toString() {
  return 'Statistics(totalReadingTime: $totalReadingTime, storiesCompleted: $storiesCompleted, wordsLearned: $wordsLearned, quizzesTaken: $quizzesTaken, streakDays: $streakDays, totalCoins: $totalCoins)';
}


}

/// @nodoc
abstract mixin class _$StatisticsCopyWith<$Res> implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(_Statistics value, $Res Function(_Statistics) _then) = __$StatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalReadingTime, int storiesCompleted, int wordsLearned, int quizzesTaken, int streakDays, int totalCoins
});




}
/// @nodoc
class __$StatisticsCopyWithImpl<$Res>
    implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(this._self, this._then);

  final _Statistics _self;
  final $Res Function(_Statistics) _then;

/// Create a copy of Statistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalReadingTime = null,Object? storiesCompleted = null,Object? wordsLearned = null,Object? quizzesTaken = null,Object? streakDays = null,Object? totalCoins = null,}) {
  return _then(_Statistics(
totalReadingTime: null == totalReadingTime ? _self.totalReadingTime : totalReadingTime // ignore: cast_nullable_to_non_nullable
as int,storiesCompleted: null == storiesCompleted ? _self.storiesCompleted : storiesCompleted // ignore: cast_nullable_to_non_nullable
as int,wordsLearned: null == wordsLearned ? _self.wordsLearned : wordsLearned // ignore: cast_nullable_to_non_nullable
as int,quizzesTaken: null == quizzesTaken ? _self.quizzesTaken : quizzesTaken // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,totalCoins: null == totalCoins ? _self.totalCoins : totalCoins // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
