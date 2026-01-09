import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/api_client.dart';
import '../api/api_endpoints.dart';
import '../auth/auth_provider.dart';
import '../models/user.dart';

/// App User provider - fetches and caches user from backend
final appUserProvider = AsyncNotifierProvider<AppUserNotifier, User?>(
  AppUserNotifier.new,
);

class AppUserNotifier extends AsyncNotifier<User?> {
  @override
  Future<User?> build() async {
    final firebaseUser = ref.watch(currentUserProvider);
    if (firebaseUser == null) return null;

    return _fetchUser(firebaseUser);
  }

  Future<User?> _fetchUser(firebase_auth.User firebaseUser) async {
    try {
      final apiClient = ref.read(apiClientProvider);
      final response = await apiClient.get(ApiEndpoints.authMe);

      if (response.statusCode == 200 && response.data != null) {
        final userData = response.data['user'] as Map<String, dynamic>;
        return User.fromJson(userData);
      }
      return _createUserFromFirebase(firebaseUser);
    } catch (e) {
      // If backend fails, create user from Firebase data
      return _createUserFromFirebase(firebaseUser);
    }
  }

  User _createUserFromFirebase(firebase_auth.User firebaseUser) {
    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      displayName: firebaseUser.displayName ?? 'Learner',
      photoURL: firebaseUser.photoURL,
      provider: AuthProvider.google,
    );
  }

  /// Update user profile on backend
  Future<void> updateProfile(Map<String, dynamic> updates) async {
    try {
      final apiClient = ref.read(apiClientProvider);
      await apiClient.patch(ApiEndpoints.userProfile, data: updates);
      ref.invalidateSelf();
    } catch (e) {
      rethrow;
    }
  }

  /// Logout user
  Future<void> logout() async {
    await firebase_auth.FirebaseAuth.instance.signOut();
    state = const AsyncData(null);
  }
}
