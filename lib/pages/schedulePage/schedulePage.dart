import 'package:flutter/material.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleService.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleTodayPage.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleTomorrow.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleWeekPage.dart';

import '../../models/lesson.dart';

class SchedulePage extends StatelessWidget {
  final ScheduleService service = ScheduleService();
  final Schedule _allSchedule = scheduleFromJson(ScheduleService().getSchedule());
  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    final Day today = service.getToday(_allSchedule);
    final Day tomorrow = service.getTomorrow(_allSchedule);
    final Week currentWeek = service.getCurrentWeek(_allSchedule);

    return Scaffold(
        body: PageView(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      children: [
        ScheduleWeekPage(week: currentWeek),
        ScheduleTodayPage(day: today),
        ScheduleTomorrow(day: tomorrow),
      ],
    ));
  }
}
