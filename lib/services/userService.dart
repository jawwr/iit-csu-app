import 'dart:convert';

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
      // final response = await http.get(Uri.parse('http://10.0.2.2:8081/api/user/authUser'));
      // user = userFromJson(utf8.decode(response.bodyBytes));
      _storage.setLoginData(login);
      _storage.setPasswordData(password);
    }else{
      throw Exception('Ошибка авторизации');
    }
  }

  Future<void> entryWithStorageData() async{
    String? login = await _storage.readLoginData();
    String? password = await _storage.readLoginData();
    if(login != null && password != null){
      loginUser(login: login, password: password);
    }
  }

  Future<void> logOutUser() async{
    http.post(Uri.parse('http://10.0.2.2:8081/api/user/logout'));
    user = null;
    userIsAuth = false;
    _storage.exit();
  }
}
