import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../models/lesson.dart';
import 'scheduleCard.dart';

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
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      decoration: BoxDecoration(
        color: lightBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.35),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 3),
        ],
      ),
      child: ScheduleCardBody(
        lesson: lesson,
        mainInfoColor: lightInfoColor,
        sidePanelColor: blueBgColor,
      ),
    );
  }
}