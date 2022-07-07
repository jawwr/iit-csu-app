import 'package:flutter/material.dart';
import 'package:iit_csu_app/models/lesson.dart';

import '../../constant.dart';

class ScheduleWeekPage extends StatelessWidget {
  const ScheduleWeekPage({Key? key, required this.week}) : super(key: key);

  final Week week;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBgColor,
        title: Center(
          child: Text(
            "Сейчас идет ${week.name}",
            style: const TextStyle(
              color: darkBgColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Rubik',
            ),
          ),
        ),
      ),
      body: Container(
        height: size.height,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
          ),
          itemCount: week.day.length,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      week.day[index].name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                WeekSchedule(
                  day: week.day[index],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeekSchedule extends StatelessWidget {
  const WeekSchedule({
    Key? key,
    required this.day,
  }) : super(key: key);

  final Day day;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<LessonCard> lessonsName = [];
    for (var lesson in day.lessons) {
      lessonsName.add(LessonCard(lesson: lesson));
    }

    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: lessonsName,
      ),
    );
  }
}
class LessonCard extends StatelessWidget {
  const LessonCard({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: Colors.black.withOpacity(.5),
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: LessonCardBody(lesson: lesson),
    );
  }
}

class LessonCardBody extends StatelessWidget {
  const LessonCardBody({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width * .6,
          child: Text(
            lesson.name,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
              fontFamily: 'Rubik',
            ),
          ),
        ),
        Text(
          "${lesson.timeStart.hour}:${lesson.timeStart.minute} - ${lesson.timeEnd.hour}:${lesson.timeEnd.minute}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            fontFamily: 'Rubik',
          ),
        ),
      ],
    );
  }
}
