// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {

 GameType get gameType; List<Question> get questions; int get currentQuestionIndex; List<AnswerRecord> get answers; bool get isHintUsed; List<int> get eliminatedOptions; bool get isAnswered; bool get isGameOver; int get timeLeft; bool get isTimerRunning; int? get selectedAnswerIndex; GameResult? get result;// Word match specific
 Map<String, String> get matchedPairs; String? get selectedWord; int get wrongAttempts; List<String> get shuffledDefinitions;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.gameType, gameType) || other.gameType == gameType)&&const DeepCollectionEquality().equals(other.questions, questions)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&const DeepCollectionEquality().equals(other.answers, answers)&&(identical(other.isHintUsed, isHintUsed) || other.isHintUsed == isHintUsed)&&const DeepCollectionEquality().equals(other.eliminatedOptions, eliminatedOptions)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&(identical(other.isGameOver, isGameOver) || other.isGameOver == isGameOver)&&(identical(other.timeLeft, timeLeft) || other.timeLeft == timeLeft)&&(identical(other.isTimerRunning, isTimerRunning) || other.isTimerRunning == isTimerRunning)&&(identical(other.selectedAnswerIndex, selectedAnswerIndex) || other.selectedAnswerIndex == selectedAnswerIndex)&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other.matchedPairs, matchedPairs)&&(identical(other.selectedWord, selectedWord) || other.selectedWord == selectedWord)&&(identical(other.wrongAttempts, wrongAttempts) || other.wrongAttempts == wrongAttempts)&&const DeepCollectionEquality().equals(other.shuffledDefinitions, shuffledDefinitions));
}


@override
int get hashCode => Object.hash(runtimeType,gameType,const DeepCollectionEquality().hash(questions),currentQuestionIndex,const DeepCollectionEquality().hash(answers),isHintUsed,const DeepCollectionEquality().hash(eliminatedOptions),isAnswered,isGameOver,timeLeft,isTimerRunning,selectedAnswerIndex,result,const DeepCollectionEquality().hash(matchedPairs),selectedWord,wrongAttempts,const DeepCollectionEquality().hash(shuffledDefinitions));

@override
String toString() {
  return 'GameState(gameType: $gameType, questions: $questions, currentQuestionIndex: $currentQuestionIndex, answers: $answers, isHintUsed: $isHintUsed, eliminatedOptions: $eliminatedOptions, isAnswered: $isAnswered, isGameOver: $isGameOver, timeLeft: $timeLeft, isTimerRunning: $isTimerRunning, selectedAnswerIndex: $selectedAnswerIndex, result: $result, matchedPairs: $matchedPairs, selectedWord: $selectedWord, wrongAttempts: $wrongAttempts, shuffledDefinitions: $shuffledDefinitions)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 GameType gameType, List<Question> questions, int currentQuestionIndex, List<AnswerRecord> answers, bool isHintUsed, List<int> eliminatedOptions, bool isAnswered, bool isGameOver, int timeLeft, bool isTimerRunning, int? selectedAnswerIndex, GameResult? result, Map<String, String> matchedPairs, String? selectedWord, int wrongAttempts, List<String> shuffledDefinitions
});


$GameResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gameType = null,Object? questions = null,Object? currentQuestionIndex = null,Object? answers = null,Object? isHintUsed = null,Object? eliminatedOptions = null,Object? isAnswered = null,Object? isGameOver = null,Object? timeLeft = null,Object? isTimerRunning = null,Object? selectedAnswerIndex = freezed,Object? result = freezed,Object? matchedPairs = null,Object? selectedWord = freezed,Object? wrongAttempts = null,Object? shuffledDefinitions = null,}) {
  return _then(_self.copyWith(
gameType: null == gameType ? _self.gameType : gameType // ignore: cast_nullable_to_non_nullable
as GameType,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<AnswerRecord>,isHintUsed: null == isHintUsed ? _self.isHintUsed : isHintUsed // ignore: cast_nullable_to_non_nullable
as bool,eliminatedOptions: null == eliminatedOptions ? _self.eliminatedOptions : eliminatedOptions // ignore: cast_nullable_to_non_nullable
as List<int>,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,isGameOver: null == isGameOver ? _self.isGameOver : isGameOver // ignore: cast_nullable_to_non_nullable
as bool,timeLeft: null == timeLeft ? _self.timeLeft : timeLeft // ignore: cast_nullable_to_non_nullable
as int,isTimerRunning: null == isTimerRunning ? _self.isTimerRunning : isTimerRunning // ignore: cast_nullable_to_non_nullable
as bool,selectedAnswerIndex: freezed == selectedAnswerIndex ? _self.selectedAnswerIndex : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
as int?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult?,matchedPairs: null == matchedPairs ? _self.matchedPairs : matchedPairs // ignore: cast_nullable_to_non_nullable
as Map<String, String>,selectedWord: freezed == selectedWord ? _self.selectedWord : selectedWord // ignore: cast_nullable_to_non_nullable
as String?,wrongAttempts: null == wrongAttempts ? _self.wrongAttempts : wrongAttempts // ignore: cast_nullable_to_non_nullable
as int,shuffledDefinitions: null == shuffledDefinitions ? _self.shuffledDefinitions : shuffledDefinitions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $GameResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GameType gameType,  List<Question> questions,  int currentQuestionIndex,  List<AnswerRecord> answers,  bool isHintUsed,  List<int> eliminatedOptions,  bool isAnswered,  bool isGameOver,  int timeLeft,  bool isTimerRunning,  int? selectedAnswerIndex,  GameResult? result,  Map<String, String> matchedPairs,  String? selectedWord,  int wrongAttempts,  List<String> shuffledDefinitions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.gameType,_that.questions,_that.currentQuestionIndex,_that.answers,_that.isHintUsed,_that.eliminatedOptions,_that.isAnswered,_that.isGameOver,_that.timeLeft,_that.isTimerRunning,_that.selectedAnswerIndex,_that.result,_that.matchedPairs,_that.selectedWord,_that.wrongAttempts,_that.shuffledDefinitions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GameType gameType,  List<Question> questions,  int currentQuestionIndex,  List<AnswerRecord> answers,  bool isHintUsed,  List<int> eliminatedOptions,  bool isAnswered,  bool isGameOver,  int timeLeft,  bool isTimerRunning,  int? selectedAnswerIndex,  GameResult? result,  Map<String, String> matchedPairs,  String? selectedWord,  int wrongAttempts,  List<String> shuffledDefinitions)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.gameType,_that.questions,_that.currentQuestionIndex,_that.answers,_that.isHintUsed,_that.eliminatedOptions,_that.isAnswered,_that.isGameOver,_that.timeLeft,_that.isTimerRunning,_that.selectedAnswerIndex,_that.result,_that.matchedPairs,_that.selectedWord,_that.wrongAttempts,_that.shuffledDefinitions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GameType gameType,  List<Question> questions,  int currentQuestionIndex,  List<AnswerRecord> answers,  bool isHintUsed,  List<int> eliminatedOptions,  bool isAnswered,  bool isGameOver,  int timeLeft,  bool isTimerRunning,  int? selectedAnswerIndex,  GameResult? result,  Map<String, String> matchedPairs,  String? selectedWord,  int wrongAttempts,  List<String> shuffledDefinitions)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.gameType,_that.questions,_that.currentQuestionIndex,_that.answers,_that.isHintUsed,_that.eliminatedOptions,_that.isAnswered,_that.isGameOver,_that.timeLeft,_that.isTimerRunning,_that.selectedAnswerIndex,_that.result,_that.matchedPairs,_that.selectedWord,_that.wrongAttempts,_that.shuffledDefinitions);case _:
  return null;

}
}

}

/// @nodoc


class _GameState implements GameState {
  const _GameState({required this.gameType, required final  List<Question> questions, this.currentQuestionIndex = 0, final  List<AnswerRecord> answers = const [], this.isHintUsed = false, final  List<int> eliminatedOptions = const [], this.isAnswered = false, this.isGameOver = false, this.timeLeft = 10, this.isTimerRunning = false, this.selectedAnswerIndex, this.result, final  Map<String, String> matchedPairs = const {}, this.selectedWord, this.wrongAttempts = 0, final  List<String> shuffledDefinitions = const []}): _questions = questions,_answers = answers,_eliminatedOptions = eliminatedOptions,_matchedPairs = matchedPairs,_shuffledDefinitions = shuffledDefinitions;
  

@override final  GameType gameType;
 final  List<Question> _questions;
@override List<Question> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}

@override@JsonKey() final  int currentQuestionIndex;
 final  List<AnswerRecord> _answers;
@override@JsonKey() List<AnswerRecord> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override@JsonKey() final  bool isHintUsed;
 final  List<int> _eliminatedOptions;
@override@JsonKey() List<int> get eliminatedOptions {
  if (_eliminatedOptions is EqualUnmodifiableListView) return _eliminatedOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_eliminatedOptions);
}

@override@JsonKey() final  bool isAnswered;
@override@JsonKey() final  bool isGameOver;
@override@JsonKey() final  int timeLeft;
@override@JsonKey() final  bool isTimerRunning;
@override final  int? selectedAnswerIndex;
@override final  GameResult? result;
// Word match specific
 final  Map<String, String> _matchedPairs;
// Word match specific
@override@JsonKey() Map<String, String> get matchedPairs {
  if (_matchedPairs is EqualUnmodifiableMapView) return _matchedPairs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_matchedPairs);
}

@override final  String? selectedWord;
@override@JsonKey() final  int wrongAttempts;
 final  List<String> _shuffledDefinitions;
@override@JsonKey() List<String> get shuffledDefinitions {
  if (_shuffledDefinitions is EqualUnmodifiableListView) return _shuffledDefinitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shuffledDefinitions);
}


/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.gameType, gameType) || other.gameType == gameType)&&const DeepCollectionEquality().equals(other._questions, _questions)&&(identical(other.currentQuestionIndex, currentQuestionIndex) || other.currentQuestionIndex == currentQuestionIndex)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.isHintUsed, isHintUsed) || other.isHintUsed == isHintUsed)&&const DeepCollectionEquality().equals(other._eliminatedOptions, _eliminatedOptions)&&(identical(other.isAnswered, isAnswered) || other.isAnswered == isAnswered)&&(identical(other.isGameOver, isGameOver) || other.isGameOver == isGameOver)&&(identical(other.timeLeft, timeLeft) || other.timeLeft == timeLeft)&&(identical(other.isTimerRunning, isTimerRunning) || other.isTimerRunning == isTimerRunning)&&(identical(other.selectedAnswerIndex, selectedAnswerIndex) || other.selectedAnswerIndex == selectedAnswerIndex)&&(identical(other.result, result) || other.result == result)&&const DeepCollectionEquality().equals(other._matchedPairs, _matchedPairs)&&(identical(other.selectedWord, selectedWord) || other.selectedWord == selectedWord)&&(identical(other.wrongAttempts, wrongAttempts) || other.wrongAttempts == wrongAttempts)&&const DeepCollectionEquality().equals(other._shuffledDefinitions, _shuffledDefinitions));
}


@override
int get hashCode => Object.hash(runtimeType,gameType,const DeepCollectionEquality().hash(_questions),currentQuestionIndex,const DeepCollectionEquality().hash(_answers),isHintUsed,const DeepCollectionEquality().hash(_eliminatedOptions),isAnswered,isGameOver,timeLeft,isTimerRunning,selectedAnswerIndex,result,const DeepCollectionEquality().hash(_matchedPairs),selectedWord,wrongAttempts,const DeepCollectionEquality().hash(_shuffledDefinitions));

@override
String toString() {
  return 'GameState(gameType: $gameType, questions: $questions, currentQuestionIndex: $currentQuestionIndex, answers: $answers, isHintUsed: $isHintUsed, eliminatedOptions: $eliminatedOptions, isAnswered: $isAnswered, isGameOver: $isGameOver, timeLeft: $timeLeft, isTimerRunning: $isTimerRunning, selectedAnswerIndex: $selectedAnswerIndex, result: $result, matchedPairs: $matchedPairs, selectedWord: $selectedWord, wrongAttempts: $wrongAttempts, shuffledDefinitions: $shuffledDefinitions)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 GameType gameType, List<Question> questions, int currentQuestionIndex, List<AnswerRecord> answers, bool isHintUsed, List<int> eliminatedOptions, bool isAnswered, bool isGameOver, int timeLeft, bool isTimerRunning, int? selectedAnswerIndex, GameResult? result, Map<String, String> matchedPairs, String? selectedWord, int wrongAttempts, List<String> shuffledDefinitions
});


@override $GameResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gameType = null,Object? questions = null,Object? currentQuestionIndex = null,Object? answers = null,Object? isHintUsed = null,Object? eliminatedOptions = null,Object? isAnswered = null,Object? isGameOver = null,Object? timeLeft = null,Object? isTimerRunning = null,Object? selectedAnswerIndex = freezed,Object? result = freezed,Object? matchedPairs = null,Object? selectedWord = freezed,Object? wrongAttempts = null,Object? shuffledDefinitions = null,}) {
  return _then(_GameState(
gameType: null == gameType ? _self.gameType : gameType // ignore: cast_nullable_to_non_nullable
as GameType,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<Question>,currentQuestionIndex: null == currentQuestionIndex ? _self.currentQuestionIndex : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<AnswerRecord>,isHintUsed: null == isHintUsed ? _self.isHintUsed : isHintUsed // ignore: cast_nullable_to_non_nullable
as bool,eliminatedOptions: null == eliminatedOptions ? _self._eliminatedOptions : eliminatedOptions // ignore: cast_nullable_to_non_nullable
as List<int>,isAnswered: null == isAnswered ? _self.isAnswered : isAnswered // ignore: cast_nullable_to_non_nullable
as bool,isGameOver: null == isGameOver ? _self.isGameOver : isGameOver // ignore: cast_nullable_to_non_nullable
as bool,timeLeft: null == timeLeft ? _self.timeLeft : timeLeft // ignore: cast_nullable_to_non_nullable
as int,isTimerRunning: null == isTimerRunning ? _self.isTimerRunning : isTimerRunning // ignore: cast_nullable_to_non_nullable
as bool,selectedAnswerIndex: freezed == selectedAnswerIndex ? _self.selectedAnswerIndex : selectedAnswerIndex // ignore: cast_nullable_to_non_nullable
as int?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult?,matchedPairs: null == matchedPairs ? _self._matchedPairs : matchedPairs // ignore: cast_nullable_to_non_nullable
as Map<String, String>,selectedWord: freezed == selectedWord ? _self.selectedWord : selectedWord // ignore: cast_nullable_to_non_nullable
as String?,wrongAttempts: null == wrongAttempts ? _self.wrongAttempts : wrongAttempts // ignore: cast_nullable_to_non_nullable
as int,shuffledDefinitions: null == shuffledDefinitions ? _self._shuffledDefinitions : shuffledDefinitions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $GameResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
