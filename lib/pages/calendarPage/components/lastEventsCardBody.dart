import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../models/event.dart';

class LastEventCardBody extends StatelessWidget {
  const LastEventCardBody({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: lightBgColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: Colors.black.withOpacity(.5),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            color: blueBgColor,
            width: 20,
            height: MediaQuery.of(context).size.height,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName,
                    style: const TextStyle(
                      color: lightInfoColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF',
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    event.lessonName,
                    style: const TextStyle(
                      color: additionalInfoColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF',
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: blueBgColor,
            width: 80,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Text(
                'Сдача\n${event.dateEnd.day}.${event.dateEnd.month}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: darkInfoColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF',
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}