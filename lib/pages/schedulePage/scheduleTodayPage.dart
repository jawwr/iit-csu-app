import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';
import 'package:iit_csu_app/pages/schedulePage/components/scheduleCard.dart';

import '../../models/lesson.dart';

class ScheduleTodayPage extends StatelessWidget {
  const ScheduleTodayPage({
    Key? key,
    required this.day,
    required this.functionL,
    required this.functionR,
  }) : super(key: key);

  final Day day;
  final void Function() functionL, functionR;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: functionL, icon: Icon(Icons.chevron_left)),
        actions: [
          IconButton(onPressed: functionR, icon: Icon(Icons.chevron_right))
        ],
        backgroundColor: blueBgColor,
        title: Text(
          day.name,
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
          return ScheduleCard(lesson: day.lessons[index]);
        },
      ),
    );
  }
}
