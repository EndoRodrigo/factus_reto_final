import 'package:factus_reto_final/features/Establishments/data/datasources/Establishments_local_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../data/repositories/Establismet_repository_implements.dart';
import '../../domain/usecases/establishmest_use_case.dart';

final appDatabaseProvider = Provider((ref) {
  return AppDatabase();
});

final stablishmestDatasource = Provider((ref) {
  final appDatabase = ref.watch(appDatabaseProvider);
  return EstablishmentsLocalDataSource(appDatabase: appDatabase);
});

final estastablishmentsRepositoryProvider = Provider((ref){
  final datasource = ref.watch(stablishmestDatasource);
  return EstablismetRepositoryImplements(dataSource: datasource);
});

final stablishmentsUseCaseProvider = Provider((ref){
  final repository = ref.watch(estastablishmentsRepositoryProvider);
  return EstablishmestUseCase(repository: repository);
});

