// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GameResult {

 int get score; int get correctCount; int get totalQuestions; String get tier;// fail, pass, good, perfect
 int get coinsEarned; int get timeTaken; List<AnswerRecord> get answers;
/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameResultCopyWith<GameResult> get copyWith => _$GameResultCopyWithImpl<GameResult>(this as GameResult, _$identity);

  /// Serializes this GameResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameResult&&(identical(other.score, score) || other.score == score)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.coinsEarned, coinsEarned) || other.coinsEarned == coinsEarned)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&const DeepCollectionEquality().equals(other.answers, answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,correctCount,totalQuestions,tier,coinsEarned,timeTaken,const DeepCollectionEquality().hash(answers));

@override
String toString() {
  return 'GameResult(score: $score, correctCount: $correctCount, totalQuestions: $totalQuestions, tier: $tier, coinsEarned: $coinsEarned, timeTaken: $timeTaken, answers: $answers)';
}


}

/// @nodoc
abstract mixin class $GameResultCopyWith<$Res>  {
  factory $GameResultCopyWith(GameResult value, $Res Function(GameResult) _then) = _$GameResultCopyWithImpl;
@useResult
$Res call({
 int score, int correctCount, int totalQuestions, String tier, int coinsEarned, int timeTaken, List<AnswerRecord> answers
});




}
/// @nodoc
class _$GameResultCopyWithImpl<$Res>
    implements $GameResultCopyWith<$Res> {
  _$GameResultCopyWithImpl(this._self, this._then);

  final GameResult _self;
  final $Res Function(GameResult) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? correctCount = null,Object? totalQuestions = null,Object? tier = null,Object? coinsEarned = null,Object? timeTaken = null,Object? answers = null,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,coinsEarned: null == coinsEarned ? _self.coinsEarned : coinsEarned // ignore: cast_nullable_to_non_nullable
as int,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<AnswerRecord>,
  ));
}

}


/// Adds pattern-matching-related methods to [GameResult].
extension GameResultPatterns on GameResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameResult value)  $default,){
final _that = this;
switch (_that) {
case _GameResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameResult value)?  $default,){
final _that = this;
switch (_that) {
case _GameResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int score,  int correctCount,  int totalQuestions,  String tier,  int coinsEarned,  int timeTaken,  List<AnswerRecord> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameResult() when $default != null:
return $default(_that.score,_that.correctCount,_that.totalQuestions,_that.tier,_that.coinsEarned,_that.timeTaken,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int score,  int correctCount,  int totalQuestions,  String tier,  int coinsEarned,  int timeTaken,  List<AnswerRecord> answers)  $default,) {final _that = this;
switch (_that) {
case _GameResult():
return $default(_that.score,_that.correctCount,_that.totalQuestions,_that.tier,_that.coinsEarned,_that.timeTaken,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int score,  int correctCount,  int totalQuestions,  String tier,  int coinsEarned,  int timeTaken,  List<AnswerRecord> answers)?  $default,) {final _that = this;
switch (_that) {
case _GameResult() when $default != null:
return $default(_that.score,_that.correctCount,_that.totalQuestions,_that.tier,_that.coinsEarned,_that.timeTaken,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameResult implements GameResult {
  const _GameResult({required this.score, required this.correctCount, required this.totalQuestions, required this.tier, required this.coinsEarned, required this.timeTaken, final  List<AnswerRecord> answers = const []}): _answers = answers;
  factory _GameResult.fromJson(Map<String, dynamic> json) => _$GameResultFromJson(json);

@override final  int score;
@override final  int correctCount;
@override final  int totalQuestions;
@override final  String tier;
// fail, pass, good, perfect
@override final  int coinsEarned;
@override final  int timeTaken;
 final  List<AnswerRecord> _answers;
@override@JsonKey() List<AnswerRecord> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameResultCopyWith<_GameResult> get copyWith => __$GameResultCopyWithImpl<_GameResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameResult&&(identical(other.score, score) || other.score == score)&&(identical(other.correctCount, correctCount) || other.correctCount == correctCount)&&(identical(other.totalQuestions, totalQuestions) || other.totalQuestions == totalQuestions)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.coinsEarned, coinsEarned) || other.coinsEarned == coinsEarned)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&const DeepCollectionEquality().equals(other._answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,correctCount,totalQuestions,tier,coinsEarned,timeTaken,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'GameResult(score: $score, correctCount: $correctCount, totalQuestions: $totalQuestions, tier: $tier, coinsEarned: $coinsEarned, timeTaken: $timeTaken, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$GameResultCopyWith<$Res> implements $GameResultCopyWith<$Res> {
  factory _$GameResultCopyWith(_GameResult value, $Res Function(_GameResult) _then) = __$GameResultCopyWithImpl;
@override @useResult
$Res call({
 int score, int correctCount, int totalQuestions, String tier, int coinsEarned, int timeTaken, List<AnswerRecord> answers
});




}
/// @nodoc
class __$GameResultCopyWithImpl<$Res>
    implements _$GameResultCopyWith<$Res> {
  __$GameResultCopyWithImpl(this._self, this._then);

  final _GameResult _self;
  final $Res Function(_GameResult) _then;

/// Create a copy of GameResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? correctCount = null,Object? totalQuestions = null,Object? tier = null,Object? coinsEarned = null,Object? timeTaken = null,Object? answers = null,}) {
  return _then(_GameResult(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,correctCount: null == correctCount ? _self.correctCount : correctCount // ignore: cast_nullable_to_non_nullable
as int,totalQuestions: null == totalQuestions ? _self.totalQuestions : totalQuestions // ignore: cast_nullable_to_non_nullable
as int,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,coinsEarned: null == coinsEarned ? _self.coinsEarned : coinsEarned // ignore: cast_nullable_to_non_nullable
as int,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<AnswerRecord>,
  ));
}


}


/// @nodoc
mixin _$AnswerRecord {

 String get questionId; int get selectedIndex; bool get isCorrect; int get timeTaken; bool get usedHint;
/// Create a copy of AnswerRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswerRecordCopyWith<AnswerRecord> get copyWith => _$AnswerRecordCopyWithImpl<AnswerRecord>(this as AnswerRecord, _$identity);

  /// Serializes this AnswerRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnswerRecord&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&(identical(other.usedHint, usedHint) || other.usedHint == usedHint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,selectedIndex,isCorrect,timeTaken,usedHint);

@override
String toString() {
  return 'AnswerRecord(questionId: $questionId, selectedIndex: $selectedIndex, isCorrect: $isCorrect, timeTaken: $timeTaken, usedHint: $usedHint)';
}


}

/// @nodoc
abstract mixin class $AnswerRecordCopyWith<$Res>  {
  factory $AnswerRecordCopyWith(AnswerRecord value, $Res Function(AnswerRecord) _then) = _$AnswerRecordCopyWithImpl;
@useResult
$Res call({
 String questionId, int selectedIndex, bool isCorrect, int timeTaken, bool usedHint
});




}
/// @nodoc
class _$AnswerRecordCopyWithImpl<$Res>
    implements $AnswerRecordCopyWith<$Res> {
  _$AnswerRecordCopyWithImpl(this._self, this._then);

  final AnswerRecord _self;
  final $Res Function(AnswerRecord) _then;

/// Create a copy of AnswerRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? selectedIndex = null,Object? isCorrect = null,Object? timeTaken = null,Object? usedHint = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as int,usedHint: null == usedHint ? _self.usedHint : usedHint // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AnswerRecord].
extension AnswerRecordPatterns on AnswerRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnswerRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnswerRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnswerRecord value)  $default,){
final _that = this;
switch (_that) {
case _AnswerRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnswerRecord value)?  $default,){
final _that = this;
switch (_that) {
case _AnswerRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String questionId,  int selectedIndex,  bool isCorrect,  int timeTaken,  bool usedHint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnswerRecord() when $default != null:
return $default(_that.questionId,_that.selectedIndex,_that.isCorrect,_that.timeTaken,_that.usedHint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String questionId,  int selectedIndex,  bool isCorrect,  int timeTaken,  bool usedHint)  $default,) {final _that = this;
switch (_that) {
case _AnswerRecord():
return $default(_that.questionId,_that.selectedIndex,_that.isCorrect,_that.timeTaken,_that.usedHint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String questionId,  int selectedIndex,  bool isCorrect,  int timeTaken,  bool usedHint)?  $default,) {final _that = this;
switch (_that) {
case _AnswerRecord() when $default != null:
return $default(_that.questionId,_that.selectedIndex,_that.isCorrect,_that.timeTaken,_that.usedHint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnswerRecord implements AnswerRecord {
  const _AnswerRecord({required this.questionId, required this.selectedIndex, required this.isCorrect, required this.timeTaken, this.usedHint = false});
  factory _AnswerRecord.fromJson(Map<String, dynamic> json) => _$AnswerRecordFromJson(json);

@override final  String questionId;
@override final  int selectedIndex;
@override final  bool isCorrect;
@override final  int timeTaken;
@override@JsonKey() final  bool usedHint;

/// Create a copy of AnswerRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswerRecordCopyWith<_AnswerRecord> get copyWith => __$AnswerRecordCopyWithImpl<_AnswerRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswerRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnswerRecord&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeTaken, timeTaken) || other.timeTaken == timeTaken)&&(identical(other.usedHint, usedHint) || other.usedHint == usedHint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,selectedIndex,isCorrect,timeTaken,usedHint);

@override
String toString() {
  return 'AnswerRecord(questionId: $questionId, selectedIndex: $selectedIndex, isCorrect: $isCorrect, timeTaken: $timeTaken, usedHint: $usedHint)';
}


}

/// @nodoc
abstract mixin class _$AnswerRecordCopyWith<$Res> implements $AnswerRecordCopyWith<$Res> {
  factory _$AnswerRecordCopyWith(_AnswerRecord value, $Res Function(_AnswerRecord) _then) = __$AnswerRecordCopyWithImpl;
@override @useResult
$Res call({
 String questionId, int selectedIndex, bool isCorrect, int timeTaken, bool usedHint
});




}
/// @nodoc
class __$AnswerRecordCopyWithImpl<$Res>
    implements _$AnswerRecordCopyWith<$Res> {
  __$AnswerRecordCopyWithImpl(this._self, this._then);

  final _AnswerRecord _self;
  final $Res Function(_AnswerRecord) _then;

/// Create a copy of AnswerRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? selectedIndex = null,Object? isCorrect = null,Object? timeTaken = null,Object? usedHint = null,}) {
  return _then(_AnswerRecord(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeTaken: null == timeTaken ? _self.timeTaken : timeTaken // ignore: cast_nullable_to_non_nullable
as int,usedHint: null == usedHint ? _self.usedHint : usedHint // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
