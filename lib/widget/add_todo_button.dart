import 'package:flutter/material.dart';
import 'package:sqflite_test_0/model/todo_model.dart';
import 'package:sqflite_test_0/notifiers/todo_notifier.dart';
import 'package:sqflite_test_0/widget/create_todo_popup.dart';
import 'package:uuid/uuid.dart';

class AddTodoButton extends StatefulWidget {
  const AddTodoButton({super.key});

  @override
  State<AddTodoButton> createState() => _AddTodoButtonState();
}

class _AddTodoButtonState extends State<AddTodoButton> {
  final Uuid _uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final TodoData? todoData = await showModalBottomSheet(
            context: context,
            builder: (context) => const CreateTodoPopup(),
          );
          if (todoData != null &&
              todoData.title.isNotEmpty &&
              context.mounted) {
            final todoState = TodoNotifier.of(context);
            todoState.createTodo(
              Todo(
                id: _uuid.v4(),
                title: todoData.title,
                description: todoData.description,
              ),
            );
          }
        },
        child: const Text('Add Todo'),
      ),
    );
  }
}
