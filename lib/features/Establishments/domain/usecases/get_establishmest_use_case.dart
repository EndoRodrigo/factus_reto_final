import 'package:factus_reto_final/features/Establishments/domain/repositories/establismet_repository.dart';

import '../entities/establishment.dart';

class GetEstablishmestUseCase {
  final EstablismetRepository repository;

  GetEstablishmestUseCase({required this.repository});

  Future<List<Establishment>> getEstabishmet() async {
    return await repository.getEstablishment();
  }
}
