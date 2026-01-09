// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subscription _$SubscriptionFromJson(Map<String, dynamic> json) =>
    _Subscription(
      type:
          $enumDecodeNullable(_$SubscriptionTypeEnumMap, json['type']) ??
          SubscriptionType.free,
      autoRenew: json['autoRenew'] as bool? ?? false,
    );

Map<String, dynamic> _$SubscriptionToJson(_Subscription instance) =>
    <String, dynamic>{
      'type': _$SubscriptionTypeEnumMap[instance.type]!,
      'autoRenew': instance.autoRenew,
    };

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.free: 'free',
  SubscriptionType.premium: 'premium',
};

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  photoURL: json['photoURL'] as String?,
  provider:
      $enumDecodeNullable(_$AuthProviderEnumMap, json['provider']) ??
      AuthProvider.google,
  nativeLanguage: json['nativeLanguage'] as String? ?? 'Thai',
  learningLanguages:
      (json['learningLanguages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  level: $enumDecodeNullable(_$UserLevelEnumMap, json['level']) ?? UserLevel.A1,
  subscription: json['subscription'] == null
      ? const Subscription()
      : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
  coins: (json['coins'] as num?)?.toInt() ?? 0,
  streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
  lastActiveDate: json['lastActiveDate'] == null
      ? null
      : DateTime.parse(json['lastActiveDate'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'displayName': instance.displayName,
  'photoURL': instance.photoURL,
  'provider': _$AuthProviderEnumMap[instance.provider]!,
  'nativeLanguage': instance.nativeLanguage,
  'learningLanguages': instance.learningLanguages,
  'level': _$UserLevelEnumMap[instance.level]!,
  'subscription': instance.subscription,
  'coins': instance.coins,
  'streakDays': instance.streakDays,
  'lastActiveDate': instance.lastActiveDate?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$AuthProviderEnumMap = {
  AuthProvider.google: 'google',
  AuthProvider.facebook: 'facebook',
  AuthProvider.email: 'email',
  AuthProvider.phone: 'phone',
};

const _$UserLevelEnumMap = {
  UserLevel.A1: 'A1',
  UserLevel.A2: 'A2',
  UserLevel.B1: 'B1',
  UserLevel.B2: 'B2',
};
