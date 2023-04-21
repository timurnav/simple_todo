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
            return ListTile(
              key: ValueKey(todo.id),
              title: Text(
                todo.text,
              ),
              trailing: Checkbox(
                value: todo.done,
                onChanged: (bool? value) {
                  setState(() {
                    todo.done = !todo.done;
                  });
                },
              ),
            );
          },
        ));
  }

  void _createNewItem() {}
}
