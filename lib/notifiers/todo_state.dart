import 'package:flutter/material.dart';
import 'package:sqflite_test_0/model/todo_model.dart';
import 'package:sqflite_test_0/repository/todo_repository.dart';

class TodoState extends ChangeNotifier {
  final TodoRepository _todoRepository;
  TodoState(this._todoRepository);

  final List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> createTodo(Todo todo) async {
    await _todoRepository.insert(todo);
    _todos.add(todo);

    notifyListeners();
    retrieveTodos();
  }

  Future<void> retrieveTodos() async {
    final todos = await _todoRepository.retrieve();
    _todos.clear();
    _todos.addAll(todos);

    notifyListeners();
  }

  Future<void> toggleTodoStatus(bool value, String id) async {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    await _todoRepository.update(todo.copyWith(isDone: value));

    notifyListeners();
    retrieveTodos();
  }

  Future<void> deleteTodo(String id) async {
    await _todoRepository.delete(id);
    notifyListeners();
    retrieveTodos();
  }
}
