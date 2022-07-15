import 'package:flutter/material.dart';
import 'package:iit_csu_app/services/calendarService.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constant.dart';
import '../../../models/event.dart';

class Calendar extends StatefulWidget {
  Calendar({Key? key, required this.events}) : super(key: key) {
    createState();
  }

  List<Event> events = [];

  @override
  State<Calendar> createState() => _CalendarState(events: events);
}

class _CalendarState extends State<Calendar> {
  List<Event> events = [];
  final CalendarService service = CalendarService();

  _CalendarState({required this.events});

  @override
  void didUpdateWidget(covariant Calendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateWidget();
  }

  void _updateWidget() => setState(() {
        events = widget.events;
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        height: size.height * .4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(.5),
                blurRadius: 5,
                spreadRadius: 1),
          ],
        ),
        child: TableCalendar(
          firstDay: service.getDayStart(),
          focusedDay: DateTime.now(),
          lastDay: service.getDayEnd(),
          startingDayOfWeek: StartingDayOfWeek.monday,
          rowHeight: size.height * .045,
          daysOfWeekHeight: 15,
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(
                color: additionalInfoColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF'),
            weekendStyle: TextStyle(
                color: additionalInfoColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF'),
          ),
          eventLoader: _getEventDay,
          calendarStyle: const CalendarStyle(
            isTodayHighlighted: true,
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lightBgColor,
            ),
            todayTextStyle: TextStyle(color: lightInfoColor),
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
        ),
      ),
    );
  }

  List _getEventDay(DateTime day) {
    List<Event> eventsDay = [];
    for (var event in events) {
      if (day.day == event.dateEnd.day && day.month == event.dateEnd.month) {
        eventsDay.add(event);
        return eventsDay;
      }
    }
    return eventsDay;
  }
}
