import 'package:flutter/material.dart';
import 'package:iit_csu_app/models/event.dart';
import 'package:iit_csu_app/services/calendarService.dart';

import '../../constant.dart';
import 'components/calendar.dart';
import 'components/lastEvents.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late List<Event> _events = [];
  bool _isLoad = false;

  Future<void> _getAllEvents() async {
    List<Event> responseEvent =
        await CalendarService().getAllEvents().then((value) => value);
    setState(() {
      _events = responseEvent;
      _isLoad = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueBgColor,
        title: const Center(
          child: Text(
            'Календарь',
            style: TextStyle(
              color: darkInfoColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: blueBgColor,
        onRefresh: _getAllEvents,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Calendar(
                events: _events,
              ),
              LastEvents(isLoad: _isLoad, events: _events)
            ],
          ),
        ),
      ),
    );
  }
}




