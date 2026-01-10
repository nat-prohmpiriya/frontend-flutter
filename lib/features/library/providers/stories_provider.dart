import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/story.dart';
import '../data/story_repository.dart';

part 'stories_provider.g.dart';

@riverpod
class StoriesFilter extends _$StoriesFilter {
  @override
  ({String? level, String? category}) build() => (level: null, category: null);

  void setLevel(String? level) {
    state = (level: level, category: state.category);
  }

  void setCategory(String? category) {
    state = (level: state.level, category: category);
  }

  void clear() {
    state = (level: null, category: null);
  }
}

@riverpod
Future<List<Story>> stories(Ref ref) async {
  final filter = ref.watch(storiesFilterProvider);
  final repository = ref.watch(storyRepositoryProvider);

  return repository.getStories(
    level: filter.level,
    category: filter.category,
  );
}

@riverpod
Future<Story> storyDetail(Ref ref, String slug) async {
  final repository = ref.watch(storyRepositoryProvider);
  return repository.getStory(slug);
}
