import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/models/story.dart';
import '../data/story_repository.dart';

part 'stories_provider.g.dart';

@riverpod
class StoriesFilter extends _$StoriesFilter {
  @override
  ({String? level, String? category, String? search}) build() =>
      (level: null, category: null, search: null);

  void setLevel(String? level) {
    state = (level: level, category: state.category, search: state.search);
  }

  void setCategory(String? category) {
    state = (level: state.level, category: category, search: state.search);
  }

  void setSearch(String? search) {
    state = (level: state.level, category: state.category, search: search);
  }

  void clear() {
    state = (level: null, category: null, search: null);
  }
}

@riverpod
Future<List<Story>> stories(Ref ref) async {
  final filter = ref.watch(storiesFilterProvider);
  final repository = ref.watch(storyRepositoryProvider);

  return repository.getStories(
    level: filter.level,
    category: filter.category,
    search: filter.search,
  );
}

@riverpod
Future<Story> storyDetail(Ref ref, String slug) async {
  final repository = ref.watch(storyRepositoryProvider);
  return repository.getStory(slug);
}
