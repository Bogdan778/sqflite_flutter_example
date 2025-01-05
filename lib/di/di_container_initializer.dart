import 'package:sqflite_test_0/database/database_manager.dart';
import 'package:sqflite_test_0/di/di_container.dart';
import 'package:sqflite_test_0/notifiers/todo_state.dart';
import 'package:sqflite_test_0/repository/todo_repository.dart';

void diContainerInitializedI() {
  final DiContainer diContainer = DiContainer();

  diContainer.register<DatabaseManager>(DatabaseManagerImpl());
  diContainer.register<TodoRepository>(
    TodoRepositoryImpl(
      diContainer.getDependency<DatabaseManager>(),
    ),
  );
  diContainer.register(
    TodoState(diContainer.getDependency<TodoRepository>()),
  );
}
