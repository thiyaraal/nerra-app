import 'package:flutter/material.dart';
import 'package:narra_apps/core/constants/color_styles.dart';
import 'package:narra_apps/core/constants/font_sizes.dart';
import 'package:narra_apps/core/constants/text_styles.dart';

class DetailCard extends StatelessWidget {
  final String image;
  final String date;
  final String desc;
  const DetailCard({
    super.key,
    required this.image,
    required this.date,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          date,
          style: AppTextStyles.medium(
            FontSizes.lg,
          ).copyWith(color: ColorStyles.primary),
        ),
        const SizedBox(height: 10),
        Text(desc, style: AppTextStyles.regular(FontSizes.md)),
      ],
    );
  }
}
