import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/api/api_client.dart';
import '../../../core/api/api_endpoints.dart';
import '../../../core/models/story.dart';

part 'story_repository.g.dart';

@riverpod
StoryRepository storyRepository(Ref ref) {
  return StoryRepository(ref.watch(apiClientProvider));
}

class StoryRepository {
  final ApiClient _api;

  StoryRepository(this._api);

  Future<List<Story>> getStories({
    String? level,
    String? category,
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await _api.get(
      ApiEndpoints.stories,
      queryParameters: {
        if (level != null && level.isNotEmpty) 'level': level,
        if (category != null && category.isNotEmpty) 'category': category,
        'limit': limit,
        'offset': offset,
      },
    );

    final data = response.data as Map<String, dynamic>;
    final stories = (data['stories'] as List)
        .map((json) => Story.fromJson(json as Map<String, dynamic>))
        .toList();
    return stories;
  }

  Future<Story> getStory(String slug) async {
    final response = await _api.get(ApiEndpoints.storyDetail(slug));
    return Story.fromJson(response.data as Map<String, dynamic>);
  }
}
