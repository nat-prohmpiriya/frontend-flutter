/// API Endpoints constants
/// Matches Next.js API routes from frontend-nextjs
class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const authSignup = '/auth/signup';
  static const authMe = '/auth/me'; // Auto-creates user if not exists

  // Stories
  static const stories = '/stories';
  static String storyDetail(String slug) => '/stories/$slug';
  static String storyProgress(String slug) => '/stories/$slug/progress';

  // Vocabulary
  static String vocabularyWord(String word) => '/vocabulary/$word';

  // User
  static const userProfile = '/user/profile';
  static const userProgress = '/user/progress';
  static const userRestore = '/user/restore';

  // Progress
  static const progressStatistics = '/progress/statistics';
}
