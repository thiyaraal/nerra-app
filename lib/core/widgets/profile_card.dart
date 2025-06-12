import 'package:flutter/material.dart';
import 'package:narra_apps/core/constants/color_styles.dart';
import 'package:narra_apps/core/constants/font_sizes.dart';
import 'package:narra_apps/core/constants/text_styles.dart';

class ProfileCard extends StatelessWidget {
  final String image ;
  final String name;
  const ProfileCard({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: ColorStyles.primary,
            shape: BoxShape.circle,
            border: Border.all(color: ColorStyles.primary, width: 2),
            image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
      name,
          style: AppTextStyles.regular(
            FontSizes.md,
            color: ColorStyles.black,
      
          )
        ),
      ],
    );
  }
}
