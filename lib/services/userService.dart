import 'dart:convert';
import 'dart:io';

import 'package:iit_csu_app/services/storageDataService.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  final _storage = StorageDataService();
  static User? user;
  static bool userIsAuth = false;


  Future<void> loginUser({required String login, required String password}) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8082/api/auth/signIn'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'login': login, 'password': password}),
    );
    if(response.statusCode == 200){
      userIsAuth = true;
      _storage.setLoginData(login);
      _storage.setPasswordData(password);
      // user = await _getUserData(login);
    }else{
      throw Exception('Ошибка авторизации');
    }
  }

  Future<User> _getUserData(String login) async{
    final queryParameters = {"login": login};
    final uri = Uri.http('localhost:8082/api/user/me', '/path', queryParameters);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri, headers: headers);
    User user = userFromJson(utf8.decode(response.bodyBytes));
    return user;
  }

  Future<void> entryWithStorageData() async{
    String? login = await _storage.readLoginData();
    String? password = await _storage.readPasswordData();
    print("автоматический вход");
    if(login != null && password != null){
      loginUser(login: login, password: password);
    }
  }

  Future<String?> getStorageDataLogin() async{
    String? login = await _storage.readLoginData();
    return login;
  }

  Future<void> logOutUser() async{
    http.post(Uri.parse('http://10.0.2.2:8081/api/user/logout'));
    user = null;
    userIsAuth = false;
    _storage.exit();
  }
}
