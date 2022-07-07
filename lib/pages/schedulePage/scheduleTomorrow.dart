import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleCard.dart';

import '../../models/lesson.dart';

class ScheduleTomorrow extends StatelessWidget {
  const ScheduleTomorrow({
    Key? key,
    required this.day,
  }) : super(key: key);

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBgColor,
        title: Center(
          child: Text(
            'Завтра ${day.name}',
            style: const TextStyle(
              color: darkBgColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Rubik',
            ),
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 16,
          left: 10,
          right: 10,
        ),
        itemCount: day.lessons.length,
        itemBuilder: (context, index) {
          return ScheduleCardTomorrow(lesson: day.lessons[index]);
        },
      ),
    );
  }
}

class ScheduleCardTomorrow extends StatelessWidget {
  const ScheduleCardTomorrow({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: lightBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.25),
              offset: const Offset(0, 0),
              blurRadius: 30,
              spreadRadius: 0),
        ],
      ),
      child: ScheduleCardBody(
        lesson: lesson,
        mainInfoColor: lightInfoColor,
        lessonIsNowTitle: '',
      ),
    );
  }
}
