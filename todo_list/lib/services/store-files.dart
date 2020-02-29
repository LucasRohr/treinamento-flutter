import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File> getTodoListFile() async {
  final directory = await getApplicationDocumentsDirectory();
  return File('${directory.path}/todo-list.json');
}

Future<File> saveTodo(List todoList) async {
  String data = json.encode(todoList);
  final file = await getTodoListFile();

  return file.writeAsString(data);
}

Future<String> getTodoList() async {
  try {
    final file = await getTodoListFile();
    return file.readAsString();

  } catch (error) {
    return null;
  }
}
