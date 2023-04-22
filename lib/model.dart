import 'package:flutter/material.dart';

class TodoItem {
  final int id;
  String text;
  bool done;

  TodoItem({
    required this.id,
    required this.text,
    required this.done,
  });
}

class TodoListModel extends ChangeNotifier {
  static final TodoListModel _singleton = TodoListModel._internal();

  TodoListModel._internal();

  factory TodoListModel() {
    return _singleton;
  }

  int _idCounter = 1;

  final List<TodoItem> todos = [];

  get size => todos.length;

  TodoItem getByIndex(int index) => todos[index];

  String getText(int id) => todos.firstWhere((element) => id == element.id).text;

  void remove(int id) {
    todos.removeWhere((element) => id == element.id);
    notifyListeners();
  }

  void setDone(int id, bool value) {
    var item = todos.firstWhere((element) => id == element.id);
    item.done = value;
    notifyListeners();
  }

  void create(String text) {
    todos.add(TodoItem(id: _idCounter++, text: text, done: false));
    notifyListeners();
  }

  void update(int id, String text) {
    var todo = todos.firstWhere((element) => id == element.id);
    todo.text = text;
    notifyListeners();
  }
}
