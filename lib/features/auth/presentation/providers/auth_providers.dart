import 'package:factus_reto_final/core/network/TokenStorage.dart';
import 'package:factus_reto_final/features/auth/domain/usecases/auth_usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final tokenStorageProvider = Provider<Tokenstorage>((ref) {
  return Tokenstorage();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);

  return AuthRemoteDataSource(dio: apiClient.dio);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dataSource = ref.watch(authRemoteDataSourceProvider);
  final stogare = ref.watch(tokenStorageProvider);
  return AuthRepositoryImpl(dataSource: dataSource, storege: stogare);
});

final loginUseCaseProvider = Provider<AuthUsecases>((ref) {
  final repository = ref.watch(authRepositoryProvider);

  return AuthUsecases(repository: repository);
});