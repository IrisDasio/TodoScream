import 'package:flutter/material.dart';

import '../../constants/font_color.dart';

class LoginInputTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;

  const LoginInputTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: FontColor.defaultColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: FontColor.defaultColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: FontColor.defaultColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
