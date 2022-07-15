import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iit_csu_app/pages/accountPage/accountPage.dart';
import 'package:iit_csu_app/pages/calendarPage/calendarPage.dart';
import 'package:iit_csu_app/pages/newsPage/newsPage.dart';
import 'package:iit_csu_app/pages/schedulePage/schedulePage.dart';

import '../../constant.dart';
import 'components/navBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pages = [
    NewsPage(),
    SchedulePage(),
    CalendarPage(),
    AccountPage()
  ];

  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(size),
      body: _pages[_selectedPageIndex],
    );
  }

  Widget _bottomNavBar(Size size) => Container(
        height: size.height * .1,
        width: size.width,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.5),
                offset: Offset(0, 0),
                blurRadius: 20,
              ),
            ],
            color: lightBgColor,
          ),
          child: Row(
            children: [
              NavBarButton(
                icon: FontAwesomeIcons.newspaper,
                function: () {
                  setState((){
                    _selectedPageIndex = 0;
                  });
                },
                bgColor: _selectedPageIndex == 0 ? blueBgColor : inactiveBtnColor,
              ),
              NavBarButton(
                icon: FontAwesomeIcons.clock,
                function: () {
                  setState((){
                    _selectedPageIndex = 1;
                  });
                },
                bgColor: _selectedPageIndex == 1 ? blueBgColor : inactiveBtnColor,
              ),
              NavBarButton(
                icon: FontAwesomeIcons.calendar,
                function: () {
                  setState((){
                    _selectedPageIndex = 2;
                  });
                },
                bgColor: _selectedPageIndex == 2 ? blueBgColor : inactiveBtnColor,
              ),
              NavBarButton(
                icon: Icons.account_circle_outlined,
                function: () {
                  setState((){
                    _selectedPageIndex = 3;
                  });
                },
                bgColor: _selectedPageIndex == 3 ? blueBgColor : inactiveBtnColor,
              ),
            ],
          ),
        ),
      );
}
