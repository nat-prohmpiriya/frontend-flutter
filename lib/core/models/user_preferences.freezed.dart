// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPreferences {

 FontSize get fontSize; bool get darkMode; bool get notifications; bool get soundEffects; String get appLanguage;
/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<UserPreferences> get copyWith => _$UserPreferencesCopyWithImpl<UserPreferences>(this as UserPreferences, _$identity);

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferences&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.soundEffects, soundEffects) || other.soundEffects == soundEffects)&&(identical(other.appLanguage, appLanguage) || other.appLanguage == appLanguage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fontSize,darkMode,notifications,soundEffects,appLanguage);

@override
String toString() {
  return 'UserPreferences(fontSize: $fontSize, darkMode: $darkMode, notifications: $notifications, soundEffects: $soundEffects, appLanguage: $appLanguage)';
}


}

/// @nodoc
abstract mixin class $UserPreferencesCopyWith<$Res>  {
  factory $UserPreferencesCopyWith(UserPreferences value, $Res Function(UserPreferences) _then) = _$UserPreferencesCopyWithImpl;
@useResult
$Res call({
 FontSize fontSize, bool darkMode, bool notifications, bool soundEffects, String appLanguage
});




}
/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._self, this._then);

  final UserPreferences _self;
  final $Res Function(UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fontSize = null,Object? darkMode = null,Object? notifications = null,Object? soundEffects = null,Object? appLanguage = null,}) {
  return _then(_self.copyWith(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as FontSize,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as bool,soundEffects: null == soundEffects ? _self.soundEffects : soundEffects // ignore: cast_nullable_to_non_nullable
as bool,appLanguage: null == appLanguage ? _self.appLanguage : appLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreferences].
extension UserPreferencesPatterns on UserPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferences value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FontSize fontSize,  bool darkMode,  bool notifications,  bool soundEffects,  String appLanguage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.fontSize,_that.darkMode,_that.notifications,_that.soundEffects,_that.appLanguage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FontSize fontSize,  bool darkMode,  bool notifications,  bool soundEffects,  String appLanguage)  $default,) {final _that = this;
switch (_that) {
case _UserPreferences():
return $default(_that.fontSize,_that.darkMode,_that.notifications,_that.soundEffects,_that.appLanguage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FontSize fontSize,  bool darkMode,  bool notifications,  bool soundEffects,  String appLanguage)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.fontSize,_that.darkMode,_that.notifications,_that.soundEffects,_that.appLanguage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPreferences implements UserPreferences {
  const _UserPreferences({this.fontSize = FontSize.medium, this.darkMode = false, this.notifications = true, this.soundEffects = true, this.appLanguage = 'th'});
  factory _UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);

@override@JsonKey() final  FontSize fontSize;
@override@JsonKey() final  bool darkMode;
@override@JsonKey() final  bool notifications;
@override@JsonKey() final  bool soundEffects;
@override@JsonKey() final  String appLanguage;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferencesCopyWith<_UserPreferences> get copyWith => __$UserPreferencesCopyWithImpl<_UserPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferences&&(identical(other.fontSize, fontSize) || other.fontSize == fontSize)&&(identical(other.darkMode, darkMode) || other.darkMode == darkMode)&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.soundEffects, soundEffects) || other.soundEffects == soundEffects)&&(identical(other.appLanguage, appLanguage) || other.appLanguage == appLanguage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fontSize,darkMode,notifications,soundEffects,appLanguage);

@override
String toString() {
  return 'UserPreferences(fontSize: $fontSize, darkMode: $darkMode, notifications: $notifications, soundEffects: $soundEffects, appLanguage: $appLanguage)';
}


}

/// @nodoc
abstract mixin class _$UserPreferencesCopyWith<$Res> implements $UserPreferencesCopyWith<$Res> {
  factory _$UserPreferencesCopyWith(_UserPreferences value, $Res Function(_UserPreferences) _then) = __$UserPreferencesCopyWithImpl;
@override @useResult
$Res call({
 FontSize fontSize, bool darkMode, bool notifications, bool soundEffects, String appLanguage
});




}
/// @nodoc
class __$UserPreferencesCopyWithImpl<$Res>
    implements _$UserPreferencesCopyWith<$Res> {
  __$UserPreferencesCopyWithImpl(this._self, this._then);

  final _UserPreferences _self;
  final $Res Function(_UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fontSize = null,Object? darkMode = null,Object? notifications = null,Object? soundEffects = null,Object? appLanguage = null,}) {
  return _then(_UserPreferences(
fontSize: null == fontSize ? _self.fontSize : fontSize // ignore: cast_nullable_to_non_nullable
as FontSize,darkMode: null == darkMode ? _self.darkMode : darkMode // ignore: cast_nullable_to_non_nullable
as bool,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as bool,soundEffects: null == soundEffects ? _self.soundEffects : soundEffects // ignore: cast_nullable_to_non_nullable
as bool,appLanguage: null == appLanguage ? _self.appLanguage : appLanguage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
