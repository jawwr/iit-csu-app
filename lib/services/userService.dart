import 'dart:convert';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static User? user;
  static bool userIsAuth = false;

  static Future<void> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8081/api/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'email': email, 'password': password}),
    );
    if(response.statusCode == 200){
      userIsAuth = true;
      final response = await http.get(Uri.parse('http://10.0.2.2:8081/api/user/authUser'));
      user = userFromJson(utf8.decode(response.bodyBytes));
    }
  }
}
