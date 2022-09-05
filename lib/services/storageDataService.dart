import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _StoragePreferenceKey{
  static const String loginKey = 'login_key';
  static const String passwordKey = 'password_key';
}

class StorageDataService{
  final _storage = const FlutterSecureStorage();

  Future<String?> readLoginData() async{
    return await _storage.read(key: _StoragePreferenceKey.loginKey);
  }

  Future<String?> readPasswordData() async{
    return await _storage.read(key: _StoragePreferenceKey.passwordKey);
  }

  Future<void> setLoginData(String login) async{
    _storage.write(key: _StoragePreferenceKey.loginKey, value: login);
  }

  Future<void> setPasswordData(String password) async{
    _storage.write(key: _StoragePreferenceKey.passwordKey, value: password);
  }

  Future<void> exit() async{
    _storage.deleteAll();
  }
}