import 'package:flutter/material.dart';
import 'package:iit_csu_app/models/event.dart';
import 'package:iit_csu_app/services/calendarService.dart';
import 'package:iit_csu_app/services/userService.dart';
import 'package:iit_csu_app/utils/notAuthPage.dart';
import 'package:iit_csu_app/utils/notFoundPage.dart';

import '../../constant.dart';
import '../../utils/authForm.dart';
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
  bool _isError = false;
  bool _isAuth = UserService.userIsAuth;

  void _updateData() {
    setState(() {
      _isAuth = UserService.userIsAuth;
      if (_isAuth) {
        _getAllEvents();
      }
    });
  }

  Future<void> _getAllEvents() async {
    List<Event> responseEvent = [];
    try {
      responseEvent =
          await CalendarService().getAllEvents().then((value) => value.events);
    } catch (e) {
      print(e);
      setState(() {
        _isError = true;
        _events = responseEvent;
        _isLoad = true;
      });
      return;
    }
    setState(() {
      _isError = false;
      _events = responseEvent;
      _isLoad = true;
    });
  }

  @override
  void initState() {
    super.initState();
    if (_isAuth) {
      _getAllEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueBgColor,
        title: const Text(
          'Календарь',
          style: TextStyle(
            color: darkInfoColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF',
          ),
        ),
        centerTitle: true,
      ),
      body: _isAuth
          ? RefreshIndicator(
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
                    !_isError
                        ? LastEvents(isLoad: _isLoad, events: _events)
                        : const NotFoundPage()
                  ],
                ),
              ),
            )
          : _notAuth(),
    );
  }

  Widget _notAuth() {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * .6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Для получения данных необходимо войти в систему',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF',
                  fontSize: 15,
                  color: additionalInfoColor),
            ),
            EntryBtn(
              function: () async {
                bool canUpdate = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AuthForm())); //Navigator.pushNamed(context, '/auth');
                if (canUpdate) {
                  _updateData();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
