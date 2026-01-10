// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_settings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioSettingsState {

 double get speed; String get accent;
/// Create a copy of AudioSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioSettingsStateCopyWith<AudioSettingsState> get copyWith => _$AudioSettingsStateCopyWithImpl<AudioSettingsState>(this as AudioSettingsState, _$identity);

  /// Serializes this AudioSettingsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioSettingsState&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.accent, accent) || other.accent == accent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speed,accent);

@override
String toString() {
  return 'AudioSettingsState(speed: $speed, accent: $accent)';
}


}

/// @nodoc
abstract mixin class $AudioSettingsStateCopyWith<$Res>  {
  factory $AudioSettingsStateCopyWith(AudioSettingsState value, $Res Function(AudioSettingsState) _then) = _$AudioSettingsStateCopyWithImpl;
@useResult
$Res call({
 double speed, String accent
});




}
/// @nodoc
class _$AudioSettingsStateCopyWithImpl<$Res>
    implements $AudioSettingsStateCopyWith<$Res> {
  _$AudioSettingsStateCopyWithImpl(this._self, this._then);

  final AudioSettingsState _self;
  final $Res Function(AudioSettingsState) _then;

/// Create a copy of AudioSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? speed = null,Object? accent = null,}) {
  return _then(_self.copyWith(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,accent: null == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioSettingsState].
extension AudioSettingsStatePatterns on AudioSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _AudioSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _AudioSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double speed,  String accent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioSettingsState() when $default != null:
return $default(_that.speed,_that.accent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double speed,  String accent)  $default,) {final _that = this;
switch (_that) {
case _AudioSettingsState():
return $default(_that.speed,_that.accent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double speed,  String accent)?  $default,) {final _that = this;
switch (_that) {
case _AudioSettingsState() when $default != null:
return $default(_that.speed,_that.accent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioSettingsState implements AudioSettingsState {
  const _AudioSettingsState({this.speed = 1.0, this.accent = 'us'});
  factory _AudioSettingsState.fromJson(Map<String, dynamic> json) => _$AudioSettingsStateFromJson(json);

@override@JsonKey() final  double speed;
@override@JsonKey() final  String accent;

/// Create a copy of AudioSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioSettingsStateCopyWith<_AudioSettingsState> get copyWith => __$AudioSettingsStateCopyWithImpl<_AudioSettingsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioSettingsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioSettingsState&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.accent, accent) || other.accent == accent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,speed,accent);

@override
String toString() {
  return 'AudioSettingsState(speed: $speed, accent: $accent)';
}


}

/// @nodoc
abstract mixin class _$AudioSettingsStateCopyWith<$Res> implements $AudioSettingsStateCopyWith<$Res> {
  factory _$AudioSettingsStateCopyWith(_AudioSettingsState value, $Res Function(_AudioSettingsState) _then) = __$AudioSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 double speed, String accent
});




}
/// @nodoc
class __$AudioSettingsStateCopyWithImpl<$Res>
    implements _$AudioSettingsStateCopyWith<$Res> {
  __$AudioSettingsStateCopyWithImpl(this._self, this._then);

  final _AudioSettingsState _self;
  final $Res Function(_AudioSettingsState) _then;

/// Create a copy of AudioSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? speed = null,Object? accent = null,}) {
  return _then(_AudioSettingsState(
speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,accent: null == accent ? _self.accent : accent // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
