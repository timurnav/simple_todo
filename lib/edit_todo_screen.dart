import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTodoScreen extends StatefulWidget {
  final int? id;

  const EditTodoScreen({Key? key, this.id}) : super(key: key);

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == null ? 'Create todo' : 'Edit todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What to do?',
              ),
              controller: _controller,
            ),
            OutlinedButton(
              onPressed: _saveTodo,
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }

  void _saveTodo() {
    var text = _controller.text;
    print('todo to save $text');
  }
}
