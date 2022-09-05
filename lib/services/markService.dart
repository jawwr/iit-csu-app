import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iit_csu_app/models/mark.dart';
import 'package:iit_csu_app/services/userService.dart';

import '../models/user.dart';

class MarkService{
  final _client = http.Client();
  static List<Mark>? marks;

  Future<List<Mark>> getAllMarks() async{
    final User user = UserService.user!;
    //TODO переделать ссылку на свою api
    final response = await _client
        .get(Uri.parse('http://10.0.2.2:8081/api/marks'));
    if (response.statusCode == 200) {
      Iterable l = json.decode(utf8.decode(response.bodyBytes));
      marks = List<Mark>.from(l.map((model) => Mark.fromJson(model)));
    } else {
      throw Exception('not found');
    }
    return marks!;
  }

}