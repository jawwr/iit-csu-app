import 'package:flutter/material.dart';

import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

class Schedule {
  Schedule({
    required this.firstWeek,
    required this.secondWeek,
  });

  Week firstWeek;
  Week secondWeek;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    firstWeek: Week.fromJson(json["firstWeek"]),
    secondWeek: Week.fromJson(json["secondWeek"]),
  );
}

class Week {
  Week({
    required this.name,
    required this.day,
  });

  String name;
  List<Day> day;

  factory Week.fromJson(Map<String, dynamic> json) => Week(
    name: json["name"],
    day: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
  );
}

class Day {
  Day({
    required this.name,
    required this.lessons,
  });

  String name;
  List<Lesson> lessons;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    name: json["name"],
    lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
  );
}

Lesson lessonFromJson(String str) => Lesson.fromJson(json.decode(str));

class Lesson {
  Lesson({
    required this.name,
    required this.teacher,
    required this.auditorium,
    required this.timeStart,
    required this.timeEnd,
  });

  String name;
  String teacher;
  String auditorium;
  TimeOfDay timeStart;
  TimeOfDay timeEnd;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    name: json["name"],
    teacher: json["teacher"],
    auditorium: json["auditorium"],
    timeStart: TimeOfDay(hour: int.parse(json["timeStart"].split(':')[0]), minute: int.parse(json["timeStart"].split(':')[1])),
    timeEnd: TimeOfDay(hour: int.parse(json["timeEnd"].split(':')[0]),minute: int.parse( json["timeEnd"].split(':')[1])),
  );
}
