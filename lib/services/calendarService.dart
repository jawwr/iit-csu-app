import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iit_csu_app/services/userService.dart';

import '../models/calendarEvents.dart';
import '../models/user.dart';

class CalendarService {
  final User _user = UserService.user!;
  final _client = http.Client();
  static CalendarEvents? events;

  Future<CalendarEvents> getAllEvents() async {
    final response = await _client.get(Uri.parse(
        'http://10.0.2.2:8081/api/events?group=${_user.groupName}')); //TODO переделать ссылку на свою api
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
