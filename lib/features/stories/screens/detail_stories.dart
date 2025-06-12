import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narra_apps/core/constants/font_sizes.dart';
import 'package:narra_apps/core/constants/image_collection.dart';
import 'package:narra_apps/core/constants/text_styles.dart';
import 'package:narra_apps/core/helpers/paths.dart';

import 'package:narra_apps/core/widgets/detail_card.dart';

class DetailStoriesScreen extends StatefulWidget {
  const DetailStoriesScreen({super.key});

  @override
  State<DetailStoriesScreen> createState() => _DetailStoriesScreenState();
}

class _DetailStoriesScreenState extends State<DetailStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => context.go(Paths.home),
            ),
            const SizedBox(width: 8.0),
            Text('story name', style: AppTextStyles.medium(FontSizes.xl)),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          DetailCard(
            date: '2023-10-01',
            desc:
                'This is a sample description for the story. It can be as long as needed to provide context and details about the story being shared.',
            image: ImageCollection.bunga,
          ),
        ],
      ),
    );
  }
}
