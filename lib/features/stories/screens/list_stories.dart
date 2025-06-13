import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:narra_apps/core/constants/image_collection.dart';
import 'package:narra_apps/core/widgets/card_list.dart';
import 'package:narra_apps/features/stories/cubit/stories_cubit.dart';
import 'package:narra_apps/features/stories/cubit/stories_state.dart';


class ListStoriesScreen extends StatelessWidget {
  const ListStoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoriesCubit()..fetchAll(),
      child: Scaffold(
        appBar: AppBar(title: const Text('All Stories')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: BlocBuilder<StoriesCubit, StoriesState>(
            builder: (ctx, state) {
              if (state.status == StoriesStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.status == StoriesStatus.failure) {
                return Center(child: Text(state.errorMessage ?? 'Error'));
              }
              if (state.status == StoriesStatus.success) {
                if (state.stories.isEmpty) {
                  return const Center(child: Text('No stories found'));
                }
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: state.stories.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, i) {
                    final story = state.stories[i];
                    return CardList(
                      authorsName: story.name ?? '',
                      storiesName: story.description ?? '',
                      storiesImage:
                          story.photoUrl ?? ImageCollection.bunga,
                    );
                  },
                );
              }
              
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}