import 'package:flutter/material.dart';
import 'package:simple_todo/model.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TodoListScreenState();
  }
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<TodoItem> todos = [
    TodoItem(id: 1, text: "Eat", done: false),
    TodoItem(id: 2, text: "Watch Netflix", done: false),
    TodoItem(id: 3, text: "Play Games", done: false),
    TodoItem(id: 4, text: "Hack something", done: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo-list'),
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _createNewItem,
          tooltip: 'New Task',
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            var todo = todos[index];
            return Dismissible(
              key: ValueKey(todo.id),
              child: ListTile(
                key: ValueKey(todo.id),
                title: Text(
                  todo.text,
                ),
                trailing: Checkbox(
                  value: todo.done,
                  onChanged: (bool? value) => _setDone(todo.id, value!),
                ),
                onLongPress: () => _updateItem(todo.id),
              ),
              onDismissed: (d) => _deleteItem(todo.id),
            );
          },
        ));
  }

  void _createNewItem() {}

  void _updateItem(int id) {}

  void _deleteItem(int id) {
    setState(() {
      todos.removeWhere((element) => id == element.id);
    });
  }

  void _setDone(int id, bool value) {
    setState(() {
      var item = todos.firstWhere((element) => id == element.id);
      item.done = value;
    });
  }
}
