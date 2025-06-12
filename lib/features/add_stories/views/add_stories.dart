import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:narra_apps/core/constants/color_styles.dart';
import 'package:narra_apps/core/constants/font_sizes.dart';
import 'package:narra_apps/core/constants/text_styles.dart';
import 'package:narra_apps/core/helpers/paths.dart';
import 'package:narra_apps/core/widgets/elevated_button_widget.dart';

class AddStoriesScreen extends StatefulWidget {
  const AddStoriesScreen({super.key});

  @override
  State<AddStoriesScreen> createState() => _AddStoriesScreenState();
}

class _AddStoriesScreenState extends State<AddStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => context.go(Paths.home),
            ),
            const SizedBox(width: 8.0),
            Text('Add stories', style: AppTextStyles.medium(FontSizes.xl)),
          ],
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  color: ColorStyles.primary,
                  dashPattern: const [4, 6],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),

                  child: Container(
                    width: double.infinity,
                    height: 120,

                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            color: ColorStyles.black,
                            size: 60,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add photo',
                          style: AppTextStyles.regular(
                            FontSizes.md,
                            color: ColorStyles.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  'lets tell the story of the picture',
                  style: AppTextStyles.medium(FontSizes.md),
                ),
                const SizedBox(height: 12),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Write your story here...',
                    hintStyle: AppTextStyles.regular(
                      FontSizes.md,
                      color: ColorStyles.disabled,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ColorStyles.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: ColorStyles.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
        child: CustomElevatedButton(labelText: 'Post Story', onPressed: () {}),
      ),
    );
  }
}
