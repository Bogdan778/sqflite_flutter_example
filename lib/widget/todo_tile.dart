import 'package:flutter/material.dart';
import 'package:sqflite_test_0/model/todo_model.dart';
import 'package:sqflite_test_0/notifiers/todo_notifier.dart';

class TodoTileComponent extends StatelessWidget {
  final Todo todo;
  const TodoTileComponent({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(todo.title, style: Theme.of(context).textTheme.bodyLarge),
      childrenPadding:
          const EdgeInsets.symmetric(horizontal: 15).copyWith(right: 24),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      trailing: _buildCheckboxButton(todo, context),
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(todo.description),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                TodoNotifier.of(context).deleteTodo(todo.id);
              },
              color: Colors.red,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCheckboxButton(Todo todo, BuildContext context) {
    return Checkbox(
      value: todo.isDone,
      onChanged: (value) {
        TodoNotifier.of(context).toggleTodoStatus(
          value ?? false,
          todo.id,
        );
      },
    );
  }
}
