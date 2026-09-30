import 'package:dio/dio.dart';
import 'package:factus_reto_final/core/constants/api_constanst.dart';
import 'package:factus_reto_final/core/constants/app_config.dart';
import 'package:factus_reto_final/features/auth/data/models/auth_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  new({required this.dio});

  Future<AuthModel> login() async {
    final response = await dio.post(
      ApiConstanst.authUrl,
      data: {
        'grant_type': 'password',
        'username': AppConfig.username,
        'password': AppConfig.password,
        'client_id': AppConfig.clientId,
        'client_secret': AppConfig.clientSecret,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    return AuthModel.fromJson(response.data);
  }
}
