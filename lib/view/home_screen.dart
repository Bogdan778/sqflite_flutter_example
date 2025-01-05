import 'package:flutter/material.dart';
import 'package:sqflite_test_0/di/di_container.dart';
import 'package:sqflite_test_0/notifiers/todo_notifier.dart';
import 'package:sqflite_test_0/notifiers/todo_state.dart';
import 'package:sqflite_test_0/widget/add_todo_button.dart';
import 'package:sqflite_test_0/widget/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoNotifier(
      todoState: DiContainer().getDependency<TodoState>()..retrieveTodos(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Expanded(
                  child: TodoList(),
                ),
                AddTodoButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
