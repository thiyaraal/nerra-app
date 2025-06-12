import 'package:flutter/material.dart';


class CardImage extends StatelessWidget {
  final String image, title;
  final VoidCallback? onTap;
  const CardImage({super.key, required this.image, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.network(
            image,
              fit: BoxFit.cover,
              width: 250,
              height: 400,
            ),
      
            Positioned(
              left: 8,
              top: 8,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      
                child:  Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
