import 'package:sqflite_test_0/database/database_manager.dart';
import 'package:sqflite_test_0/model/todo_model.dart';

abstract interface class TodoRepository {
  Future<void> insert(Todo todo);

  Future<List<Todo>> retrieve();

  Future<void> update(Todo todo);

  Future<void> delete(String id);
}

class TodoRepositoryImpl implements TodoRepository {
  final DatabaseManager _databaseManager;
  TodoRepositoryImpl(this._databaseManager);

  final _table = 'todo';

  @override
  Future<void> delete(String id) => _databaseManager.delete(_table, id);

  @override
  Future<void> insert(Todo todo) => _databaseManager.insert(
        _table,
        todo.toMap(),
      );

  @override
  Future<List<Todo>> retrieve() async {
    final todosMap = await _databaseManager.retrieve(_table);
    return todosMap.map((todoMap) => Todo.fromMap(todoMap)).toList();
  }

  @override
  Future<void> update(Todo todo) => _databaseManager.update(
        _table,
        todo.toMap(),
      );
}
