import 'package:factus_reto_final/features/Establishments/domain/repositories/establismet_repository.dart';

import '../entities/establishment.dart';

class EstablishmestUseCase {
  final EstablismetRepository repository;
  EstablishmestUseCase({required this.repository});

  Future<int> addItem({required Establishment establishment}) async {
    return await repository.addItem(establishment: establishment);
  }
}
