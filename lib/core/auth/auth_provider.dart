import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

/// Stream of Firebase auth state changes
@riverpod
Stream<User?> authState(Ref ref) {
  return FirebaseAuth.instance.authStateChanges();
}

/// Current Firebase user
@riverpod
User? currentUser(Ref ref) {
  return ref.watch(authStateProvider).value;
}
