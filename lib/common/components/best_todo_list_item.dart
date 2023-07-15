import 'package:flutter/material.dart';
import 'package:flutter_application_todo_scream/constants/custom_colors.dart';

class BestTodoListItem extends StatelessWidget {
  final Map todo;

  const BestTodoListItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(todo['profile']),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(todo['title']),
                    Text(
                      todo['comment'],
                      style: const TextStyle(
                        color: CustomColors.textDefaultColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      todo['id'],
                      style: const TextStyle(
                        color: CustomColors.textDefaultColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "조회 ",
                      style: TextStyle(
                        color: CustomColors.textDefaultColor,
                      ),
                    ),
                    Text(
                      todo['view'],
                      style: const TextStyle(
                        color: CustomColors.textDefaultColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "추천 ",
                      style: TextStyle(
                        color: CustomColors.textDefaultColor,
                      ),
                    ),
                    Text(
                      todo['recomand'],
                      style: const TextStyle(
                        color: CustomColors.textDefaultColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              todo['date'],
              style: const TextStyle(
                color: CustomColors.textDefaultColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
