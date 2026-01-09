import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

enum AuthProvider { google, facebook, email, phone }

enum SubscriptionType { free, premium }

// ignore: constant_identifier_names
enum UserLevel { A1, A2, B1, B2 }

@freezed
abstract class Subscription with _$Subscription {
  const factory Subscription({
    @Default(SubscriptionType.free) SubscriptionType type,
    @Default(false) bool autoRenew,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String displayName,
    String? photoURL,
    @Default(AuthProvider.google) AuthProvider provider,
    @Default('Thai') String nativeLanguage,
    @Default([]) List<String> learningLanguages,
    @Default(UserLevel.A1) UserLevel level,
    @Default(Subscription()) Subscription subscription,
    @Default(0) int coins,
    @Default(0) int streakDays,
    DateTime? lastActiveDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
