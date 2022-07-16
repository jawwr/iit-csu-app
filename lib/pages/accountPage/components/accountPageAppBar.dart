import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../models/user.dart';

class AccountPageHead extends StatelessWidget {
  AccountPageHead({
    Key? key,
    required User user,
    required void Function() function,
  })  : _user = user,
        _function = function,
        super(key: key);

  final User _user;
  late final double _textSize = _getTextSize(_user.name, _user.surname);
  final void Function() _function;

  double _getTextSize(String name, String surname) {
    int maxSize = max(name.length, surname.length);
    if (maxSize < 15) {
      return 50;
    } else {
      return 35;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .35,
      decoration: const BoxDecoration(
        color: blueBgColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * .25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _user.surname,
                  style: TextStyle(
                    color: darkInfoColor,
                    fontWeight: FontWeight.bold,
                    fontSize: _textSize,
                    fontFamily: 'SF',
                  ),
                ),
                Text(
                  _user.name,
                  style: TextStyle(
                    color: darkInfoColor,
                    fontWeight: FontWeight.bold,
                    fontSize: _textSize,
                    fontFamily: 'SF',
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text(
                      'Группа ',
                      style: TextStyle(
                        color: darkInfoColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        fontFamily: 'SF',
                      ),
                    ),
                    Text(
                      _user.groupName,
                      style: const TextStyle(
                        color: darkInfoColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'SF',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _function,
            child: Container(
              width: size.width * .3,
              height: 40,
              decoration: BoxDecoration(
                color: lightBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Center(
                  child: Text(
                    'Выйти',
                    style: TextStyle(
                      color: blueBgColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'SF',
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
