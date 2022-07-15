import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';

import '../../../models/lesson.dart';

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
      clipBehavior: Clip.antiAlias,
      height: 60,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 5),
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
        borderRadius: BorderRadius.circular(10),
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              lesson.name,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF',
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 60,
          width: 90,
          decoration: const BoxDecoration(
            color: blueBgColor,
          ),
          child: Center(
            child: Text(
              "${lesson.timeStart.hour}:${lesson.timeStart.minute == 0 ? '00' : lesson.timeStart.minute}\n${lesson.timeEnd.hour}:${lesson.timeEnd.minute}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
