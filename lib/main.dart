import 'package:flutter/material.dart';
import 'package:sqflite_test_0/database/database_manager.dart';
import 'package:sqflite_test_0/di/di_container.dart';
import 'package:sqflite_test_0/di/di_container_initializer.dart';
import 'package:sqflite_test_0/theme/base_theme.dart';
import 'package:sqflite_test_0/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  diContainerInitializedI();
  final db = DiContainer().getDependency<DatabaseManager>();
  await db.openDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: BaseTheme.lightTheme,
    );
  }
}
