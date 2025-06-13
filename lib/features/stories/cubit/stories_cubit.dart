import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narra_apps/features/stories/cubit/stories_state.dart';
import 'package:narra_apps/features/stories/services/get_stories_service.dart';

class StoriesCubit extends Cubit<StoriesState> {
  StoriesCubit() : super(const StoriesState());

  Future<void> fetchAll() async {
    emit(state.copyWith(status: StoriesStatus.loading, errorMessage: null));

    try {
      final stories = await GetStoriesService.fetchAllStories();
      emit(state.copyWith(
        status: StoriesStatus.success,
        stories: stories,
        errorMessage: null,
      ));
    } catch (e) {
      final message = e is String ? e : 'Failed to load stories';
      emit(state.copyWith(
        status: StoriesStatus.failure,
        errorMessage: message,
      ));
    }
  }
}

