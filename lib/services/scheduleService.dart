import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iit_csu_app/models/lesson.dart';
import 'package:iit_csu_app/services/userService.dart';

class ScheduleService{
  final UserService _service = UserService();
  static Schedule? schedule;

  //TODO сделать нормальное получение расписания
  Future<Schedule> getSchedule() async {
    final String? login = await _service.getStorageDataLogin().then((value) => value);

    var request = http.Request(
      'GET',
      Uri.parse("http://10.0.2.2:8082/api/schedule"),
    )
      ..headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
      })
      ..body = jsonEncode({
        "login": login
      });
    final response = await request.send();

    // final queryParameters = {"login": login};
    // final uri = Uri.http('http://10.0.2.2:8082/api/schedule', '/path', queryParameters);
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    // final response = await http.get(uri, headers: headers);
    // final response = await http.get(
    //     Uri.parse('http://10.0.2.2:8081/api/events'),
    //   headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    // },
    //   body: jsonEncode(
    //       <String, String>{'login': _user.login, 'password': _user.password}),); //TODO переделать ссылку на свою api
    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      schedule = scheduleFromJson(responseBody);
    } else {
      throw Exception('not found');
    }
    return schedule!;
  }

  bool _compareTime(TimeOfDay timeFirst, TimeOfDay timeSecond) =>
      timeFirst.hour > timeSecond.hour ||
          timeFirst.hour == timeSecond.hour &&
              timeFirst.minute >= timeSecond.minute;

  bool lessonIsNow(Lesson lesson) {
    var timeNow = TimeOfDay.now();
    return _compareTime(timeNow, lesson.timeStart) &&
        _compareTime(lesson.timeEnd, timeNow);
  }

  Day getToday(Schedule schedule){
    int today = DateTime.now().weekday - 1;
    if(today == 6){
      today = 0;
      today = 0;
    }
    Week currentWeek = getCurrentWeek(schedule);
    return currentWeek.day[today];
  }

  Day getTomorrow(Schedule schedule){
    int tomorrow = DateTime.now().weekday;
    if(tomorrow >= 6){
      tomorrow = 0;
    }
    Week currentWeek = getCurrentWeek(schedule);
    return currentWeek.day[tomorrow];
  }

  Week getCurrentWeek(Schedule schedule){
    DateTime today = DateTime.now();
    DateTime startDay = DateTime(today.year);
    if(today.month >= DateTime.september){
      startDay = _findStartMonday(today.year, DateTime.september);
    }else{
      if(today.month >= DateTime.february){
        startDay = _findStartMonday(today.year, DateTime.february);
      }else{
        startDay = _findStartMonday(today.year - 1, DateTime.september);
      }
    }
    var differenceBetweenDate = today.difference(startDay);
    return ((differenceBetweenDate.inDays / 7) % 2).floor() == 0 ? schedule.firstWeek : schedule.secondWeek;
  }

  DateTime _findStartMonday(int year, int month) {
    var day = DateTime(year, month);
    if (day.weekday != DateTime.monday) {
      for (int i = day.weekday; i > -7; i--) {
        day = DateTime(year, month, i);
        if (day.weekday == DateTime.monday) {
          return day;
        }
      }
    } else {
      return day;
    }
    throw Exception('День не найден');
  }

}