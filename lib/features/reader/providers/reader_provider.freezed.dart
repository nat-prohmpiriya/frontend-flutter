// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reader_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReaderState {

 Story? get story; int get currentEpisode; int get currentPage; bool get isLoading; bool get isTranslationPanelOpen; bool get isVocabularyPanelOpen; bool get showOverlayControls; String? get selectedWord; String? get error;
/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReaderStateCopyWith<ReaderState> get copyWith => _$ReaderStateCopyWithImpl<ReaderState>(this as ReaderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReaderState&&(identical(other.story, story) || other.story == story)&&(identical(other.currentEpisode, currentEpisode) || other.currentEpisode == currentEpisode)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isTranslationPanelOpen, isTranslationPanelOpen) || other.isTranslationPanelOpen == isTranslationPanelOpen)&&(identical(other.isVocabularyPanelOpen, isVocabularyPanelOpen) || other.isVocabularyPanelOpen == isVocabularyPanelOpen)&&(identical(other.showOverlayControls, showOverlayControls) || other.showOverlayControls == showOverlayControls)&&(identical(other.selectedWord, selectedWord) || other.selectedWord == selectedWord)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,story,currentEpisode,currentPage,isLoading,isTranslationPanelOpen,isVocabularyPanelOpen,showOverlayControls,selectedWord,error);

@override
String toString() {
  return 'ReaderState(story: $story, currentEpisode: $currentEpisode, currentPage: $currentPage, isLoading: $isLoading, isTranslationPanelOpen: $isTranslationPanelOpen, isVocabularyPanelOpen: $isVocabularyPanelOpen, showOverlayControls: $showOverlayControls, selectedWord: $selectedWord, error: $error)';
}


}

/// @nodoc
abstract mixin class $ReaderStateCopyWith<$Res>  {
  factory $ReaderStateCopyWith(ReaderState value, $Res Function(ReaderState) _then) = _$ReaderStateCopyWithImpl;
@useResult
$Res call({
 Story? story, int currentEpisode, int currentPage, bool isLoading, bool isTranslationPanelOpen, bool isVocabularyPanelOpen, bool showOverlayControls, String? selectedWord, String? error
});


$StoryCopyWith<$Res>? get story;

}
/// @nodoc
class _$ReaderStateCopyWithImpl<$Res>
    implements $ReaderStateCopyWith<$Res> {
  _$ReaderStateCopyWithImpl(this._self, this._then);

  final ReaderState _self;
  final $Res Function(ReaderState) _then;

/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? story = freezed,Object? currentEpisode = null,Object? currentPage = null,Object? isLoading = null,Object? isTranslationPanelOpen = null,Object? isVocabularyPanelOpen = null,Object? showOverlayControls = null,Object? selectedWord = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
story: freezed == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as Story?,currentEpisode: null == currentEpisode ? _self.currentEpisode : currentEpisode // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isTranslationPanelOpen: null == isTranslationPanelOpen ? _self.isTranslationPanelOpen : isTranslationPanelOpen // ignore: cast_nullable_to_non_nullable
as bool,isVocabularyPanelOpen: null == isVocabularyPanelOpen ? _self.isVocabularyPanelOpen : isVocabularyPanelOpen // ignore: cast_nullable_to_non_nullable
as bool,showOverlayControls: null == showOverlayControls ? _self.showOverlayControls : showOverlayControls // ignore: cast_nullable_to_non_nullable
as bool,selectedWord: freezed == selectedWord ? _self.selectedWord : selectedWord // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryCopyWith<$Res>? get story {
    if (_self.story == null) {
    return null;
  }

  return $StoryCopyWith<$Res>(_self.story!, (value) {
    return _then(_self.copyWith(story: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReaderState].
extension ReaderStatePatterns on ReaderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReaderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReaderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReaderState value)  $default,){
final _that = this;
switch (_that) {
case _ReaderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReaderState value)?  $default,){
final _that = this;
switch (_that) {
case _ReaderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Story? story,  int currentEpisode,  int currentPage,  bool isLoading,  bool isTranslationPanelOpen,  bool isVocabularyPanelOpen,  bool showOverlayControls,  String? selectedWord,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReaderState() when $default != null:
return $default(_that.story,_that.currentEpisode,_that.currentPage,_that.isLoading,_that.isTranslationPanelOpen,_that.isVocabularyPanelOpen,_that.showOverlayControls,_that.selectedWord,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Story? story,  int currentEpisode,  int currentPage,  bool isLoading,  bool isTranslationPanelOpen,  bool isVocabularyPanelOpen,  bool showOverlayControls,  String? selectedWord,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ReaderState():
return $default(_that.story,_that.currentEpisode,_that.currentPage,_that.isLoading,_that.isTranslationPanelOpen,_that.isVocabularyPanelOpen,_that.showOverlayControls,_that.selectedWord,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Story? story,  int currentEpisode,  int currentPage,  bool isLoading,  bool isTranslationPanelOpen,  bool isVocabularyPanelOpen,  bool showOverlayControls,  String? selectedWord,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ReaderState() when $default != null:
return $default(_that.story,_that.currentEpisode,_that.currentPage,_that.isLoading,_that.isTranslationPanelOpen,_that.isVocabularyPanelOpen,_that.showOverlayControls,_that.selectedWord,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ReaderState implements ReaderState {
  const _ReaderState({this.story, this.currentEpisode = 1, this.currentPage = 1, this.isLoading = false, this.isTranslationPanelOpen = false, this.isVocabularyPanelOpen = false, this.showOverlayControls = true, this.selectedWord, this.error});
  

@override final  Story? story;
@override@JsonKey() final  int currentEpisode;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isTranslationPanelOpen;
@override@JsonKey() final  bool isVocabularyPanelOpen;
@override@JsonKey() final  bool showOverlayControls;
@override final  String? selectedWord;
@override final  String? error;

/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReaderStateCopyWith<_ReaderState> get copyWith => __$ReaderStateCopyWithImpl<_ReaderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReaderState&&(identical(other.story, story) || other.story == story)&&(identical(other.currentEpisode, currentEpisode) || other.currentEpisode == currentEpisode)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isTranslationPanelOpen, isTranslationPanelOpen) || other.isTranslationPanelOpen == isTranslationPanelOpen)&&(identical(other.isVocabularyPanelOpen, isVocabularyPanelOpen) || other.isVocabularyPanelOpen == isVocabularyPanelOpen)&&(identical(other.showOverlayControls, showOverlayControls) || other.showOverlayControls == showOverlayControls)&&(identical(other.selectedWord, selectedWord) || other.selectedWord == selectedWord)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,story,currentEpisode,currentPage,isLoading,isTranslationPanelOpen,isVocabularyPanelOpen,showOverlayControls,selectedWord,error);

@override
String toString() {
  return 'ReaderState(story: $story, currentEpisode: $currentEpisode, currentPage: $currentPage, isLoading: $isLoading, isTranslationPanelOpen: $isTranslationPanelOpen, isVocabularyPanelOpen: $isVocabularyPanelOpen, showOverlayControls: $showOverlayControls, selectedWord: $selectedWord, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ReaderStateCopyWith<$Res> implements $ReaderStateCopyWith<$Res> {
  factory _$ReaderStateCopyWith(_ReaderState value, $Res Function(_ReaderState) _then) = __$ReaderStateCopyWithImpl;
@override @useResult
$Res call({
 Story? story, int currentEpisode, int currentPage, bool isLoading, bool isTranslationPanelOpen, bool isVocabularyPanelOpen, bool showOverlayControls, String? selectedWord, String? error
});


@override $StoryCopyWith<$Res>? get story;

}
/// @nodoc
class __$ReaderStateCopyWithImpl<$Res>
    implements _$ReaderStateCopyWith<$Res> {
  __$ReaderStateCopyWithImpl(this._self, this._then);

  final _ReaderState _self;
  final $Res Function(_ReaderState) _then;

/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? story = freezed,Object? currentEpisode = null,Object? currentPage = null,Object? isLoading = null,Object? isTranslationPanelOpen = null,Object? isVocabularyPanelOpen = null,Object? showOverlayControls = null,Object? selectedWord = freezed,Object? error = freezed,}) {
  return _then(_ReaderState(
story: freezed == story ? _self.story : story // ignore: cast_nullable_to_non_nullable
as Story?,currentEpisode: null == currentEpisode ? _self.currentEpisode : currentEpisode // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isTranslationPanelOpen: null == isTranslationPanelOpen ? _self.isTranslationPanelOpen : isTranslationPanelOpen // ignore: cast_nullable_to_non_nullable
as bool,isVocabularyPanelOpen: null == isVocabularyPanelOpen ? _self.isVocabularyPanelOpen : isVocabularyPanelOpen // ignore: cast_nullable_to_non_nullable
as bool,showOverlayControls: null == showOverlayControls ? _self.showOverlayControls : showOverlayControls // ignore: cast_nullable_to_non_nullable
as bool,selectedWord: freezed == selectedWord ? _self.selectedWord : selectedWord // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ReaderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoryCopyWith<$Res>? get story {
    if (_self.story == null) {
    return null;
  }

  return $StoryCopyWith<$Res>(_self.story!, (value) {
    return _then(_self.copyWith(story: value));
  });
}
}

// dart format on
