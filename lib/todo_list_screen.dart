import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/model.dart';

import 'edit_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TodoListScreenState();
  }
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<TodoListModel>(context);
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
          itemCount: model.size,
          itemBuilder: (BuildContext context, int index) {
            var todo = model.getByIndex(index);
            return Dismissible(
              key: ValueKey(todo.id),
              child: ListTile(
                key: ValueKey(todo.id),
                title: Text(
                  todo.text,
                ),
                trailing: Checkbox(
                  value: todo.done,
                  onChanged: (bool? value) => TodoListModel().setDone(todo.id, value!),
                ),
                onLongPress: () => _updateItem(todo.id),
              ),
              onDismissed: (d) => TodoListModel().remove(todo.id),
            );
          },
        ));
  }

  void _createNewItem() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => EditTodoScreen()),
    );
  }

  void _updateItem(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => EditTodoScreen(id: id)),
    );
  }
}
