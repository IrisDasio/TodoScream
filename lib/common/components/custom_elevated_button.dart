import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/constants/custom_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.subColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              32,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(text),
        ),
      ),
    );
  }
}
