// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vocabulary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Vocabulary {

 String get id; String get word; String get definition; String get partOfSpeech; String? get pronunciation; String? get audioUrl; Map<String, String> get translations; List<VocabularyMeaning> get meanings; List<String> get synonyms; List<String> get antonyms; String? get level;
/// Create a copy of Vocabulary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyCopyWith<Vocabulary> get copyWith => _$VocabularyCopyWithImpl<Vocabulary>(this as Vocabulary, _$identity);

  /// Serializes this Vocabulary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Vocabulary&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.pronunciation, pronunciation) || other.pronunciation == pronunciation)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other.translations, translations)&&const DeepCollectionEquality().equals(other.meanings, meanings)&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&const DeepCollectionEquality().equals(other.antonyms, antonyms)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,definition,partOfSpeech,pronunciation,audioUrl,const DeepCollectionEquality().hash(translations),const DeepCollectionEquality().hash(meanings),const DeepCollectionEquality().hash(synonyms),const DeepCollectionEquality().hash(antonyms),level);

@override
String toString() {
  return 'Vocabulary(id: $id, word: $word, definition: $definition, partOfSpeech: $partOfSpeech, pronunciation: $pronunciation, audioUrl: $audioUrl, translations: $translations, meanings: $meanings, synonyms: $synonyms, antonyms: $antonyms, level: $level)';
}


}

/// @nodoc
abstract mixin class $VocabularyCopyWith<$Res>  {
  factory $VocabularyCopyWith(Vocabulary value, $Res Function(Vocabulary) _then) = _$VocabularyCopyWithImpl;
@useResult
$Res call({
 String id, String word, String definition, String partOfSpeech, String? pronunciation, String? audioUrl, Map<String, String> translations, List<VocabularyMeaning> meanings, List<String> synonyms, List<String> antonyms, String? level
});




}
/// @nodoc
class _$VocabularyCopyWithImpl<$Res>
    implements $VocabularyCopyWith<$Res> {
  _$VocabularyCopyWithImpl(this._self, this._then);

  final Vocabulary _self;
  final $Res Function(Vocabulary) _then;

/// Create a copy of Vocabulary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? word = null,Object? definition = null,Object? partOfSpeech = null,Object? pronunciation = freezed,Object? audioUrl = freezed,Object? translations = null,Object? meanings = null,Object? synonyms = null,Object? antonyms = null,Object? level = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,pronunciation: freezed == pronunciation ? _self.pronunciation : pronunciation // ignore: cast_nullable_to_non_nullable
as String?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>,meanings: null == meanings ? _self.meanings : meanings // ignore: cast_nullable_to_non_nullable
as List<VocabularyMeaning>,synonyms: null == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,antonyms: null == antonyms ? _self.antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Vocabulary].
extension VocabularyPatterns on Vocabulary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Vocabulary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Vocabulary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Vocabulary value)  $default,){
final _that = this;
switch (_that) {
case _Vocabulary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Vocabulary value)?  $default,){
final _that = this;
switch (_that) {
case _Vocabulary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String word,  String definition,  String partOfSpeech,  String? pronunciation,  String? audioUrl,  Map<String, String> translations,  List<VocabularyMeaning> meanings,  List<String> synonyms,  List<String> antonyms,  String? level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Vocabulary() when $default != null:
return $default(_that.id,_that.word,_that.definition,_that.partOfSpeech,_that.pronunciation,_that.audioUrl,_that.translations,_that.meanings,_that.synonyms,_that.antonyms,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String word,  String definition,  String partOfSpeech,  String? pronunciation,  String? audioUrl,  Map<String, String> translations,  List<VocabularyMeaning> meanings,  List<String> synonyms,  List<String> antonyms,  String? level)  $default,) {final _that = this;
switch (_that) {
case _Vocabulary():
return $default(_that.id,_that.word,_that.definition,_that.partOfSpeech,_that.pronunciation,_that.audioUrl,_that.translations,_that.meanings,_that.synonyms,_that.antonyms,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String word,  String definition,  String partOfSpeech,  String? pronunciation,  String? audioUrl,  Map<String, String> translations,  List<VocabularyMeaning> meanings,  List<String> synonyms,  List<String> antonyms,  String? level)?  $default,) {final _that = this;
switch (_that) {
case _Vocabulary() when $default != null:
return $default(_that.id,_that.word,_that.definition,_that.partOfSpeech,_that.pronunciation,_that.audioUrl,_that.translations,_that.meanings,_that.synonyms,_that.antonyms,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Vocabulary implements Vocabulary {
  const _Vocabulary({required this.id, required this.word, required this.definition, required this.partOfSpeech, this.pronunciation, this.audioUrl, final  Map<String, String> translations = const {}, final  List<VocabularyMeaning> meanings = const [], final  List<String> synonyms = const [], final  List<String> antonyms = const [], this.level}): _translations = translations,_meanings = meanings,_synonyms = synonyms,_antonyms = antonyms;
  factory _Vocabulary.fromJson(Map<String, dynamic> json) => _$VocabularyFromJson(json);

@override final  String id;
@override final  String word;
@override final  String definition;
@override final  String partOfSpeech;
@override final  String? pronunciation;
@override final  String? audioUrl;
 final  Map<String, String> _translations;
@override@JsonKey() Map<String, String> get translations {
  if (_translations is EqualUnmodifiableMapView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_translations);
}

 final  List<VocabularyMeaning> _meanings;
@override@JsonKey() List<VocabularyMeaning> get meanings {
  if (_meanings is EqualUnmodifiableListView) return _meanings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_meanings);
}

 final  List<String> _synonyms;
@override@JsonKey() List<String> get synonyms {
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_synonyms);
}

 final  List<String> _antonyms;
@override@JsonKey() List<String> get antonyms {
  if (_antonyms is EqualUnmodifiableListView) return _antonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_antonyms);
}

@override final  String? level;

/// Create a copy of Vocabulary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyCopyWith<_Vocabulary> get copyWith => __$VocabularyCopyWithImpl<_Vocabulary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Vocabulary&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.partOfSpeech, partOfSpeech) || other.partOfSpeech == partOfSpeech)&&(identical(other.pronunciation, pronunciation) || other.pronunciation == pronunciation)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&const DeepCollectionEquality().equals(other._translations, _translations)&&const DeepCollectionEquality().equals(other._meanings, _meanings)&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&const DeepCollectionEquality().equals(other._antonyms, _antonyms)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,word,definition,partOfSpeech,pronunciation,audioUrl,const DeepCollectionEquality().hash(_translations),const DeepCollectionEquality().hash(_meanings),const DeepCollectionEquality().hash(_synonyms),const DeepCollectionEquality().hash(_antonyms),level);

@override
String toString() {
  return 'Vocabulary(id: $id, word: $word, definition: $definition, partOfSpeech: $partOfSpeech, pronunciation: $pronunciation, audioUrl: $audioUrl, translations: $translations, meanings: $meanings, synonyms: $synonyms, antonyms: $antonyms, level: $level)';
}


}

/// @nodoc
abstract mixin class _$VocabularyCopyWith<$Res> implements $VocabularyCopyWith<$Res> {
  factory _$VocabularyCopyWith(_Vocabulary value, $Res Function(_Vocabulary) _then) = __$VocabularyCopyWithImpl;
@override @useResult
$Res call({
 String id, String word, String definition, String partOfSpeech, String? pronunciation, String? audioUrl, Map<String, String> translations, List<VocabularyMeaning> meanings, List<String> synonyms, List<String> antonyms, String? level
});




}
/// @nodoc
class __$VocabularyCopyWithImpl<$Res>
    implements _$VocabularyCopyWith<$Res> {
  __$VocabularyCopyWithImpl(this._self, this._then);

  final _Vocabulary _self;
  final $Res Function(_Vocabulary) _then;

/// Create a copy of Vocabulary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? word = null,Object? definition = null,Object? partOfSpeech = null,Object? pronunciation = freezed,Object? audioUrl = freezed,Object? translations = null,Object? meanings = null,Object? synonyms = null,Object? antonyms = null,Object? level = freezed,}) {
  return _then(_Vocabulary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,partOfSpeech: null == partOfSpeech ? _self.partOfSpeech : partOfSpeech // ignore: cast_nullable_to_non_nullable
as String,pronunciation: freezed == pronunciation ? _self.pronunciation : pronunciation // ignore: cast_nullable_to_non_nullable
as String?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,translations: null == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as Map<String, String>,meanings: null == meanings ? _self._meanings : meanings // ignore: cast_nullable_to_non_nullable
as List<VocabularyMeaning>,synonyms: null == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,antonyms: null == antonyms ? _self._antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VocabularyMeaning {

 String get definition; String? get example; List<String> get synonyms; List<String> get antonyms;
/// Create a copy of VocabularyMeaning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyMeaningCopyWith<VocabularyMeaning> get copyWith => _$VocabularyMeaningCopyWithImpl<VocabularyMeaning>(this as VocabularyMeaning, _$identity);

  /// Serializes this VocabularyMeaning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyMeaning&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.example, example) || other.example == example)&&const DeepCollectionEquality().equals(other.synonyms, synonyms)&&const DeepCollectionEquality().equals(other.antonyms, antonyms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,definition,example,const DeepCollectionEquality().hash(synonyms),const DeepCollectionEquality().hash(antonyms));

@override
String toString() {
  return 'VocabularyMeaning(definition: $definition, example: $example, synonyms: $synonyms, antonyms: $antonyms)';
}


}

/// @nodoc
abstract mixin class $VocabularyMeaningCopyWith<$Res>  {
  factory $VocabularyMeaningCopyWith(VocabularyMeaning value, $Res Function(VocabularyMeaning) _then) = _$VocabularyMeaningCopyWithImpl;
@useResult
$Res call({
 String definition, String? example, List<String> synonyms, List<String> antonyms
});




}
/// @nodoc
class _$VocabularyMeaningCopyWithImpl<$Res>
    implements $VocabularyMeaningCopyWith<$Res> {
  _$VocabularyMeaningCopyWithImpl(this._self, this._then);

  final VocabularyMeaning _self;
  final $Res Function(VocabularyMeaning) _then;

/// Create a copy of VocabularyMeaning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? definition = null,Object? example = freezed,Object? synonyms = null,Object? antonyms = null,}) {
  return _then(_self.copyWith(
definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,synonyms: null == synonyms ? _self.synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,antonyms: null == antonyms ? _self.antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [VocabularyMeaning].
extension VocabularyMeaningPatterns on VocabularyMeaning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabularyMeaning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabularyMeaning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabularyMeaning value)  $default,){
final _that = this;
switch (_that) {
case _VocabularyMeaning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabularyMeaning value)?  $default,){
final _that = this;
switch (_that) {
case _VocabularyMeaning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String definition,  String? example,  List<String> synonyms,  List<String> antonyms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyMeaning() when $default != null:
return $default(_that.definition,_that.example,_that.synonyms,_that.antonyms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String definition,  String? example,  List<String> synonyms,  List<String> antonyms)  $default,) {final _that = this;
switch (_that) {
case _VocabularyMeaning():
return $default(_that.definition,_that.example,_that.synonyms,_that.antonyms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String definition,  String? example,  List<String> synonyms,  List<String> antonyms)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyMeaning() when $default != null:
return $default(_that.definition,_that.example,_that.synonyms,_that.antonyms);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyMeaning implements VocabularyMeaning {
  const _VocabularyMeaning({required this.definition, this.example, final  List<String> synonyms = const [], final  List<String> antonyms = const []}): _synonyms = synonyms,_antonyms = antonyms;
  factory _VocabularyMeaning.fromJson(Map<String, dynamic> json) => _$VocabularyMeaningFromJson(json);

@override final  String definition;
@override final  String? example;
 final  List<String> _synonyms;
@override@JsonKey() List<String> get synonyms {
  if (_synonyms is EqualUnmodifiableListView) return _synonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_synonyms);
}

 final  List<String> _antonyms;
@override@JsonKey() List<String> get antonyms {
  if (_antonyms is EqualUnmodifiableListView) return _antonyms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_antonyms);
}


/// Create a copy of VocabularyMeaning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyMeaningCopyWith<_VocabularyMeaning> get copyWith => __$VocabularyMeaningCopyWithImpl<_VocabularyMeaning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyMeaningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyMeaning&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.example, example) || other.example == example)&&const DeepCollectionEquality().equals(other._synonyms, _synonyms)&&const DeepCollectionEquality().equals(other._antonyms, _antonyms));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,definition,example,const DeepCollectionEquality().hash(_synonyms),const DeepCollectionEquality().hash(_antonyms));

@override
String toString() {
  return 'VocabularyMeaning(definition: $definition, example: $example, synonyms: $synonyms, antonyms: $antonyms)';
}


}

/// @nodoc
abstract mixin class _$VocabularyMeaningCopyWith<$Res> implements $VocabularyMeaningCopyWith<$Res> {
  factory _$VocabularyMeaningCopyWith(_VocabularyMeaning value, $Res Function(_VocabularyMeaning) _then) = __$VocabularyMeaningCopyWithImpl;
@override @useResult
$Res call({
 String definition, String? example, List<String> synonyms, List<String> antonyms
});




}
/// @nodoc
class __$VocabularyMeaningCopyWithImpl<$Res>
    implements _$VocabularyMeaningCopyWith<$Res> {
  __$VocabularyMeaningCopyWithImpl(this._self, this._then);

  final _VocabularyMeaning _self;
  final $Res Function(_VocabularyMeaning) _then;

/// Create a copy of VocabularyMeaning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? definition = null,Object? example = freezed,Object? synonyms = null,Object? antonyms = null,}) {
  return _then(_VocabularyMeaning(
definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as String?,synonyms: null == synonyms ? _self._synonyms : synonyms // ignore: cast_nullable_to_non_nullable
as List<String>,antonyms: null == antonyms ? _self._antonyms : antonyms // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$VocabularyAlbum {

 String get id; String get name; String? get description; List<String> get wordIds; DateTime get createdAt;
/// Create a copy of VocabularyAlbum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VocabularyAlbumCopyWith<VocabularyAlbum> get copyWith => _$VocabularyAlbumCopyWithImpl<VocabularyAlbum>(this as VocabularyAlbum, _$identity);

  /// Serializes this VocabularyAlbum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VocabularyAlbum&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.wordIds, wordIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(wordIds),createdAt);

@override
String toString() {
  return 'VocabularyAlbum(id: $id, name: $name, description: $description, wordIds: $wordIds, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $VocabularyAlbumCopyWith<$Res>  {
  factory $VocabularyAlbumCopyWith(VocabularyAlbum value, $Res Function(VocabularyAlbum) _then) = _$VocabularyAlbumCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, List<String> wordIds, DateTime createdAt
});




}
/// @nodoc
class _$VocabularyAlbumCopyWithImpl<$Res>
    implements $VocabularyAlbumCopyWith<$Res> {
  _$VocabularyAlbumCopyWithImpl(this._self, this._then);

  final VocabularyAlbum _self;
  final $Res Function(VocabularyAlbum) _then;

/// Create a copy of VocabularyAlbum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? wordIds = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,wordIds: null == wordIds ? _self.wordIds : wordIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [VocabularyAlbum].
extension VocabularyAlbumPatterns on VocabularyAlbum {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VocabularyAlbum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VocabularyAlbum() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VocabularyAlbum value)  $default,){
final _that = this;
switch (_that) {
case _VocabularyAlbum():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VocabularyAlbum value)?  $default,){
final _that = this;
switch (_that) {
case _VocabularyAlbum() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  List<String> wordIds,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VocabularyAlbum() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.wordIds,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  List<String> wordIds,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _VocabularyAlbum():
return $default(_that.id,_that.name,_that.description,_that.wordIds,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  List<String> wordIds,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _VocabularyAlbum() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.wordIds,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VocabularyAlbum implements VocabularyAlbum {
  const _VocabularyAlbum({required this.id, required this.name, this.description, final  List<String> wordIds = const [], required this.createdAt}): _wordIds = wordIds;
  factory _VocabularyAlbum.fromJson(Map<String, dynamic> json) => _$VocabularyAlbumFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
 final  List<String> _wordIds;
@override@JsonKey() List<String> get wordIds {
  if (_wordIds is EqualUnmodifiableListView) return _wordIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_wordIds);
}

@override final  DateTime createdAt;

/// Create a copy of VocabularyAlbum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VocabularyAlbumCopyWith<_VocabularyAlbum> get copyWith => __$VocabularyAlbumCopyWithImpl<_VocabularyAlbum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VocabularyAlbumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VocabularyAlbum&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._wordIds, _wordIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_wordIds),createdAt);

@override
String toString() {
  return 'VocabularyAlbum(id: $id, name: $name, description: $description, wordIds: $wordIds, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$VocabularyAlbumCopyWith<$Res> implements $VocabularyAlbumCopyWith<$Res> {
  factory _$VocabularyAlbumCopyWith(_VocabularyAlbum value, $Res Function(_VocabularyAlbum) _then) = __$VocabularyAlbumCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, List<String> wordIds, DateTime createdAt
});




}
/// @nodoc
class __$VocabularyAlbumCopyWithImpl<$Res>
    implements _$VocabularyAlbumCopyWith<$Res> {
  __$VocabularyAlbumCopyWithImpl(this._self, this._then);

  final _VocabularyAlbum _self;
  final $Res Function(_VocabularyAlbum) _then;

/// Create a copy of VocabularyAlbum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? wordIds = null,Object? createdAt = null,}) {
  return _then(_VocabularyAlbum(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,wordIds: null == wordIds ? _self._wordIds : wordIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
