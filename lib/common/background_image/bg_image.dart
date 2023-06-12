import 'package:flutter/material.dart';

//=============== bg.image2.dart와 비교 ============================.

class BackgroundImage extends StatelessWidget {
  final String imageUrl;
  const BackgroundImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
