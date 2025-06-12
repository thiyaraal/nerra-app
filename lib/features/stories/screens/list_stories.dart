import 'package:flutter/material.dart';
import 'package:narra_apps/core/constants/font_sizes.dart';
import 'package:narra_apps/core/constants/image_collection.dart';
import 'package:narra_apps/core/constants/text_styles.dart';
import 'package:narra_apps/core/widgets/card_list.dart';

class ListStoriesScreen extends StatefulWidget {
  const ListStoriesScreen({super.key});

  @override
  State<ListStoriesScreen> createState() => _ListStoriesScreenState();
}

class _ListStoriesScreenState extends State<ListStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('All Stories', style: AppTextStyles.medium(FontSizes.xl)),
          

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(top: 20.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: CardList(
                      authorsName: 'Author Name $index',
                      storiesName: 'Story Title $index',
                      storiesImage: ImageCollection.bunga,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
