import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../models/mark.dart';

class MarkCard extends StatelessWidget {
  const MarkCard({Key? key, required Mark mark})
      : _mark = mark,
        super(key: key);

  final Mark _mark;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 60,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: lightBgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.black.withOpacity(.5),
              blurRadius: 5,
              spreadRadius: 1,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                _mark.lessonName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF',
                ),
              ),
            ),
          ),
          Container(
            width: 80,
            color: blueBgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Оценка',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF',
                  ),
                ),
                Text(
                  _mark.mark,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}