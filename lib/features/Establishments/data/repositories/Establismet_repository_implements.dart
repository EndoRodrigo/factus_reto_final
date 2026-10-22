import 'package:factus_reto_final/features/Establishments/domain/entities/establishment.dart';

import '../../domain/repositories/establismet_repository.dart';
import '../datasources/Establishments_local_data_source.dart';
import '../mappers/establishment_mapper.dart';

class EstablismetRepositoryImplements implements EstablismetRepository {
  final EstablishmentsLocalDataSource dataSource;

  EstablismetRepositoryImplements({required this.dataSource});

  @override
  Future<int> addItem({required Establishment establishment}) async {
    final model = EstablishmentMapper.toModel(establishment);
    return await dataSource.addEstablishment(establishment: model);
  }
}
