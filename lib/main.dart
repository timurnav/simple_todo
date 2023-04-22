import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/model.dart';
import 'package:simple_todo/todo_list_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TodoListModel>(create: (ctx) => TodoListModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo App',
      home: TodoListScreen(),
    );
  }
}
