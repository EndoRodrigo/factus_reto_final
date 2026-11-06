import 'package:sqflite/sqflite.dart';

import '../../../../core/database/app_database.dart';
import '../models/Establismet_model.dart';

class EstablishmentsLocalDataSource {
  final AppDatabase appDatabase;

  EstablishmentsLocalDataSource({required this.appDatabase});

  Future<int> addEstablishment({
    required EstablismetModel establishment,
  }) async {
    final db = await appDatabase.database;
    return await db.insert(
      'establishment',
      establishment.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<EstablismetModel>> getEstablishments() async {
    final db = await appDatabase.database;
    final result = await db.query('establishment', orderBy: 'id DESC');
    return result.map((json) => EstablismetModel.fromMap(json)).toList();
  }
}
