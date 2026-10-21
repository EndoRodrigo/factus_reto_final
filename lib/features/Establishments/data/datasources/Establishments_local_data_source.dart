import '../../../../core/database/app_database.dart';
import '../models/Establismet_model.dart';

class EstablishmentsLocalDataSource {
  final AppDatabase appDatabase;

  new({required this.appDatabase});

  Future<int> addEstablishment({
    required EstablismetModel establishment,
  }) async {
    final db = await appDatabase.database;
    //final now = DateTime.now().toIso8601String();
    return await db.insert('Establishments', establishment.toMap());
  }
}
