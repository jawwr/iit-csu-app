import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';
import 'package:iit_csu_app/models/lesson.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleService.dart';

class ScheduleCard extends StatefulWidget {
  const ScheduleCard({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  _ScheduleCardState createState() => _ScheduleCardState(
        lesson: lesson,
      );
}

class _ScheduleCardState extends State<ScheduleCard> {
  _ScheduleCardState({
    required this.lesson,
  });

  Color? _cardBgColor, _infoColor;
  Timer? timer;
  final ScheduleService _scheduleService = ScheduleService();
  Lesson lesson;

  @override
  void initState() {
    if (_scheduleService.lessonIsNow(lesson)) {
      _cardBgColor = darkBgColor;

      _infoColor = darkInfoColor;
    } else {
      _cardBgColor = lightBgColor;

      _infoColor = lightInfoColor;
    }

    super.initState();

    timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_scheduleService.lessonIsNow(lesson)) {
        setState(() {
          _cardBgColor = darkBgColor;

          _infoColor = darkInfoColor;
        });
      } else {
        setState(() {
          _cardBgColor = lightBgColor;

          _infoColor = lightInfoColor;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 2.5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: _cardBgColor,
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
        mainInfoColor: _infoColor,
        lessonIsNowTitle: _scheduleService.lessonIsNow(lesson) ? 'Сейчас идет' : '',
      ),
    );
  }
}

class ScheduleCardBody extends StatelessWidget {
  const ScheduleCardBody(
      {Key? key,
      required this.lesson,
      required this.mainInfoColor,
      required this.lessonIsNowTitle})
      : super(key: key);

  final Lesson lesson;
  final Color? mainInfoColor;
  final String lessonIsNowTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ScheduleCardText(
          title: lesson.name,
          textColor: mainInfoColor,
          fontSize: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScheduleCardText(
                  title: lesson.teacher,
                  textColor: additionalInfoColor,
                  fontSize: 15,
                ),
                ScheduleCardText(
                  title: 'Аудитория: ${lesson.auditorium}',
                  textColor: mainInfoColor,
                  fontSize: 17,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ScheduleCardText(
                  title: lessonIsNowTitle,
                  textColor: Colors.green,
                  fontSize: 15,
                ),
                ScheduleCardText(
                  title:
                      '${lesson.timeStart.hour}:${lesson.timeStart.minute == 0 ? '00' : lesson.timeStart.minute} - ${lesson.timeEnd.hour}:${lesson.timeEnd.minute}',
                  textColor: mainInfoColor,
                  fontSize: 17,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ScheduleCardText extends StatelessWidget {
  const ScheduleCardText({
    Key? key,
    required this.title,
    required this.textColor,
    required this.fontSize,
  }) : super(key: key);

  final String title;
  final Color? textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w300,
        fontFamily: 'Rubik',
      ),
    );
  }
}
