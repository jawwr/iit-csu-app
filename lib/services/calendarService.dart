import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:iit_csu_app/services/userService.dart';

import '../models/calendarEvents.dart';
import '../models/user.dart';

class CalendarService {
  final UserService _service = UserService();
  final _client = http.Client();
  static CalendarEvents? events;

  Future<CalendarEvents> getAllEvents() async {
    final String? login = await _service.getStorageDataLogin().then((value) => value);
    final queryParameters = {"login": login};
    final uri = Uri.http('http://10.0.2.2:8082/api/events', '/path', queryParameters);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri, headers: headers);
    // final response = await http.get(
    //     Uri.parse('http://10.0.2.2:8081/api/events'),
    //   headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // },
    //   body: jsonEncode(
    //       <String, String>{'login': _user.login, 'password': _user.password}),); //TODO переделать ссылку на свою api
    if (response.statusCode == 200) {
      events = calendarEventsFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('not found');
    }
    return events!;
  }

  DateTime getDayStart() {
    DateTime today = DateTime.now();
    if (today.month >= DateTime.september) {
      return DateTime(
        today.year,
        DateTime.september,
      );
    } else {
      return DateTime(
        today.year - 1,
        DateTime.september,
      );
    }
  }

  //TODO доделать
  DateTime getDayEnd() {
    DateTime today = DateTime.now();
    if (today.month >= DateTime.september) {
      return DateTime(
        today.year + 1,
        DateTime.september,
      );
    } else {
      return DateTime(
        today.year,
        DateTime.september,
      ).subtract(
        const Duration(
          days: 1,
        ),
      );
    }
  }
}
