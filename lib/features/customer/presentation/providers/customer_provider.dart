import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../data/datasources/customer_data_source_local.dart';
import '../../data/repositories/customer_repository_impl.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../domain/usecases/create_customer_usecase.dart';
import '../../domain/usecases/delete_customer_usecase.dart';
import '../../domain/usecases/get_customers_usecase.dart';
import '../../domain/usecases/search_customers_usecase.dart';
import '../../domain/usecases/update_customer_usecase.dart';

final customerDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final customerLocalDataSourceProvider = Provider<CustomerDataSourceLocal>((ref) {
  final db = ref.watch(customerDatabaseProvider);
  return CustomerDataSourceLocal(db);
});

final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  final dataSource = ref.watch(customerLocalDataSourceProvider);
  return CustomerRepositoryImpl(dataSource: dataSource);
});

final createCustomerUsecaseProvider = Provider<CreateCustomerUsecase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return CreateCustomerUsecase(repository: repository);
});

final getCustomersUsecaseProvider = Provider<GetCustomersUsecase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return GetCustomersUsecase(repository: repository);
});

final searchCustomersUsecaseProvider = Provider<SearchCustomersUsecase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return SearchCustomersUsecase(repository: repository);
});

final updateCustomerUsecaseProvider = Provider<UpdateCustomerUsecase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return UpdateCustomerUsecase(repository: repository);
});

final deleteCustomerUsecaseProvider = Provider<DeleteCustomerUsecase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return DeleteCustomerUsecase(repository: repository);
});
