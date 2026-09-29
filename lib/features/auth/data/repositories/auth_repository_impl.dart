import 'package:factus_reto_final/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:factus_reto_final/features/auth/data/mappers/auth_mapper.dart';
import 'package:factus_reto_final/features/auth/domain/entities/auth.dart';
import 'package:factus_reto_final/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource dataSource;

  new({required this.dataSource});

  @override
  Future<Auth> login(String username, String password, String clientID, String clientSecret) async{
    final model = await dataSource.login(username, password, clientID, clientSecret);
    return AuthMapper.toEntity(model);
  }

}