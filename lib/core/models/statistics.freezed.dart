// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyActivity {

 DateTime get date; int get pagesRead; int get minutesSpent; int get wordsLearned; int get quizzesTaken;
/// Create a copy of DailyActivity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyActivityCopyWith<DailyActivity> get copyWith => _$DailyActivityCopyWithImpl<DailyActivity>(this as DailyActivity, _$identity);

  /// Serializes this DailyActivity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyActivity&&(identical(other.date, date) || other.date == date)&&(identical(other.pagesRead, pagesRead) || other.pagesRead == pagesRead)&&(identical(other.minutesSpent, minutesSpent) || other.minutesSpent == minutesSpent)&&(identical(other.wordsLearned, wordsLearned) || other.wordsLearned == wordsLearned)&&(identical(other.quizzesTaken, quizzesTaken) || other.quizzesTaken == quizzesTaken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,pagesRead,minutesSpent,wordsLearned,quizzesTaken);

@override
String toString() {
  return 'DailyActivity(date: $date, pagesRead: $pagesRead, minutesSpent: $minutesSpent, wordsLearned: $wordsLearned, quizzesTaken: $quizzesTaken)';
}


}

/// @nodoc
abstract mixin class $DailyActivityCopyWith<$Res>  {
  factory $DailyActivityCopyWith(DailyActivity value, $Res Function(DailyActivity) _then) = _$DailyActivityCopyWithImpl;
@useResult
$Res call({
 DateTime date, int pagesRead, int minutesSpent, int wordsLearned, int quizzesTaken
});




}
/// @nodoc
class _$DailyActivityCopyWithImpl<$Res>
    implements $DailyActivityCopyWith<$Res> {
  _$DailyActivityCopyWithImpl(this._self, this._then);

  final DailyActivity _self;
  final $Res Function(DailyActivity) _then;

/// Create a copy of DailyActivity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? pagesRead = null,Object? minutesSpent = null,Object? wordsLearned = null,Object? quizzesTaken = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,pagesRead: null == pagesRead ? _self.pagesRead : pagesRead // ignore: cast_nullable_to_non_nullable
as int,minutesSpent: null == minutesSpent ? _self.minutesSpent : minutesSpent // ignore: cast_nullable_to_non_nullable
as int,wordsLearned: null == wordsLearned ? _self.wordsLearned : wordsLearned // ignore: cast_nullable_to_non_nullable
as int,quizzesTaken: null == quizzesTaken ? _self.quizzesTaken : quizzesTaken // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyActivity].
extension DailyActivityPatterns on DailyActivity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyActivity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyActivity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyActivity value)  $default,){
final _that = this;
switch (_that) {
case _DailyActivity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyActivity value)?  $default,){
final _that = this;
switch (_that) {
case _DailyActivity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int pagesRead,  int minutesSpent,  int wordsLearned,  int quizzesTaken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyActivity() when $default != null:
return $default(_that.date,_that.pagesRead,_that.minutesSpent,_that.wordsLearned,_that.quizzesTaken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int pagesRead,  int minutesSpent,  int wordsLearned,  int quizzesTaken)  $default,) {final _that = this;
switch (_that) {
case _DailyActivity():
return $default(_that.date,_that.pagesRead,_that.minutesSpent,_that.wordsLearned,_that.quizzesTaken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int pagesRead,  int minutesSpent,  int wordsLearned,  int quizzesTaken)?  $default,) {final _that = this;
switch (_that) {
case _DailyActivity() when $default != null:
return $default(_that.date,_that.pagesRead,_that.minutesSpent,_that.wordsLearned,_that.quizzesTaken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyActivity implements DailyActivity {
  const _DailyActivity({required this.date, this.pagesRead = 0, this.minutesSpent = 0, this.wordsLearned = 0, this.quizzesTaken = 0});
  factory _DailyActivity.fromJson(Map<String, dynamic> json) => _$DailyActivityFromJson(json);

@override final  DateTime date;
@override@JsonKey() final  int pagesRead;
@override@JsonKey() final  int minutesSpent;
@override@JsonKey() final  int wordsLearned;
@override@JsonKey() final  int quizzesTaken;

/// Create a copy of DailyActivity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyActivityCopyWith<_DailyActivity> get copyWith => __$DailyActivityCopyWithImpl<_DailyActivity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyActivityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyActivity&&(identical(other.date, date) || other.date == date)&&(identical(other.pagesRead, pagesRead) || other.pagesRead == pagesRead)&&(identical(other.minutesSpent, minutesSpent) || other.minutesSpent == minutesSpent)&&(identical(other.wordsLearned, wordsLearned) || other.wordsLearned == wordsLearned)&&(identical(other.quizzesTaken, quizzesTaken) || other.quizzesTaken == quizzesTaken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,pagesRead,minutesSpent,wordsLearned,quizzesTaken);

@override
String toString() {
  return 'DailyActivity(date: $date, pagesRead: $pagesRead, minutesSpent: $minutesSpent, wordsLearned: $wordsLearned, quizzesTaken: $quizzesTaken)';
}


}

/// @nodoc
abstract mixin class _$DailyActivityCopyWith<$Res> implements $DailyActivityCopyWith<$Res> {
  factory _$DailyActivityCopyWith(_DailyActivity value, $Res Function(_DailyActivity) _then) = __$DailyActivityCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int pagesRead, int minutesSpent, int wordsLearned, int quizzesTaken
});




}
/// @nodoc
class __$DailyActivityCopyWithImpl<$Res>
    implements _$DailyActivityCopyWith<$Res> {
  __$DailyActivityCopyWithImpl(this._self, this._then);

  final _DailyActivity _self;
  final $Res Function(_DailyActivity) _then;

/// Create a copy of DailyActivity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? pagesRead = null,Object? minutesSpent = null,Object? wordsLearned = null,Object? quizzesTaken = null,}) {
  return _then(_DailyActivity(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,pagesRead: null == pagesRead ? _self.pagesRead : pagesRead // ignore: cast_nullable_to_non_nullable
as int,minutesSpent: null == minutesSpent ? _self.minutesSpent : minutesSpent // ignore: cast_nullable_to_non_nullable
as int,wordsLearned: null == wordsLearned ? _self.wordsLearned : wordsLearned // ignore: cast_nullable_to_non_nullable
as int,quizzesTaken: null == quizzesTaken ? _self.quizzesTaken : quizzesTaken // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Achievement {

 String get id; String get name; String get description; String get iconUrl; DateTime? get earnedAt; bool get isLocked;
/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementCopyWith<Achievement> get copyWith => _$AchievementCopyWithImpl<Achievement>(this as Achievement, _$identity);

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Achievement&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.earnedAt, earnedAt) || other.earnedAt == earnedAt)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconUrl,earnedAt,isLocked);

@override
String toString() {
  return 'Achievement(id: $id, name: $name, description: $description, iconUrl: $iconUrl, earnedAt: $earnedAt, isLocked: $isLocked)';
}


}

/// @nodoc
abstract mixin class $AchievementCopyWith<$Res>  {
  factory $AchievementCopyWith(Achievement value, $Res Function(Achievement) _then) = _$AchievementCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String iconUrl, DateTime? earnedAt, bool isLocked
});




}
/// @nodoc
class _$AchievementCopyWithImpl<$Res>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._self, this._then);

  final Achievement _self;
  final $Res Function(Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? iconUrl = null,Object? earnedAt = freezed,Object? isLocked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,earnedAt: freezed == earnedAt ? _self.earnedAt : earnedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Achievement].
extension AchievementPatterns on Achievement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Achievement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Achievement value)  $default,){
final _that = this;
switch (_that) {
case _Achievement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Achievement value)?  $default,){
final _that = this;
switch (_that) {
case _Achievement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String iconUrl,  DateTime? earnedAt,  bool isLocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconUrl,_that.earnedAt,_that.isLocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String iconUrl,  DateTime? earnedAt,  bool isLocked)  $default,) {final _that = this;
switch (_that) {
case _Achievement():
return $default(_that.id,_that.name,_that.description,_that.iconUrl,_that.earnedAt,_that.isLocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String iconUrl,  DateTime? earnedAt,  bool isLocked)?  $default,) {final _that = this;
switch (_that) {
case _Achievement() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconUrl,_that.earnedAt,_that.isLocked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Achievement implements Achievement {
  const _Achievement({required this.id, required this.name, required this.description, required this.iconUrl, this.earnedAt, this.isLocked = false});
  factory _Achievement.fromJson(Map<String, dynamic> json) => _$AchievementFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String iconUrl;
@override final  DateTime? earnedAt;
@override@JsonKey() final  bool isLocked;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementCopyWith<_Achievement> get copyWith => __$AchievementCopyWithImpl<_Achievement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Achievement&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.earnedAt, earnedAt) || other.earnedAt == earnedAt)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconUrl,earnedAt,isLocked);

@override
String toString() {
  return 'Achievement(id: $id, name: $name, description: $description, iconUrl: $iconUrl, earnedAt: $earnedAt, isLocked: $isLocked)';
}


}

/// @nodoc
abstract mixin class _$AchievementCopyWith<$Res> implements $AchievementCopyWith<$Res> {
  factory _$AchievementCopyWith(_Achievement value, $Res Function(_Achievement) _then) = __$AchievementCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String iconUrl, DateTime? earnedAt, bool isLocked
});




}
/// @nodoc
class __$AchievementCopyWithImpl<$Res>
    implements _$AchievementCopyWith<$Res> {
  __$AchievementCopyWithImpl(this._self, this._then);

  final _Achievement _self;
  final $Res Function(_Achievement) _then;

/// Create a copy of Achievement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? iconUrl = null,Object? earnedAt = freezed,Object? isLocked = null,}) {
  return _then(_Achievement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,earnedAt: freezed == earnedAt ? _self.earnedAt : earnedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLocked: null == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ActivityItem {

 String get id; String get type;// story_completed, word_saved, quiz_result, achievement
 String get title; String get description; DateTime get timestamp; String? get iconUrl; Map<String, dynamic>? get metadata;
/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityItemCopyWith<ActivityItem> get copyWith => _$ActivityItemCopyWithImpl<ActivityItem>(this as ActivityItem, _$identity);

  /// Serializes this ActivityItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,description,timestamp,iconUrl,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'ActivityItem(id: $id, type: $type, title: $title, description: $description, timestamp: $timestamp, iconUrl: $iconUrl, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $ActivityItemCopyWith<$Res>  {
  factory $ActivityItemCopyWith(ActivityItem value, $Res Function(ActivityItem) _then) = _$ActivityItemCopyWithImpl;
@useResult
$Res call({
 String id, String type, String title, String description, DateTime timestamp, String? iconUrl, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$ActivityItemCopyWithImpl<$Res>
    implements $ActivityItemCopyWith<$Res> {
  _$ActivityItemCopyWithImpl(this._self, this._then);

  final ActivityItem _self;
  final $Res Function(ActivityItem) _then;

/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? description = null,Object? timestamp = null,Object? iconUrl = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityItem].
extension ActivityItemPatterns on ActivityItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityItem value)  $default,){
final _that = this;
switch (_that) {
case _ActivityItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityItem value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String description,  DateTime timestamp,  String? iconUrl,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.timestamp,_that.iconUrl,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String description,  DateTime timestamp,  String? iconUrl,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _ActivityItem():
return $default(_that.id,_that.type,_that.title,_that.description,_that.timestamp,_that.iconUrl,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String title,  String description,  DateTime timestamp,  String? iconUrl,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _ActivityItem() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.description,_that.timestamp,_that.iconUrl,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityItem implements ActivityItem {
  const _ActivityItem({required this.id, required this.type, required this.title, required this.description, required this.timestamp, this.iconUrl, final  Map<String, dynamic>? metadata}): _metadata = metadata;
  factory _ActivityItem.fromJson(Map<String, dynamic> json) => _$ActivityItemFromJson(json);

@override final  String id;
@override final  String type;
// story_completed, word_saved, quiz_result, achievement
@override final  String title;
@override final  String description;
@override final  DateTime timestamp;
@override final  String? iconUrl;
 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityItemCopyWith<_ActivityItem> get copyWith => __$ActivityItemCopyWithImpl<_ActivityItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityItem&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,description,timestamp,iconUrl,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'ActivityItem(id: $id, type: $type, title: $title, description: $description, timestamp: $timestamp, iconUrl: $iconUrl, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$ActivityItemCopyWith<$Res> implements $ActivityItemCopyWith<$Res> {
  factory _$ActivityItemCopyWith(_ActivityItem value, $Res Function(_ActivityItem) _then) = __$ActivityItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String title, String description, DateTime timestamp, String? iconUrl, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$ActivityItemCopyWithImpl<$Res>
    implements _$ActivityItemCopyWith<$Res> {
  __$ActivityItemCopyWithImpl(this._self, this._then);

  final _ActivityItem _self;
  final $Res Function(_ActivityItem) _then;

/// Create a copy of ActivityItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? description = null,Object? timestamp = null,Object? iconUrl = freezed,Object? metadata = freezed,}) {
  return _then(_ActivityItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$VocabularyStats {

 int get learning; int get learned; int get difficult; int get a1Words; int get a2Words; int get b1Words; int get b2Words;
/// Create a copy of VocabularyStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyStatsCopyWith<VocabularyStats> get copyWith => _$VocabularyStatsCopyWithImpl<VocabularyStats>(this as VocabularyStats, _$identity);

  /// Serializes this VocabularyStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyStats&&(identical(other.learning, learning) || other.learning == learning)&&(identical(other.learned, learned) || other.learned == learned)&&(identical(other.difficult, difficult) || other.difficult == difficult)&&(identical(other.a1Words, a1Words) || other.a1Words == a1Words)&&(identical(other.a2Words, a2Words) || other.a2Words == a2Words)&&(identical(other.b1Words, b1Words) || other.b1Words == b1Words)&&(identical(other.b2Words, b2Words) || other.b2Words == b2Words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,learning,learned,difficult,a1Words,a2Words,b1Words,b2Words);

@override
String toString() {
  return 'VocabularyStats(learning: $learning, learned: $learned, difficult: $difficult, a1Words: $a1Words, a2Words: $a2Words, b1Words: $b1Words, b2Words: $b2Words)';
}


}

/// @nodoc
abstract mixin class $VocabularyStatsCopyWith<$Res>  {
  factory $VocabularyStatsCopyWith(VocabularyStats value, $Res Function(VocabularyStats) _then) = _$VocabularyStatsCopyWithImpl;
@useResult
$Res call({
 int learning, int learned, int difficult, int a1Words, int a2Words, int b1Words, int b2Words
});




}
/// @nodoc
class _$VocabularyStatsCopyWithImpl<$Res>
    implements $VocabularyStatsCopyWith<$Res> {
  _$VocabularyStatsCopyWithImpl(this._self, this._then);

  final VocabularyStats _self;
  final $Res Function(VocabularyStats) _then;

/// Create a copy of VocabularyStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? learning = null,Object? learned = null,Object? difficult = null,Object? a1Words = null,Object? a2Words = null,Object? b1Words = null,Object? b2Words = null,}) {
  return _then(_self.copyWith(
learning: null == learning ? _self.learning : learning // ignore: cast_nullable_to_non_nullable
as int,learned: null == learned ? _self.learned : learned // ignore: cast_nullable_to_non_nullable
as int,difficult: null == difficult ? _self.difficult : difficult // ignore: cast_nullable_to_non_nullable
as int,a1Words: null == a1Words ? _self.a1Words : a1Words // ignore: cast_nullable_to_non_nullable
as int,a2Words: null == a2Words ? _self.a2Words : a2Words // ignore: cast_nullable_to_non_nullable
as int,b1Words: null == b1Words ? _self.b1Words : b1Words // ignore: cast_nullable_to_non_nullable
as int,b2Words: null == b2Words ? _self.b2Words : b2Words // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VocabularyStats].
extension VocabularyStatsPatterns on VocabularyStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabularyStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabularyStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabularyStats value)  $default,){
final _that = this;
switch (_that) {
case _VocabularyStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabularyStats value)?  $default,){
final _that = this;
switch (_that) {
case _VocabularyStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int learning,  int learned,  int difficult,  int a1Words,  int a2Words,  int b1Words,  int b2Words)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyStats() when $default != null:
return $default(_that.learning,_that.learned,_that.difficult,_that.a1Words,_that.a2Words,_that.b1Words,_that.b2Words);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int learning,  int learned,  int difficult,  int a1Words,  int a2Words,  int b1Words,  int b2Words)  $default,) {final _that = this;
switch (_that) {
case _VocabularyStats():
return $default(_that.learning,_that.learned,_that.difficult,_that.a1Words,_that.a2Words,_that.b1Words,_that.b2Words);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int learning,  int learned,  int difficult,  int a1Words,  int a2Words,  int b1Words,  int b2Words)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyStats() when $default != null:
return $default(_that.learning,_that.learned,_that.difficult,_that.a1Words,_that.a2Words,_that.b1Words,_that.b2Words);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyStats implements VocabularyStats {
  const _VocabularyStats({this.learning = 0, this.learned = 0, this.difficult = 0, this.a1Words = 0, this.a2Words = 0, this.b1Words = 0, this.b2Words = 0});
  factory _VocabularyStats.fromJson(Map<String, dynamic> json) => _$VocabularyStatsFromJson(json);

@override@JsonKey() final  int learning;
@override@JsonKey() final  int learned;
@override@JsonKey() final  int difficult;
@override@JsonKey() final  int a1Words;
@override@JsonKey() final  int a2Words;
@override@JsonKey() final  int b1Words;
@override@JsonKey() final  int b2Words;

/// Create a copy of VocabularyStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyStatsCopyWith<_VocabularyStats> get copyWith => __$VocabularyStatsCopyWithImpl<_VocabularyStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyStats&&(identical(other.learning, learning) || other.learning == learning)&&(identical(other.learned, learned) || other.learned == learned)&&(identical(other.difficult, difficult) || other.difficult == difficult)&&(identical(other.a1Words, a1Words) || other.a1Words == a1Words)&&(identical(other.a2Words, a2Words) || other.a2Words == a2Words)&&(identical(other.b1Words, b1Words) || other.b1Words == b1Words)&&(identical(other.b2Words, b2Words) || other.b2Words == b2Words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,learning,learned,difficult,a1Words,a2Words,b1Words,b2Words);

@override
String toString() {
  return 'VocabularyStats(learning: $learning, learned: $learned, difficult: $difficult, a1Words: $a1Words, a2Words: $a2Words, b1Words: $b1Words, b2Words: $b2Words)';
}


}

/// @nodoc
abstract mixin class _$VocabularyStatsCopyWith<$Res> implements $VocabularyStatsCopyWith<$Res> {
  factory _$VocabularyStatsCopyWith(_VocabularyStats value, $Res Function(_VocabularyStats) _then) = __$VocabularyStatsCopyWithImpl;
@override @useResult
$Res call({
 int learning, int learned, int difficult, int a1Words, int a2Words, int b1Words, int b2Words
});




}
/// @nodoc
class __$VocabularyStatsCopyWithImpl<$Res>
    implements _$VocabularyStatsCopyWith<$Res> {
  __$VocabularyStatsCopyWithImpl(this._self, this._then);

  final _VocabularyStats _self;
  final $Res Function(_VocabularyStats) _then;

/// Create a copy of VocabularyStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? learning = null,Object? learned = null,Object? difficult = null,Object? a1Words = null,Object? a2Words = null,Object? b1Words = null,Object? b2Words = null,}) {
  return _then(_VocabularyStats(
learning: null == learning ? _self.learning : learning // ignore: cast_nullable_to_non_nullable
as int,learned: null == learned ? _self.learned : learned // ignore: cast_nullable_to_non_nullable
as int,difficult: null == difficult ? _self.difficult : difficult // ignore: cast_nullable_to_non_nullable
as int,a1Words: null == a1Words ? _self.a1Words : a1Words // ignore: cast_nullable_to_non_nullable
as int,a2Words: null == a2Words ? _self.a2Words : a2Words // ignore: cast_nullable_to_non_nullable
as int,b1Words: null == b1Words ? _self.b1Words : b1Words // ignore: cast_nullable_to_non_nullable
as int,b2Words: null == b2Words ? _self.b2Words : b2Words // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ExtendedStatistics {

 int get totalReadingTime; int get storiesCompleted; int get wordsLearned; int get quizzesTaken; int get streakDays; int get totalCoins; int get voiceRecordings; double get averageScore; List<DailyActivity> get weeklyActivity; VocabularyStats? get vocabularyStats; List<Achievement> get achievements; List<ActivityItem> get recentActivity;
/// Create a copy of ExtendedStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExtendedStatisticsCopyWith<ExtendedStatistics> get copyWith => _$ExtendedStatisticsCopyWithImpl<ExtendedStatistics>(this as ExtendedStatistics, _$identity);

  /// Serializes this ExtendedStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExtendedStatistics&&(identical(other.totalReadingTime, totalReadingTime) || other.totalReadingTime == totalReadingTime)&&(identical(other.storiesCompleted, storiesCompleted) || other.storiesCompleted == storiesCompleted)&&(identical(other.wordsLearned, wordsLearned) || other.wordsLearned == wordsLearned)&&(identical(other.quizzesTaken, quizzesTaken) || other.quizzesTaken == quizzesTaken)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.totalCoins, totalCoins) || other.totalCoins == totalCoins)&&(identical(other.voiceRecordings, voiceRecordings) || other.voiceRecordings == voiceRecordings)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&const DeepCollectionEquality().equals(other.weeklyActivity, weeklyActivity)&&(identical(other.vocabularyStats, vocabularyStats) || other.vocabularyStats == vocabularyStats)&&const DeepCollectionEquality().equals(other.achievements, achievements)&&const DeepCollectionEquality().equals(other.recentActivity, recentActivity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalReadingTime,storiesCompleted,wordsLearned,quizzesTaken,streakDays,totalCoins,voiceRecordings,averageScore,const DeepCollectionEquality().hash(weeklyActivity),vocabularyStats,const DeepCollectionEquality().hash(achievements),const DeepCollectionEquality().hash(recentActivity));

@override
String toString() {
  return 'ExtendedStatistics(totalReadingTime: $totalReadingTime, storiesCompleted: $storiesCompleted, wordsLearned: $wordsLearned, quizzesTaken: $quizzesTaken, streakDays: $streakDays, totalCoins: $totalCoins, voiceRecordings: $voiceRecordings, averageScore: $averageScore, weeklyActivity: $weeklyActivity, vocabularyStats: $vocabularyStats, achievements: $achievements, recentActivity: $recentActivity)';
}


}

/// @nodoc
abstract mixin class $ExtendedStatisticsCopyWith<$Res>  {
  factory $ExtendedStatisticsCopyWith(ExtendedStatistics value, $Res Function(ExtendedStatistics) _then) = _$ExtendedStatisticsCopyWithImpl;
@useResult
$Res call({
 int totalReadingTime, int storiesCompleted, int wordsLearned, int quizzesTaken, int streakDays, int totalCoins, int voiceRecordings, double averageScore, List<DailyActivity> weeklyActivity, VocabularyStats? vocabularyStats, List<Achievement> achievements, List<ActivityItem> recentActivity
});


$VocabularyStatsCopyWith<$Res>? get vocabularyStats;

}
/// @nodoc
class _$ExtendedStatisticsCopyWithImpl<$Res>
    implements $ExtendedStatisticsCopyWith<$Res> {
  _$ExtendedStatisticsCopyWithImpl(this._self, this._then);

  final ExtendedStatistics _self;
  final $Res Function(ExtendedStatistics) _then;

/// Create a copy of ExtendedStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalReadingTime = null,Object? storiesCompleted = null,Object? wordsLearned = null,Object? quizzesTaken = null,Object? streakDays = null,Object? totalCoins = null,Object? voiceRecordings = null,Object? averageScore = null,Object? weeklyActivity = null,Object? vocabularyStats = freezed,Object? achievements = null,Object? recentActivity = null,}) {
  return _then(_self.copyWith(
totalReadingTime: null == totalReadingTime ? _self.totalReadingTime : totalReadingTime // ignore: cast_nullable_to_non_nullable
as int,storiesCompleted: null == storiesCompleted ? _self.storiesCompleted : storiesCompleted // ignore: cast_nullable_to_non_nullable
as int,wordsLearned: null == wordsLearned ? _self.wordsLearned : wordsLearned // ignore: cast_nullable_to_non_nullable
as int,quizzesTaken: null == quizzesTaken ? _self.quizzesTaken : quizzesTaken // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,totalCoins: null == totalCoins ? _self.totalCoins : totalCoins // ignore: cast_nullable_to_non_nullable
as int,voiceRecordings: null == voiceRecordings ? _self.voiceRecordings : voiceRecordings // ignore: cast_nullable_to_non_nullable
as int,averageScore: null == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as double,weeklyActivity: null == weeklyActivity ? _self.weeklyActivity : weeklyActivity // ignore: cast_nullable_to_non_nullable
as List<DailyActivity>,vocabularyStats: freezed == vocabularyStats ? _self.vocabularyStats : vocabularyStats // ignore: cast_nullable_to_non_nullable
as VocabularyStats?,achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,recentActivity: null == recentActivity ? _self.recentActivity : recentActivity // ignore: cast_nullable_to_non_nullable
as List<ActivityItem>,
  ));
}
/// Create a copy of ExtendedStatistics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VocabularyStatsCopyWith<$Res>? get vocabularyStats {
    if (_self.vocabularyStats == null) {
    return null;
  }

  return $VocabularyStatsCopyWith<$Res>(_self.vocabularyStats!, (value) {
    return _then(_self.copyWith(vocabularyStats: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExtendedStatistics].
extension ExtendedStatisticsPatterns on ExtendedStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExtendedStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExtendedStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExtendedStatistics value)  $default,){
final _that = this;
switch (_that) {
case _ExtendedStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExtendedStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _ExtendedStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalReadingTime,  int storiesCompleted,  int wordsLearned,  int quizzesTaken,  int streakDays,  int totalCoins,  int voiceRecordings,  double averageScore,  List<DailyActivity> weeklyActivity,  VocabularyStats? vocabularyStats,  List<Achievement> achievements,  List<ActivityItem> recentActivity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExtendedStatistics() when $default != null:
return $default(_that.totalReadingTime,_that.storiesCompleted,_that.wordsLearned,_that.quizzesTaken,_that.streakDays,_that.totalCoins,_that.voiceRecordings,_that.averageScore,_that.weeklyActivity,_that.vocabularyStats,_that.achievements,_that.recentActivity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalReadingTime,  int storiesCompleted,  int wordsLearned,  int quizzesTaken,  int streakDays,  int totalCoins,  int voiceRecordings,  double averageScore,  List<DailyActivity> weeklyActivity,  VocabularyStats? vocabularyStats,  List<Achievement> achievements,  List<ActivityItem> recentActivity)  $default,) {final _that = this;
switch (_that) {
case _ExtendedStatistics():
return $default(_that.totalReadingTime,_that.storiesCompleted,_that.wordsLearned,_that.quizzesTaken,_that.streakDays,_that.totalCoins,_that.voiceRecordings,_that.averageScore,_that.weeklyActivity,_that.vocabularyStats,_that.achievements,_that.recentActivity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalReadingTime,  int storiesCompleted,  int wordsLearned,  int quizzesTaken,  int streakDays,  int totalCoins,  int voiceRecordings,  double averageScore,  List<DailyActivity> weeklyActivity,  VocabularyStats? vocabularyStats,  List<Achievement> achievements,  List<ActivityItem> recentActivity)?  $default,) {final _that = this;
switch (_that) {
case _ExtendedStatistics() when $default != null:
return $default(_that.totalReadingTime,_that.storiesCompleted,_that.wordsLearned,_that.quizzesTaken,_that.streakDays,_that.totalCoins,_that.voiceRecordings,_that.averageScore,_that.weeklyActivity,_that.vocabularyStats,_that.achievements,_that.recentActivity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExtendedStatistics implements ExtendedStatistics {
  const _ExtendedStatistics({this.totalReadingTime = 0, this.storiesCompleted = 0, this.wordsLearned = 0, this.quizzesTaken = 0, this.streakDays = 0, this.totalCoins = 0, this.voiceRecordings = 0, this.averageScore = 0.0, final  List<DailyActivity> weeklyActivity = const [], this.vocabularyStats, final  List<Achievement> achievements = const [], final  List<ActivityItem> recentActivity = const []}): _weeklyActivity = weeklyActivity,_achievements = achievements,_recentActivity = recentActivity;
  factory _ExtendedStatistics.fromJson(Map<String, dynamic> json) => _$ExtendedStatisticsFromJson(json);

@override@JsonKey() final  int totalReadingTime;
@override@JsonKey() final  int storiesCompleted;
@override@JsonKey() final  int wordsLearned;
@override@JsonKey() final  int quizzesTaken;
@override@JsonKey() final  int streakDays;
@override@JsonKey() final  int totalCoins;
@override@JsonKey() final  int voiceRecordings;
@override@JsonKey() final  double averageScore;
 final  List<DailyActivity> _weeklyActivity;
@override@JsonKey() List<DailyActivity> get weeklyActivity {
  if (_weeklyActivity is EqualUnmodifiableListView) return _weeklyActivity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeklyActivity);
}

@override final  VocabularyStats? vocabularyStats;
 final  List<Achievement> _achievements;
@override@JsonKey() List<Achievement> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}

 final  List<ActivityItem> _recentActivity;
@override@JsonKey() List<ActivityItem> get recentActivity {
  if (_recentActivity is EqualUnmodifiableListView) return _recentActivity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentActivity);
}


/// Create a copy of ExtendedStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExtendedStatisticsCopyWith<_ExtendedStatistics> get copyWith => __$ExtendedStatisticsCopyWithImpl<_ExtendedStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExtendedStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExtendedStatistics&&(identical(other.totalReadingTime, totalReadingTime) || other.totalReadingTime == totalReadingTime)&&(identical(other.storiesCompleted, storiesCompleted) || other.storiesCompleted == storiesCompleted)&&(identical(other.wordsLearned, wordsLearned) || other.wordsLearned == wordsLearned)&&(identical(other.quizzesTaken, quizzesTaken) || other.quizzesTaken == quizzesTaken)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.totalCoins, totalCoins) || other.totalCoins == totalCoins)&&(identical(other.voiceRecordings, voiceRecordings) || other.voiceRecordings == voiceRecordings)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&const DeepCollectionEquality().equals(other._weeklyActivity, _weeklyActivity)&&(identical(other.vocabularyStats, vocabularyStats) || other.vocabularyStats == vocabularyStats)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&const DeepCollectionEquality().equals(other._recentActivity, _recentActivity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalReadingTime,storiesCompleted,wordsLearned,quizzesTaken,streakDays,totalCoins,voiceRecordings,averageScore,const DeepCollectionEquality().hash(_weeklyActivity),vocabularyStats,const DeepCollectionEquality().hash(_achievements),const DeepCollectionEquality().hash(_recentActivity));

@override
String toString() {
  return 'ExtendedStatistics(totalReadingTime: $totalReadingTime, storiesCompleted: $storiesCompleted, wordsLearned: $wordsLearned, quizzesTaken: $quizzesTaken, streakDays: $streakDays, totalCoins: $totalCoins, voiceRecordings: $voiceRecordings, averageScore: $averageScore, weeklyActivity: $weeklyActivity, vocabularyStats: $vocabularyStats, achievements: $achievements, recentActivity: $recentActivity)';
}


}

/// @nodoc
abstract mixin class _$ExtendedStatisticsCopyWith<$Res> implements $ExtendedStatisticsCopyWith<$Res> {
  factory _$ExtendedStatisticsCopyWith(_ExtendedStatistics value, $Res Function(_ExtendedStatistics) _then) = __$ExtendedStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalReadingTime, int storiesCompleted, int wordsLearned, int quizzesTaken, int streakDays, int totalCoins, int voiceRecordings, double averageScore, List<DailyActivity> weeklyActivity, VocabularyStats? vocabularyStats, List<Achievement> achievements, List<ActivityItem> recentActivity
});


@override $VocabularyStatsCopyWith<$Res>? get vocabularyStats;

}
/// @nodoc
class __$ExtendedStatisticsCopyWithImpl<$Res>
    implements _$ExtendedStatisticsCopyWith<$Res> {
  __$ExtendedStatisticsCopyWithImpl(this._self, this._then);

  final _ExtendedStatistics _self;
  final $Res Function(_ExtendedStatistics) _then;

/// Create a copy of ExtendedStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalReadingTime = null,Object? storiesCompleted = null,Object? wordsLearned = null,Object? quizzesTaken = null,Object? streakDays = null,Object? totalCoins = null,Object? voiceRecordings = null,Object? averageScore = null,Object? weeklyActivity = null,Object? vocabularyStats = freezed,Object? achievements = null,Object? recentActivity = null,}) {
  return _then(_ExtendedStatistics(
totalReadingTime: null == totalReadingTime ? _self.totalReadingTime : totalReadingTime // ignore: cast_nullable_to_non_nullable
as int,storiesCompleted: null == storiesCompleted ? _self.storiesCompleted : storiesCompleted // ignore: cast_nullable_to_non_nullable
as int,wordsLearned: null == wordsLearned ? _self.wordsLearned : wordsLearned // ignore: cast_nullable_to_non_nullable
as int,quizzesTaken: null == quizzesTaken ? _self.quizzesTaken : quizzesTaken // ignore: cast_nullable_to_non_nullable
as int,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,totalCoins: null == totalCoins ? _self.totalCoins : totalCoins // ignore: cast_nullable_to_non_nullable
as int,voiceRecordings: null == voiceRecordings ? _self.voiceRecordings : voiceRecordings // ignore: cast_nullable_to_non_nullable
as int,averageScore: null == averageScore ? _self.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as double,weeklyActivity: null == weeklyActivity ? _self._weeklyActivity : weeklyActivity // ignore: cast_nullable_to_non_nullable
as List<DailyActivity>,vocabularyStats: freezed == vocabularyStats ? _self.vocabularyStats : vocabularyStats // ignore: cast_nullable_to_non_nullable
as VocabularyStats?,achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<Achievement>,recentActivity: null == recentActivity ? _self._recentActivity : recentActivity // ignore: cast_nullable_to_non_nullable
as List<ActivityItem>,
  ));
}

/// Create a copy of ExtendedStatistics
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VocabularyStatsCopyWith<$Res>? get vocabularyStats {
    if (_self.vocabularyStats == null) {
    return null;
  }

  return $VocabularyStatsCopyWith<$Res>(_self.vocabularyStats!, (value) {
    return _then(_self.copyWith(vocabularyStats: value));
  });
}
}

// dart format on
