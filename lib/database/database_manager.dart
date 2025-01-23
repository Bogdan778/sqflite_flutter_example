import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract interface class DatabaseManager {
  Future<void> openDb();

  Future<void> insert(String table, Map<String, dynamic> data);

  Future<List<Map<String, Object?>>> retrieve(String table);

  Future<dynamic> rawQuery(String query, [List<dynamic>? arguments]);

  Future<void> closeDb();

  Future<void> update(
    String table,
    Map<String, dynamic> data,
  );

  Future<void> delete(String table, String id);
}

class DatabaseManagerImpl implements DatabaseManager {
  late Database database;

  @override
  Future<void> openDb() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'database.db'),
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE todo(id TEXT PRIMARY KEY, title TEXT, description TEXT, isDone INTEGER)');
      },
      version: 1,
    );
  }

  @override
  Future<void> insert(String table, Map<String, dynamic> data) =>
      database.insert(
        table,
        data,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

  @override
  Future<List<Map<String, Object?>>> retrieve(String table) =>
      database.query(table);

  @override
  Future<void> update(String table, Map<String, dynamic> data) =>
      database.update(
        table,
        data,
        where: 'id = ?',
        whereArgs: [data['id']],
      );

  @override
  Future<void> delete(String table, String id) => database.delete(
        table,
        where: 'id = ?',
        whereArgs: [id],
      );

  @override
  Future<void> closeDb() => database.close();

  @override
  Future rawQuery(String query, [List<dynamic>? arguments]) {
    return database.rawQuery(
      query,
      arguments,
    );
  }
}
