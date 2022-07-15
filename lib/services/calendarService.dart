import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iit_csu_app/models/event.dart';

class CalendarService {
  final client = http.Client();
  static List<Event> events = [];
  static DateTime? _lastGettingData;
  bool _isNotFound = false;

  Future<List<Event>> getAllEvents() async {
    if (!_isNotFound && _lastGettingData != null &&
        DateTime.now().difference(_lastGettingData!).inMinutes <= 30) {
      return events;
    }
    //TODO переделать ссылку на свою api
    final response = await client
        .get(Uri.parse('https://62c1df322af60be89ecf22b2.mockapi.io/Event'));
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      events = List<Event>.from(l.map((model) => Event.fromJson(model)));
      _lastGettingData = DateTime.now();
    } else {
      _isNotFound = true;
      throw Exception('not found');
    }
    return events;
  }

  DateTime getDayStart() {
    DateTime today = DateTime.now();
    if (today.month >= DateTime.september) {
      return DateTime(today.year, DateTime.september);
    } else {
      return DateTime(today.year - 1, DateTime.september);
    }
  }

  DateTime getDayEnd() {
    DateTime today = DateTime.now();
    if (today.month >= DateTime.september) {
      return DateTime(today.year + 1, DateTime.september);
    } else {
      return DateTime(today.year, DateTime.september)
          .subtract(const Duration(days: 1));
    }
  }
}
