import 'package:factus_reto_final/core/database/app_database.dart';
import 'package:factus_reto_final/features/product/data/datasources/item_local_data_source.dart';
import 'package:factus_reto_final/features/product/data/repositories/item_repository_impl.dart';
import 'package:factus_reto_final/features/product/domain/usecases/create_item_usecase.dart';
import 'package:factus_reto_final/features/product/domain/usecases/get_items_usecase.dart';
import 'package:factus_reto_final/features/product/domain/usecases/update_item_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataBaseProvider = Provider((ref) {
  return AppDatabase();
});

final itemLocalDatasouresProvider = Provider((ref) {
  final appDatabase = ref.watch(dataBaseProvider);
  return ItemLocalDataSource(appDatabase: appDatabase);
});

final itemRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(itemLocalDatasouresProvider);
  return ItemRepositoryImpl(dataSource: dataSource);
});

final itemCreateUseCasesProvider = Provider((ref) {
  final repository = ref.watch(itemRepositoryProvider);
  return CreateItemUsecase(repository: repository);
});

final itemUpdateUseCasesProvider = Provider((ref) {
  final repository = ref.watch(itemRepositoryProvider);
  return UpdateItemUsecase(repository: repository);
});

final getItemsUseCaseProvider = Provider((ref) {
  final repository = ref.watch(itemRepositoryProvider);
  return GetItemsUsecase(repository: repository);
});
