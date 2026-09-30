import 'package:factus_reto_final/features/auth/domain/entities/auth.dart';
import 'package:factus_reto_final/features/auth/domain/repositories/auth_repository.dart';

class AuthUsecases {
  final AuthRepository repository;

  new({required this.repository});

  Future<Auth> call() {
    return repository.login();
  }
}
