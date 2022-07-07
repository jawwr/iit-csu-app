import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleCard.dart';

import '../../models/lesson.dart';

class ScheduleTodayPage extends StatelessWidget {
  const ScheduleTodayPage({
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
            day.name,
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
          return ScheduleCard(lesson: day.lessons[index]);
        },
      ),
    );
  }
}
