import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();

  factory AppDatabase() => instance;

  AppDatabase._internal();

  static Database? _database;

  Future<Database> _initDataDabe() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, 'factus.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        codeReference TEXT NOT NULL UNIQUE,
        name TEXT NOT NULL,
        quantity REAL NOT NULL DEFAULT 1,
        discountRate REAL NOT NULL DEFAULT 0,
        price REAL NOT NULL,
        unitMeasureCode TEXT NOT NULL,
        standardCode TEXT NOT NULL,
        createdAt TEXT NOT NULL,
        updatedAt TEXT
      );
      ''');
  }

  //Implementacion onUpgrade: _onUpgrade

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDataDabe();

    return _database!;
  }
}
