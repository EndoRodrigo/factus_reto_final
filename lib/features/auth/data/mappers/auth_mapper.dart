import 'package:factus_reto_final/features/auth/data/models/auth_model.dart';

import '../../domain/entities/auth.dart';

class AuthMapper {
  static Auth toEntity(AuthModel auth) {
    return Auth(
      tokenType: auth.tokenType,
      expiresIn: auth.expiresIn,
      accessToken: auth.accessToken,
      refreshToken: auth.refreshToken,
    );
  }
}
