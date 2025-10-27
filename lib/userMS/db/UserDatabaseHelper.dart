import 'package:path/path.dart';
import "package:sqflite/sqflite.dart";

import "../model/User.dart";

class UserDatabaseHelper {
  static final UserDatabaseHelper _instance = UserDatabaseHelper._internal();
  factory UserDatabaseHelper() => _instance;
  UserDatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT,
        avatar TEXT,
        dateOfBirth TEXT
      )
    ''');
  }

  Future<int> insertUser(User user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<User?> getUser(int id) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<List<User>> getAllUsers() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query('users');
    return maps.map((map) => User.fromMap(map)).toList();
  }

  Future<int> updateUser(User user) async {
    final db = await database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    final db = await database;
    db.close();
  }

  // tạo data mẫu
  Future<void> createSampleData() async {
    final sampleUsers = [
      User(
        name: 'Alice',
        email: 'alice@example.com',
        password: 'password123',
        dateOfBirth: DateTime(1990, 5, 15),
      ),
      User(
        name: 'Bob',
        email: 'bob@example.com',
        password: 'password123',
        dateOfBirth: DateTime(1992, 8, 22),
      ),
      User(
        name: 'Charlie',
        email: 'charlie@example.com',
        password: 'password123',
        dateOfBirth: DateTime(1988, 12, 3),
      ),
      User(
        name: 'Diana',
        email: 'diana@example.com',
        password: 'password123',
        dateOfBirth: DateTime(1995, 3, 30),
      ),
    ];
    for (var user in sampleUsers) {
      await insertUser(user);
    }
  }
}
