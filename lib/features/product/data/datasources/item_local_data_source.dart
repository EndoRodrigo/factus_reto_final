import 'package:factus_reto_final/core/database/app_database.dart';

class ItemLocalDataSource {
  final AppDatabase _appDatabase;

  ItemLocalDataSource({required this._appDatabase});

  // CREATE: Insert item into SQLite
  Future<int> addItem({
    required String codeReference,
    required String name,
    required double quantity,
    required double discountRate,
    required double price,
    required String unitMeasureCode,
    required String standardCode,
  }) async {
    final db = await _appDatabase.database;
    final now = DateTime.now().toIso8601String();

    return await db.insert('items', {
      'codeReference': codeReference,
      'name': name,
      'quantity': quantity,
      'discountRate': discountRate,
      'price': price,
      'unitMeasureCode': unitMeasureCode,
      'standardCode': standardCode,
      'createdAt': now,
    });
  }

  // READ: Get all items from SQLite
  Future<List<Map<String, dynamic>>> getItems() async {
    final db = await _appDatabase.database;
    return await db.query('items', orderBy: 'id DESC');
  }

  // READ: Get item by ID
  Future<Map<String, dynamic>?> getItemById(int id) async {
    final db = await _appDatabase.database;
    final results = await db.query(
      'items',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return results.isNotEmpty ? results.first : null;
  }

  // UPDATE: Update an existing item
  Future<int> updateItem({
    required int id,
    required String codeReference,
    required String name,
    required double quantity,
    required double discountRate,
    required double price,
    required String unitMeasureCode,
    required String standardCode,
  }) async {
    final db = await _appDatabase.database;
    final now = DateTime.now().toIso8601String();

    return await db.update(
      'items',
      {
        'codeReference': codeReference,
        'name': name,
        'quantity': quantity,
        'discountRate': discountRate,
        'price': price,
        'unitMeasureCode': unitMeasureCode,
        'standardCode': standardCode,
        'updatedAt': now,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE: Delete item by ID
  Future<int> deleteItem(int id) async {
    final db = await _appDatabase.database;
    return await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
