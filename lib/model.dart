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

class TodoListModel {
  final List<TodoItem> todos = [
    TodoItem(id: 1, text: "Eat", done: false),
    TodoItem(id: 2, text: "Watch Netflix", done: false),
    TodoItem(id: 3, text: "Play Games", done: false),
    TodoItem(id: 4, text: "Hack something", done: false),
  ];

  get size => todos.length;

  getByIndex(int index) => todos[index];

  void remove(int id) {
    todos.removeWhere((element) => id == element.id);
  }

  void setDone(int id, bool value) {
    var item = todos.firstWhere((element) => id == element.id);
    item.done = value;
  }

}