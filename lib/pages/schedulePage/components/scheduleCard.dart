import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';
import 'package:iit_csu_app/models/lesson.dart';
import 'package:iit_csu_app/services/scheduleService.dart';

class ScheduleCard extends StatefulWidget {
  const ScheduleCard({
    Key? key,
    required this.lesson,
  }) : super(key: key);

  final Lesson lesson;

  @override
  _ScheduleCardState createState() =>
      _ScheduleCardState(
        lesson: lesson,
      );
}

class _ScheduleCardState extends State<ScheduleCard> {
  _ScheduleCardState({
    required this.lesson,
  });

  late Color _cardBgColor, _infoColor, _sidePanelColor;
  late final Timer timer;
  final ScheduleService _scheduleService = ScheduleService();
  final Lesson lesson;

  @override
  void initState() {
    if (_scheduleService.lessonIsNow(lesson)) {
      _cardBgColor = darkBgColor;
      _sidePanelColor = redBgColor;
      _infoColor = darkInfoColor;
    } else {
      _cardBgColor = lightBgColor;
      _sidePanelColor = blueBgColor;
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
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      height: 100,
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 5),
      clipBehavior: Clip.antiAlias,
      // padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: _cardBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.35),
            offset: const Offset(0, 0),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ScheduleCardBody(
        lesson: lesson,
        mainInfoColor: _infoColor,
        lessonIsNowTitle:
        _scheduleService.lessonIsNow(lesson) ? 'Сейчас идет' : '',
        sidePanelColor: _sidePanelColor,
      ),
    );
  }
}

class ScheduleCardBody extends StatelessWidget {
  const ScheduleCardBody({Key? key,
    required this.lesson,
    required this.mainInfoColor,
    required this.sidePanelColor,
    String? lessonIsNowTitle = ''})
      : _lessonIsNowTitle = lessonIsNowTitle,
        super(key: key);

  final Lesson lesson;
  final Color mainInfoColor, sidePanelColor;
  final String? _lessonIsNowTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 20,
          color: sidePanelColor,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lesson.name,
                  style: TextStyle(
                    color: mainInfoColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lesson.teacher,
                          style: const TextStyle(
                            color: additionalInfoColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SF',
                          ),
                        ),
                        Text(
                          'Аудитория: ${lesson.auditorium}',
                          style: TextStyle(
                            color: mainInfoColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _lessonIsNowTitle!,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF',
                          ),
                        ),
                        Text(
                          '${lesson.timeStart.hour}:${lesson.timeStart.minute == 0
                              ? '00'
                              : lesson.timeStart.minute} - ${lesson.timeEnd
                              .hour}:${lesson.timeEnd.minute}',
                          style: TextStyle(
                            color: mainInfoColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SF',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
