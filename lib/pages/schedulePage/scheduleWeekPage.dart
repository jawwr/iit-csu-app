import 'package:flutter/material.dart';
import 'package:iit_csu_app/models/lesson.dart';

import 'components/weekScheduleAppBar.dart';
import 'components/weekScheduleBody.dart';

class ScheduleWeekPage extends StatefulWidget {
  const ScheduleWeekPage(
      {Key? key,
      required this.schedule,
      required this.currentWeekNumber,
      required void Function() function})
      : _function = function,
        super(key: key);

  final Schedule schedule;
  final int currentWeekNumber;
  final void Function() _function;

  @override
  State<ScheduleWeekPage> createState() => _ScheduleWeekPageState(
        schedule: schedule,
        currentWeek: currentWeekNumber,
        function: _function,
      );
}

class _ScheduleWeekPageState extends State<ScheduleWeekPage>
    with TickerProviderStateMixin {
  _ScheduleWeekPageState(
      {required this.schedule, required this.currentWeek, required this.function});

  final Schedule schedule;
  late Week _currentWeek;
  late TabController _controller;
  int currentWeek;
  final void Function() function;

  @override
  void initState() {
    super.initState();
    _currentWeek = currentWeek == 0 ? schedule.firstWeek : schedule.secondWeek;
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: currentWeek,
      animationDuration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          WeekScheduleAppBar(
            currentWeek: _currentWeek,
            controller: _controller,
            functionR: function,
          ),
        ],
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            WeekScheduleBody(week: schedule.firstWeek),
            WeekScheduleBody(week: schedule.secondWeek),
          ],
        ),
      ),
    );
  }
}
