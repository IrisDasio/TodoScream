import 'package:flutter/material.dart';

import '../../constants/custom_colors.dart';

class SignUpInTextFormField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final Function(String) onChanged;
  final String? Function(String?)? validator;

  const SignUpInTextFormField({
    super.key,
    required this.labelText,
    required this.obscureText,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.always,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(color: CustomColors.defaultColor),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.defaultColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.defaultColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
          ),
          onChanged: onChanged,
          validator: validator,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
