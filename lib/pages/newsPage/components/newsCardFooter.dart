import 'package:flutter/material.dart';

import '../../../constant.dart';

class NewsCardFooter extends StatelessWidget {
  const NewsCardFooter({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: blueBgColor,
        height: 20,
        width: size.width,
        child: const Text(
          'Подробнее в Telegram канале',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'SF',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.end,
        )
    );
  }
}