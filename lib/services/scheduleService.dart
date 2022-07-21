import 'package:flutter/material.dart';
import 'package:iit_csu_app/models/lesson.dart';

class ScheduleService{

  //TODO сделать нормальное получение расписания
  String getSchedule() {
    return '{ "first_week":{ "name":"Первая неделя", "day":[ { "name":"Понедельник", "lessons":[ { "name": "Психология лидерства и командообразование", "teacher": "Теске Г.П.", "auditorium": "132", "time_start":"1:00", "time_end":"9:30" }, { "name": "Математический анализ", "teacher": "Ижбердеева Е. М.", "auditorium": "413", "time_start":"9:40", "time_end":"11:10" }, { "name": "Архитектура вычислительных систем", "teacher": "Скрипов С. А.", "auditorium": "А-17", "time_start":"11:20", "time_end":"12:50" }, { "name": "Физ-ра", "teacher": "Панькин В. Е.", "auditorium": "Корпус 4", "time_start":"13:15", "time_end":"14:45" } ] }, { "name":"Вторник", "lessons":[ { "name": "Английский (1 группа)", "teacher": "Ковальчук Л. П.", "auditorium": "011", "time_start":"8:00", "time_end":"9:30" }, { "name": "Архитектура вычислительных систем", "teacher": "Скрипов С. А.", "auditorium": "132", "time_start":"9:40", "time_end":"11:10" }, { "name": "Математический анализ", "teacher": "Шуклина А. Ф.", "auditorium": "А-13", "time_start":"11:20", "time_end":"12:50" } ] }, { "name":"Среда", "lessons":[ { "name": "Физ-ра", "teacher": "Пястолова Н. Б.", "auditorium": "Moodle", "time_start":"9:40", "time_end":"11:10" } ] }, { "name":"Четверг", "lessons":[ { "name": "Введение в направление", "teacher": "(Преподаватели 132)", "auditorium": "132", "time_start":"0:0", "time_end":"14:45" }, { "name": "Английский (2 группа)", "teacher": "Викторова Е. В.", "auditorium": "013", "time_start":"23:01", "time_end":"23:30" } ] }, { "name":"Пятница", "lessons":[ { "name": "Дискретная математика", "teacher": "Мирасов В. Ф.", "auditorium": "132", "time_start":"13:15", "time_end":"14:45" }, { "name": "Дискретная математика", "teacher": "Мирасов В. Ф.", "auditorium": "132", "time_start":"22:00", "time_end":"23:30" } ] }, { "name":"Суббота", "lessons":[ { "name": "Программирование", "teacher": "Кирсанов А. А.", "auditorium": "Discord", "time_start":"8:00", "time_end":"9:30" }, { "name": "Программирование", "teacher": "Кирсанов А. А.", "auditorium": "Discord", "time_start":"9:40", "time_end":"11:10" }, { "name": "Программирование", "teacher": "Кирсанов А. А.", "auditorium": "Discord", "time_start":"11:20", "time_end":"12:50" } ] } ] }, "second_week":{ "name":"Вторая неделя", "day":[ { "name":"Понедельник", "lessons":[ { "name": "Физ-ра", "teacher": "Панькин В. Е.", "auditorium": "Корпус 4", "time_start":"8:00", "time_end":"9:30" }, { "name": "Психология лидерства и командообразование", "teacher": "Теске Г. П.", "auditorium": "А-17", "time_start":"9:40", "time_end":"11:10" }, { "name": "Архитектура вычислительных систем", "teacher": "Скрипов С. А.", "auditorium": "А-17", "time_start":"11:20", "time_end":"12:50" }, { "name": "Английский (1 группа)", "teacher": "Ковальчук Л. П.", "auditorium": "427", "time_start":"13:15", "time_end":"14:45" } ] }, { "name":"Вторник", "lessons":[ { "name": "Английский (1 группа)", "teacher": "Ковальчук Л. П.", "auditorium": "011", "time_start":"8:00", "time_end":"9:30" }, { "name": "Архитектура вычислительных систем", "teacher": "Скрипов С. А.", "auditorium": "132", "time_start":"9:40", "time_end":"23:10" }, { "name": "Математический анализ", "teacher": "Шуклина А. Ф.", "auditorium": "А-13", "time_start":"11:20", "time_end":"12:50" } ] }, { "name":"Среда", "lessons":[ { "name": "Физ-ра", "teacher": "Пястолова Н. Б.", "auditorium": "Moodle", "time_start":"9:40", "time_end":"11:10" } ] }, { "name":"Четверг", "lessons":[ { "name": "Введение в направление", "teacher": "(Преподаватели)", "auditorium": "132", "time_start":"11:20", "time_end":"12:50" }, { "name": "Английский (2 группа)", "teacher": "Викторова Е. В.", "auditorium": "013", "time_start":"13:15", "time_end":"14:45" }, { "name": "Английский (2 группа)", "teacher": "Викторова Е. В.", "auditorium": "013", "time_start":"15:00", "time_end":"16:30" } ] }, { "name":"Пятница", "lessons":[ { "name": "Введение в направление", "teacher": "(Преподаватели)", "auditorium": "А-25", "time_start":"9:40", "time_end":"11:10" }, { "name": "Математический анализ", "teacher": "Ижбердеева Е. М.", "auditorium": "413", "time_start":"11:20", "time_end":"12:50" }, { "name": "Дискретная математика", "teacher": "Мирасов В. Ф.", "auditorium": "А-23", "time_start":"13:15", "time_end":"14:45" }, { "name": "Дискретная математика", "teacher": "Мирасов В. Ф.", "auditorium": "132", "time_start":"15:00", "time_end":"16:30" } ] }, { "name":"Суббота", "lessons":[ { "name": "Программирование", "teacher": "Кирсанов А. А.", "auditorium": "Discord", "time_start":"9:40", "time_end":"11:10" }, { "name": "Программирование", "teacher": "Кирсанов А. А.", "auditorium": "Discord", "time_start":"11:20", "time_end":"12:50" } ] } ] }}'
    ;
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