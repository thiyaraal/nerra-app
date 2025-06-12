import 'package:flutter/material.dart';
import 'package:narra_apps/core/constants/font_sizes.dart';
import 'package:narra_apps/core/constants/text_styles.dart';

class LogoCard extends StatelessWidget {
  const LogoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('NARRA', style: AppTextStyles.logo(FontSizes.xxxl)),
        const SizedBox(height: 4),

        Container(
          height: 1,
          width: 28,
          color: Color(0xFF7A86B6),
          margin: const EdgeInsets.only(left:2),
        ),
      ],
    );
  }
}
