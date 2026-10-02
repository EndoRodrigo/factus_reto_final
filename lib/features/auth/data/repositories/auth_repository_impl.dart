import 'package:factus_reto_final/core/network/TokenStorage.dart';
import 'package:factus_reto_final/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:factus_reto_final/features/auth/data/mappers/auth_mapper.dart';
import 'package:factus_reto_final/features/auth/domain/entities/auth.dart';
import 'package:factus_reto_final/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource dataSource;
  final Tokenstorage storege;

  new({required this.dataSource, required this.storege});

  @override
  Future<Auth> login() async{
    final model = await dataSource.login();
    await storege.saveTokens(accessToken: model.accessToken, refreshToken: model.refreshToken);
    return AuthMapper.toEntity(model);
  }

}