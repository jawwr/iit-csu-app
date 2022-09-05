import 'package:flutter/material.dart';
import 'package:iit_csu_app/services/scheduleService.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleTodayPage.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleTomorrow.dart';
import 'package:iit_csu_app/pages/schedulePage/scheduleWeekPage.dart';
import 'package:iit_csu_app/services/userService.dart';

import '../../constant.dart';
import '../../models/lesson.dart';
import '../../utils/authForm.dart';
import '../../utils/notAuthPage.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final ScheduleService service = ScheduleService();
  late Schedule _allSchedule;
  final PageController pageController = PageController(initialPage: 1);
  bool _isAuth = UserService.userIsAuth;
  late Day _today;
  late Day _tomorrow;
  late int _currentWeekNumber;


  @override
  void initState() {
    super.initState();
    if(_isAuth){
      _getSchedule();
      _today = service.getToday(_allSchedule);
      _tomorrow = service.getTomorrow(_allSchedule);
      _currentWeekNumber =
        service.getCurrentWeek(_allSchedule).name == 'Первая неделя' ? 0 : 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_isAuth);
    // _getSchedule();

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: _isAuth ? PageView(
        controller: pageController,
        children: [
          ScheduleWeekPage(
            schedule: _allSchedule,
            currentWeekNumber: _currentWeekNumber,
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
              day: _today),
          ScheduleTomorrow(
            day: _tomorrow,
            functionL: () {
              pageController.animateToPage(1,
                  curve: Curves.easeInOut,
                  duration: Duration(milliseconds: 500));
            },
          ),
        ],
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
                    builder: (context) => const AuthForm(),
                  ),
                );
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

  Future<void> _getSchedule() async{
    try {
      _allSchedule = await service.getSchedule().then((value) => value);
    }catch(e){
      print(e);
    }
  }

  void _updateData() {
    setState(() {
      _isAuth = UserService.userIsAuth;
      if (_isAuth) {
      }
    });
  }
}
