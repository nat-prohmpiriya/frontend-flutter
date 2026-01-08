import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Interceptor that adds Firebase auth token to requests
class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        final token = await user.getIdToken();
        options.headers['Authorization'] = 'Bearer $token';
      } catch (e) {
        // If token refresh fails, continue without auth header
        // The server will return 401 and we can handle it in onError
      }
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized errors
    if (err.response?.statusCode == 401) {
      // Token expired or invalid - could trigger re-auth flow here
      // For now, just pass through the error
    }

    handler.next(err);
  }
}
