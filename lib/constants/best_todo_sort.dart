import 'package:flutter_application_todo_scream/constants/todo_list.dart';

List<Map> sortedTodoList = List.from(todoList)
  ..sort((a, b) {
    final int aView = int.parse(a['view'].replaceAll(",", ""));
    final int bView = int.parse(b['view'].replaceAll(",", ""));
    final int aRecomand = int.parse(a['recomand']);
    final int bRecomand = int.parse(b['recomand']);
    if (aRecomand == bRecomand) {
      return bView.compareTo(aView);
    }
    return bRecomand.compareTo(aRecomand);
  });
