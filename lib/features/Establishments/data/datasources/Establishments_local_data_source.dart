import '../../../../core/database/app_database.dart';
import '../models/Establismet_model.dart';

class EstablishmentsLocalDataSource {
  final AppDatabase appDatabase;

  EstablishmentsLocalDataSource({required this.appDatabase});

  Future<int> addEstablishment({
    required EstablismetModel establishment,
  }) async {
    final db = await appDatabase.database;
    return await db.insert('establishment', establishment.toMap());
  }
}
