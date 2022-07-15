import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(top: 10, bottom: 40),
              child: const Text(
                '404',
                style: TextStyle(
                  color: lightInfoColor,
                  fontSize: 80,
                  fontFamily: 'SF',
                  fontWeight: FontWeight.bold,
                ),
          ),
            ),
          Image.asset(
            'assets/image/cable.png',
          ),
        ],
      ),
    );
  }
}
