import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/constants/custom_colors.dart';

class CheckboxAndTerms extends StatelessWidget {
  final String title;
  final bool isChecked;
  final ValueChanged onChanged;
  final VoidCallback onIconTap;
  const CheckboxAndTerms({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
    required this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => onChanged(!isChecked),
                child: Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(0, 2),
                      child: SizedBox(
                        height: 24,
                        width: 48,
                        child: Checkbox(
                          value: isChecked,
                          onChanged: onChanged,
                          checkColor: Colors.white,
                          fillColor: const MaterialStatePropertyAll(
                            CustomColors.subColor,
                          ),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: CustomColors.textDefaultColor,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: onIconTap,
                child: const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 1,
            color: CustomColors.lightPinkColor,
          ),
        ),
      ],
    );
  }
}
