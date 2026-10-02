import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Tokenstorage {
  static const _accessToekn = 'accessToken';
  static const _refreshToekn = 'refreshToekn';

  final FlutterSecureStorage storage;

  new({this.storage = const FlutterSecureStorage()});

  Future<void> saveTokens({required String accessToken, required String refreshToken}) async{
    await storage.write(key: _accessToekn, value: accessToken);
    await storage.write(key: _refreshToekn, value: refreshToken);
  }

  Future<String?> getAccessToken()async{
    return await storage.read(key: _accessToekn);
  }

  Future<String?> getRefreshToken()async{
    return await storage.read(key: _refreshToekn);
  }

  Future<void> clearToken()async{
    await storage.delete(key: _accessToekn);
    await storage.delete(key: _refreshToekn);
  }

}