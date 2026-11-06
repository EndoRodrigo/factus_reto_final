import 'package:sqflite/sqflite.dart';

import '../../../../core/database/app_database.dart';

class CustomerDataSourceLocal {
  final AppDatabase _appDatabase;

  CustomerDataSourceLocal(this._appDatabase);

  // CREATE: Add a new customer
  Future<int> addCustomer({
    required String identification,
    String? dv,
    String? company,
    String? tradeName,
    required String names,
    required String address,
    required String email,
    required String phone,
    String legalOrganizationId = '2',
    String tributeId = '21',
    int identificationDocumentId = 3,
    required String municipalityId,
  }) async {
    final db = await _appDatabase.database;
    final now = DateTime.now().toIso8601String();

    return await db.insert(
      'customers',
      {
        'identification': identification,
        'dv': dv,
        'company': company ?? '',
        'trade_name': tradeName ?? '',
        'names': names,
        'address': address,
        'email': email,
        'phone': phone,
        'legal_organization_id': legalOrganizationId,
        'tribute_id': tributeId,
        'identification_document_id': identificationDocumentId,
        'municipality_id': municipalityId,
        'createdAt': now,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // CREATE/INSERT: Insert from map
  Future<int> insertCustomerMap(Map<String, dynamic> customerMap) async {
    final db = await _appDatabase.database;
    final now = DateTime.now().toIso8601String();

    final mapToInsert = Map<String, dynamic>.from(customerMap);
    if (!mapToInsert.containsKey('createdAt')) {
      mapToInsert['createdAt'] = now;
    }

    return await db.insert(
      'customers',
      mapToInsert,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // READ: Get all customers with pagination
  Future<List<Map<String, dynamic>>> getCustomers({
    int limit = 50,
    int offset = 0,
  }) async {
    final db = await _appDatabase.database;

    return await db.query(
      'customers',
      orderBy: 'id DESC',
      limit: limit,
      offset: offset,
    );
  }

  // READ: Get customer by ID
  Future<Map<String, dynamic>?> getCustomerById(int id) async {
    final db = await _appDatabase.database;
    final results = await db.query(
      'customers',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    return results.isNotEmpty ? results.first : null;
  }

  // READ: Get customer by Identification (NIT/Cédula)
  Future<Map<String, dynamic>?> getCustomerByIdentification(
    String identification,
  ) async {
    final db = await _appDatabase.database;
    final results = await db.query(
      'customers',
      where: 'identification = ?',
      whereArgs: [identification],
      limit: 1,
    );
    return results.isNotEmpty ? results.first : null;
  }

  // READ: Search customers by names or identification
  Future<List<Map<String, dynamic>>> searchCustomers(String query) async {
    final db = await _appDatabase.database;
    final search = '%$query%';

    return await db.query(
      'customers',
      where: 'names LIKE ? OR identification LIKE ? OR company LIKE ?',
      whereArgs: [search, search, search],
      orderBy: 'id DESC',
    );
  }

  // UPDATE: Update an existing customer
  Future<int> updateCustomer({
    required int id,
    required String identification,
    String? dv,
    String? company,
    String? tradeName,
    required String names,
    required String address,
    required String email,
    required String phone,
    String legalOrganizationId = '2',
    String tributeId = '21',
    int identificationDocumentId = 3,
    required String municipalityId,
  }) async {
    final db = await _appDatabase.database;
    final now = DateTime.now().toIso8601String();

    return await db.update(
      'customers',
      {
        'identification': identification,
        'dv': dv,
        'company': company ?? '',
        'trade_name': tradeName ?? '',
        'names': names,
        'address': address,
        'email': email,
        'phone': phone,
        'legal_organization_id': legalOrganizationId,
        'tribute_id': tributeId,
        'identification_document_id': identificationDocumentId,
        'municipality_id': municipalityId,
        'updatedAt': now,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // UPDATE: Update from map
  Future<int> updateCustomerMap(
    int id,
    Map<String, dynamic> customerMap,
  ) async {
    final db = await _appDatabase.database;
    final now = DateTime.now().toIso8601String();

    final mapToUpdate = Map<String, dynamic>.from(customerMap);
    mapToUpdate['updatedAt'] = now;

    return await db.update(
      'customers',
      mapToUpdate,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE: Delete customer by ID
  Future<int> deleteCustomer(int id) async {
    final db = await _appDatabase.database;
    return await db.delete(
      'customers',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
