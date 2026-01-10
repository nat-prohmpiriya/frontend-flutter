// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioState {

 bool get isPlaying; Duration get position; Duration get duration; double get speed; String get accent; String? get currentUrl; String? get error; bool get isLoading; bool get isBuffering;
/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioStateCopyWith<AudioState> get copyWith => _$AudioStateCopyWithImpl<AudioState>(this as AudioState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.accent, accent) || other.accent == accent)&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,position,duration,speed,accent,currentUrl,error,isLoading,isBuffering);

@override
String toString() {
  return 'AudioState(isPlaying: $isPlaying, position: $position, duration: $duration, speed: $speed, accent: $accent, currentUrl: $currentUrl, error: $error, isLoading: $isLoading, isBuffering: $isBuffering)';
}


}

/// @nodoc
abstract mixin class $AudioStateCopyWith<$Res>  {
  factory $AudioStateCopyWith(AudioState value, $Res Function(AudioState) _then) = _$AudioStateCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, Duration position, Duration duration, double speed, String accent, String? currentUrl, String? error, bool isLoading, bool isBuffering
});




}
/// @nodoc
class _$AudioStateCopyWithImpl<$Res>
    implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._self, this._then);

  final AudioState _self;
  final $Res Function(AudioState) _then;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPlaying = null,Object? position = null,Object? duration = null,Object? speed = null,Object? accent = null,Object? currentUrl = freezed,Object? error = freezed,Object? isLoading = null,Object? isBuffering = null,}) {
  return _then(_self.copyWith(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,accent: null == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as String,currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioState].
extension AudioStatePatterns on AudioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioState value)  $default,){
final _that = this;
switch (_that) {
case _AudioState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioState value)?  $default,){
final _that = this;
switch (_that) {
case _AudioState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPlaying,  Duration position,  Duration duration,  double speed,  String accent,  String? currentUrl,  String? error,  bool isLoading,  bool isBuffering)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioState() when $default != null:
return $default(_that.isPlaying,_that.position,_that.duration,_that.speed,_that.accent,_that.currentUrl,_that.error,_that.isLoading,_that.isBuffering);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPlaying,  Duration position,  Duration duration,  double speed,  String accent,  String? currentUrl,  String? error,  bool isLoading,  bool isBuffering)  $default,) {final _that = this;
switch (_that) {
case _AudioState():
return $default(_that.isPlaying,_that.position,_that.duration,_that.speed,_that.accent,_that.currentUrl,_that.error,_that.isLoading,_that.isBuffering);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPlaying,  Duration position,  Duration duration,  double speed,  String accent,  String? currentUrl,  String? error,  bool isLoading,  bool isBuffering)?  $default,) {final _that = this;
switch (_that) {
case _AudioState() when $default != null:
return $default(_that.isPlaying,_that.position,_that.duration,_that.speed,_that.accent,_that.currentUrl,_that.error,_that.isLoading,_that.isBuffering);case _:
  return null;

}
}

}

/// @nodoc


class _AudioState implements AudioState {
  const _AudioState({this.isPlaying = false, this.position = Duration.zero, this.duration = Duration.zero, this.speed = 1.0, this.accent = 'us', this.currentUrl, this.error, this.isLoading = false, this.isBuffering = false});
  

@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  Duration position;
@override@JsonKey() final  Duration duration;
@override@JsonKey() final  double speed;
@override@JsonKey() final  String accent;
@override final  String? currentUrl;
@override final  String? error;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isBuffering;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioStateCopyWith<_AudioState> get copyWith => __$AudioStateCopyWithImpl<_AudioState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.accent, accent) || other.accent == accent)&&(identical(other.currentUrl, currentUrl) || other.currentUrl == currentUrl)&&(identical(other.error, error) || other.error == error)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isBuffering, isBuffering) || other.isBuffering == isBuffering));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,position,duration,speed,accent,currentUrl,error,isLoading,isBuffering);

@override
String toString() {
  return 'AudioState(isPlaying: $isPlaying, position: $position, duration: $duration, speed: $speed, accent: $accent, currentUrl: $currentUrl, error: $error, isLoading: $isLoading, isBuffering: $isBuffering)';
}


}

/// @nodoc
abstract mixin class _$AudioStateCopyWith<$Res> implements $AudioStateCopyWith<$Res> {
  factory _$AudioStateCopyWith(_AudioState value, $Res Function(_AudioState) _then) = __$AudioStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPlaying, Duration position, Duration duration, double speed, String accent, String? currentUrl, String? error, bool isLoading, bool isBuffering
});




}
/// @nodoc
class __$AudioStateCopyWithImpl<$Res>
    implements _$AudioStateCopyWith<$Res> {
  __$AudioStateCopyWithImpl(this._self, this._then);

  final _AudioState _self;
  final $Res Function(_AudioState) _then;

/// Create a copy of AudioState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,Object? position = null,Object? duration = null,Object? speed = null,Object? accent = null,Object? currentUrl = freezed,Object? error = freezed,Object? isLoading = null,Object? isBuffering = null,}) {
  return _then(_AudioState(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,accent: null == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as String,currentUrl: freezed == currentUrl ? _self.currentUrl : currentUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isBuffering: null == isBuffering ? _self.isBuffering : isBuffering // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
