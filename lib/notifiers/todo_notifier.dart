import 'package:flutter/material.dart';
import 'package:sqflite_test_0/notifiers/todo_state.dart';

class TodoNotifier extends InheritedNotifier<TodoState> {
  final TodoState todoState;
  const TodoNotifier({
    super.key,
    required this.todoState,
    required super.child,
  }) : super(notifier: todoState);

  static TodoState of(BuildContext context) {
    final notifier = context.dependOnInheritedWidgetOfExactType<TodoNotifier>();
    assert(notifier != null, 'No TodoNotifier found in context');
    return notifier!.todoState;
  }
}
