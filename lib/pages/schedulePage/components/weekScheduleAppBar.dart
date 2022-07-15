import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../models/lesson.dart';

class WeekScheduleAppBar extends StatelessWidget {
  const WeekScheduleAppBar({
    Key? key,
    required Week currentWeek,
    required TabController controller, required this.functionR,
  })  : _currentWeek = currentWeek,
        _controller = controller,
        super(key: key);

  final Week _currentWeek;
  final TabController _controller;
  final void Function() functionR;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        IconButton(onPressed: functionR, icon: Icon(Icons.chevron_right))
      ],
      elevation: 20,
      floating: true,
      snap: true,
      backgroundColor: blueBgColor,
      expandedHeight: 20,
      title: Text(
        "Сейчас ${_currentWeek.name}",
        style: const TextStyle(
          color: darkInfoColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'SF',
        ),
      ),
      centerTitle: true,
      bottom: TabBar(
        controller: _controller,
        indicatorColor: Colors.white,
        indicatorWeight: 3,
        tabs: const [
          SizedBox(
            height: 45,
            child: Center(
              child: Text(
                'Первая неделя',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'SF',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 45,
            child: Center(
              child: Text(
                'Вторая неделя',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'SF',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}