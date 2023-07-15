import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/constants/custom_colors.dart';

class IceCreamImagesItem extends StatelessWidget {
  final Map iceCream;

  const IceCreamImagesItem({
    super.key,
    required this.iceCream,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(iceCream['img']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 80,
              child: Text(
                iceCream['name'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: CustomColors.defaultColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
