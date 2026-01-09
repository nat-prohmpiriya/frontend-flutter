// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Subscription {

 SubscriptionType get type; bool get autoRenew;
/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<Subscription> get copyWith => _$SubscriptionCopyWithImpl<Subscription>(this as Subscription, _$identity);

  /// Serializes this Subscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subscription&&(identical(other.type, type) || other.type == type)&&(identical(other.autoRenew, autoRenew) || other.autoRenew == autoRenew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,autoRenew);

@override
String toString() {
  return 'Subscription(type: $type, autoRenew: $autoRenew)';
}


}

/// @nodoc
abstract mixin class $SubscriptionCopyWith<$Res>  {
  factory $SubscriptionCopyWith(Subscription value, $Res Function(Subscription) _then) = _$SubscriptionCopyWithImpl;
@useResult
$Res call({
 SubscriptionType type, bool autoRenew
});




}
/// @nodoc
class _$SubscriptionCopyWithImpl<$Res>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._self, this._then);

  final Subscription _self;
  final $Res Function(Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? autoRenew = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SubscriptionType,autoRenew: null == autoRenew ? _self.autoRenew : autoRenew // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Subscription].
extension SubscriptionPatterns on Subscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subscription value)  $default,){
final _that = this;
switch (_that) {
case _Subscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subscription value)?  $default,){
final _that = this;
switch (_that) {
case _Subscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SubscriptionType type,  bool autoRenew)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.type,_that.autoRenew);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SubscriptionType type,  bool autoRenew)  $default,) {final _that = this;
switch (_that) {
case _Subscription():
return $default(_that.type,_that.autoRenew);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SubscriptionType type,  bool autoRenew)?  $default,) {final _that = this;
switch (_that) {
case _Subscription() when $default != null:
return $default(_that.type,_that.autoRenew);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Subscription implements Subscription {
  const _Subscription({this.type = SubscriptionType.free, this.autoRenew = false});
  factory _Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);

@override@JsonKey() final  SubscriptionType type;
@override@JsonKey() final  bool autoRenew;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionCopyWith<_Subscription> get copyWith => __$SubscriptionCopyWithImpl<_Subscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subscription&&(identical(other.type, type) || other.type == type)&&(identical(other.autoRenew, autoRenew) || other.autoRenew == autoRenew));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,autoRenew);

@override
String toString() {
  return 'Subscription(type: $type, autoRenew: $autoRenew)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionCopyWith<$Res> implements $SubscriptionCopyWith<$Res> {
  factory _$SubscriptionCopyWith(_Subscription value, $Res Function(_Subscription) _then) = __$SubscriptionCopyWithImpl;
@override @useResult
$Res call({
 SubscriptionType type, bool autoRenew
});




}
/// @nodoc
class __$SubscriptionCopyWithImpl<$Res>
    implements _$SubscriptionCopyWith<$Res> {
  __$SubscriptionCopyWithImpl(this._self, this._then);

  final _Subscription _self;
  final $Res Function(_Subscription) _then;

/// Create a copy of Subscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? autoRenew = null,}) {
  return _then(_Subscription(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SubscriptionType,autoRenew: null == autoRenew ? _self.autoRenew : autoRenew // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$User {

 String get id; String get email; String get displayName; String? get photoURL; AuthProvider get provider; String get nativeLanguage; List<String> get learningLanguages; UserLevel get level; Subscription get subscription; int get coins; int get streakDays; DateTime? get lastActiveDate; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoURL, photoURL) || other.photoURL == photoURL)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.nativeLanguage, nativeLanguage) || other.nativeLanguage == nativeLanguage)&&const DeepCollectionEquality().equals(other.learningLanguages, learningLanguages)&&(identical(other.level, level) || other.level == level)&&(identical(other.subscription, subscription) || other.subscription == subscription)&&(identical(other.coins, coins) || other.coins == coins)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.lastActiveDate, lastActiveDate) || other.lastActiveDate == lastActiveDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,photoURL,provider,nativeLanguage,const DeepCollectionEquality().hash(learningLanguages),level,subscription,coins,streakDays,lastActiveDate,createdAt,updatedAt);

@override
String toString() {
  return 'User(id: $id, email: $email, displayName: $displayName, photoURL: $photoURL, provider: $provider, nativeLanguage: $nativeLanguage, learningLanguages: $learningLanguages, level: $level, subscription: $subscription, coins: $coins, streakDays: $streakDays, lastActiveDate: $lastActiveDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String email, String displayName, String? photoURL, AuthProvider provider, String nativeLanguage, List<String> learningLanguages, UserLevel level, Subscription subscription, int coins, int streakDays, DateTime? lastActiveDate, DateTime? createdAt, DateTime? updatedAt
});


$SubscriptionCopyWith<$Res> get subscription;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? displayName = null,Object? photoURL = freezed,Object? provider = null,Object? nativeLanguage = null,Object? learningLanguages = null,Object? level = null,Object? subscription = null,Object? coins = null,Object? streakDays = null,Object? lastActiveDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,photoURL: freezed == photoURL ? _self.photoURL : photoURL // ignore: cast_nullable_to_non_nullable
as String?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AuthProvider,nativeLanguage: null == nativeLanguage ? _self.nativeLanguage : nativeLanguage // ignore: cast_nullable_to_non_nullable
as String,learningLanguages: null == learningLanguages ? _self.learningLanguages : learningLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as UserLevel,subscription: null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as Subscription,coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,lastActiveDate: freezed == lastActiveDate ? _self.lastActiveDate : lastActiveDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<$Res> get subscription {
  
  return $SubscriptionCopyWith<$Res>(_self.subscription, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String displayName,  String? photoURL,  AuthProvider provider,  String nativeLanguage,  List<String> learningLanguages,  UserLevel level,  Subscription subscription,  int coins,  int streakDays,  DateTime? lastActiveDate,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.photoURL,_that.provider,_that.nativeLanguage,_that.learningLanguages,_that.level,_that.subscription,_that.coins,_that.streakDays,_that.lastActiveDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String displayName,  String? photoURL,  AuthProvider provider,  String nativeLanguage,  List<String> learningLanguages,  UserLevel level,  Subscription subscription,  int coins,  int streakDays,  DateTime? lastActiveDate,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.email,_that.displayName,_that.photoURL,_that.provider,_that.nativeLanguage,_that.learningLanguages,_that.level,_that.subscription,_that.coins,_that.streakDays,_that.lastActiveDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String displayName,  String? photoURL,  AuthProvider provider,  String nativeLanguage,  List<String> learningLanguages,  UserLevel level,  Subscription subscription,  int coins,  int streakDays,  DateTime? lastActiveDate,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.photoURL,_that.provider,_that.nativeLanguage,_that.learningLanguages,_that.level,_that.subscription,_that.coins,_that.streakDays,_that.lastActiveDate,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.email, required this.displayName, this.photoURL, this.provider = AuthProvider.google, this.nativeLanguage = 'Thai', final  List<String> learningLanguages = const [], this.level = UserLevel.A1, this.subscription = const Subscription(), this.coins = 0, this.streakDays = 0, this.lastActiveDate, this.createdAt, this.updatedAt}): _learningLanguages = learningLanguages;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String email;
@override final  String displayName;
@override final  String? photoURL;
@override@JsonKey() final  AuthProvider provider;
@override@JsonKey() final  String nativeLanguage;
 final  List<String> _learningLanguages;
@override@JsonKey() List<String> get learningLanguages {
  if (_learningLanguages is EqualUnmodifiableListView) return _learningLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_learningLanguages);
}

@override@JsonKey() final  UserLevel level;
@override@JsonKey() final  Subscription subscription;
@override@JsonKey() final  int coins;
@override@JsonKey() final  int streakDays;
@override final  DateTime? lastActiveDate;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoURL, photoURL) || other.photoURL == photoURL)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.nativeLanguage, nativeLanguage) || other.nativeLanguage == nativeLanguage)&&const DeepCollectionEquality().equals(other._learningLanguages, _learningLanguages)&&(identical(other.level, level) || other.level == level)&&(identical(other.subscription, subscription) || other.subscription == subscription)&&(identical(other.coins, coins) || other.coins == coins)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.lastActiveDate, lastActiveDate) || other.lastActiveDate == lastActiveDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,photoURL,provider,nativeLanguage,const DeepCollectionEquality().hash(_learningLanguages),level,subscription,coins,streakDays,lastActiveDate,createdAt,updatedAt);

@override
String toString() {
  return 'User(id: $id, email: $email, displayName: $displayName, photoURL: $photoURL, provider: $provider, nativeLanguage: $nativeLanguage, learningLanguages: $learningLanguages, level: $level, subscription: $subscription, coins: $coins, streakDays: $streakDays, lastActiveDate: $lastActiveDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String displayName, String? photoURL, AuthProvider provider, String nativeLanguage, List<String> learningLanguages, UserLevel level, Subscription subscription, int coins, int streakDays, DateTime? lastActiveDate, DateTime? createdAt, DateTime? updatedAt
});


@override $SubscriptionCopyWith<$Res> get subscription;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? displayName = null,Object? photoURL = freezed,Object? provider = null,Object? nativeLanguage = null,Object? learningLanguages = null,Object? level = null,Object? subscription = null,Object? coins = null,Object? streakDays = null,Object? lastActiveDate = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,photoURL: freezed == photoURL ? _self.photoURL : photoURL // ignore: cast_nullable_to_non_nullable
as String?,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AuthProvider,nativeLanguage: null == nativeLanguage ? _self.nativeLanguage : nativeLanguage // ignore: cast_nullable_to_non_nullable
as String,learningLanguages: null == learningLanguages ? _self._learningLanguages : learningLanguages // ignore: cast_nullable_to_non_nullable
as List<String>,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as UserLevel,subscription: null == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as Subscription,coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,lastActiveDate: freezed == lastActiveDate ? _self.lastActiveDate : lastActiveDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionCopyWith<$Res> get subscription {
  
  return $SubscriptionCopyWith<$Res>(_self.subscription, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}
}

// dart format on
