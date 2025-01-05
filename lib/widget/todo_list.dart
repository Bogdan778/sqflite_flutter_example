import 'package:flutter/material.dart';
import 'package:sqflite_test_0/notifiers/todo_notifier.dart';
import 'package:sqflite_test_0/widget/todo_tile.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = TodoNotifier.of(context).todos;

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final todo = todoList[index];
        return TodoTileComponent(todo: todo);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: todoList.length,
    );
  }
}
