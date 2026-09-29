import 'package:dio/dio.dart';
import 'package:factus_reto_final/core/constants/api_constanst.dart';
import 'package:factus_reto_final/features/auth/data/models/auth_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  new({required this.dio});

  Future<AuthModel> login(String username,
      String password,
      String clientID,
      String clientSecret,) async {
    final response = await dio.post(
        ApiConstanst.authUrl,
        data: {
          'grant_type': 'password',
          'username': username,
          'password': password,
          'client_id': clientID,
          'client_secret': password,
        },
        options: Options(
            contentType: Headers.formUrlEncodedContentType,
        )
    );

    return AuthModel.fromJson(response.data);

  }
}
