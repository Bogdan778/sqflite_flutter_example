import 'package:mocktail/mocktail.dart';
import 'package:sqflite_test_0/database/database_manager.dart';
import 'package:sqflite_test_0/model/todo_model.dart';
import 'package:sqflite_test_0/notifiers/todo_state.dart';
import 'package:test/test.dart';

class TodoStateMock extends Mock implements TodoState {}

class DataBaseManagerMock extends Mock implements DatabaseManager {}

class TodoMock extends Mock implements Todo {}

void main() {
  late TodoState todoState;
  setUpAll(() {
    todoState = TodoStateMock();
    registerFallbackValue(TodoMock());
  });
  final todo = Todo(
    id: '1',
    title: 'title',
    description: 'description',
    isDone: false,
  );
  group('notifier test', () {
    test('create todo', () async {
      when(() => todoState.createTodo(any())).thenAnswer((_) => Future.value());
      when(() => todoState.todos).thenReturn([todo]);

      await todoState.createTodo(todo);

      verify(() => todoState.createTodo(todo)).called(1);
      expect(todoState.todos, contains(todo));
    });

    test('retrieve todos', () async {
      when(() => todoState.retrieveTodos()).thenAnswer((_) => Future.value());
      when(() => todoState.todos).thenReturn([todo]);

      await todoState.retrieveTodos();

      verify(() => todoState.retrieveTodos()).called(1);
      expect(todoState.todos, contains(todo));
    });

    test('delete todo', () async {
      when(() => todoState.deleteTodo(any())).thenAnswer((_) => Future.value());
      when(() => todoState.todos).thenReturn([]);

      await todoState.deleteTodo(todo.id);

      verify(() => todoState.deleteTodo(todo.id)).called(1);
      expect(todoState.todos, isNot(contains(todo)));
    });

    test('toggle is done button', () async {
      when(() => todoState.toggleTodoStatus(any(), todo.id))
          .thenAnswer((_) => Future.value());
      when(() => todoState.retrieveSpecificTodo(todo.id))
          .thenAnswer((_) => Future.value());
      when(() => todoState.todos).thenReturn([todo]);

      await todoState.toggleTodoStatus(true, todo.id);

      verify(() => todoState.toggleTodoStatus(true, todo.id)).called(1);
      expect(todoState.todos.first.isDone, true);
    });
  });
}
