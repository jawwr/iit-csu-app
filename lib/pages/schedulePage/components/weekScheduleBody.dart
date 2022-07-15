import 'package:flutter/material.dart';
import 'package:iit_csu_app/pages/schedulePage/components/weekScheduleLessonCard.dart';

import '../../../models/lesson.dart';

class WeekScheduleBody extends StatelessWidget {
  const WeekScheduleBody({
    Key? key,
    required Week week,
  })  : _week = week,
        super(key: key);

  final Week _week;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
        ),
        itemCount: _week.day.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    _week.day[index].name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF',
                    ),
                  ),
                ],
              ),
              WeekSchedule(
                day: _week.day[index],
              ),
            ],
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