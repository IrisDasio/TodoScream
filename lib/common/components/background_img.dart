import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/constants/assets.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.bgImage),
        ),
      ),
    );
  }
}
