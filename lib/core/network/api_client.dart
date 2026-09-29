import 'package:dio/dio.dart';
import 'package:factus_reto_final/core/constants/api_constanst.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstanst.basrUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Accept': 'application/json',
        }
      ),
    );
  }
}
