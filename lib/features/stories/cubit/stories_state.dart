import 'package:equatable/equatable.dart';
import 'package:narra_apps/features/stories/models/all_stories_model.dart';

enum StoriesStatus { initial, loading, success, failure }

class StoriesState extends Equatable {
  final StoriesStatus status;
  final List<ListStory> stories;
  final String? errorMessage;

  const StoriesState({
    this.status = StoriesStatus.initial,
    this.stories = const [],
    this.errorMessage,
  });

  StoriesState copyWith({
    StoriesStatus? status,
    List<ListStory>? stories,
    String? errorMessage,
  }) => StoriesState(
    status: status ?? this.status,
    stories: stories ?? this.stories,
    errorMessage: errorMessage,
  );

  @override
  List<Object?> get props => [status, stories, errorMessage];
}