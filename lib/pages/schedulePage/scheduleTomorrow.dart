import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';

import '../../models/lesson.dart';
import 'components/tomorrowScheduleCard.dart';

class ScheduleTomorrow extends StatelessWidget {
  const ScheduleTomorrow({
    Key? key,
    required this.day,
    required this.functionL,
  }) : super(key: key);

  final Day day;
  final void Function() functionL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: functionL, icon: Icon(Icons.chevron_left)),
        backgroundColor: blueBgColor,
        title: Text(
          'Завтра ${day.name}',
          style: const TextStyle(
            color: darkInfoColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF',
          ),
        ),
        centerTitle: true,
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
