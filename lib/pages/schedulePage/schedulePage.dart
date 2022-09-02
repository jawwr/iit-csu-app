import 'package:flutter/material.dart';
import 'package:iit_csu_app/services/scheduleService.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleTodayPage.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleTomorrow.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleWeekPage.dart';

import '../../models/lesson.dart';

class SchedulePage extends StatelessWidget {
  final ScheduleService service = ScheduleService();
  late Schedule _allSchedule;
  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    // _getSchedule();
    final Day today = service.getToday(_allSchedule);
    final Day tomorrow = service.getTomorrow(_allSchedule);
    final int currentWeekNumber =
        service.getCurrentWeek(_allSchedule).name == 'Первая неделя' ? 0 : 1;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: PageView(
        controller: pageController,
        children: [
          ScheduleWeekPage(
            schedule: _allSchedule,
            currentWeekNumber: currentWeekNumber,
            function: () {
              pageController.animateToPage(1,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500));
            },
          ),
          ScheduleTodayPage(
              functionL: () {
                pageController.animateToPage(0,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 500));
              },
              functionR: () {
                pageController.animateToPage(2,
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 500));
              },
              day: today),
          ScheduleTomorrow(
            day: tomorrow,
            functionL: () {
              pageController.animateToPage(1,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500));
            },
          ),
        ],
      ),
    );
  }

  Future<void> _getSchedule() async{
    try {
      _allSchedule = await service.getSchedule().then((value) => value);
    }catch(e){
      print(e);
    }
  }
}
