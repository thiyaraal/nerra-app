import 'package:flutter/material.dart';
import 'package:narra_apps/core/constants/font_sizes.dart';
import 'package:narra_apps/core/constants/text_styles.dart';

class CardList extends StatelessWidget {
  final String authorsName;
  final String storiesName;
  final String storiesImage;
  const CardList({
    super.key,
    required this.authorsName,
    required this.storiesName,
    required this.storiesImage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: [
          Image.network(
            storiesImage,
            width: double.infinity,
            height: 100,

            fit: BoxFit.cover,
          ),
          Positioned(
            left: 8,
            top: 8,
            child: Text(
              storiesName,
              style: AppTextStyles.medium(FontSizes.lg, color: Colors.white),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Text(
              authorsName,
              style: AppTextStyles.regular(FontSizes.lg, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
