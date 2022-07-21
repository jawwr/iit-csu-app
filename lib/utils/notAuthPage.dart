import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';

class EntryBtn extends StatelessWidget {
  const EntryBtn({
    Key? key,
    required void Function() function,
  })  : _function = function,
        super(key: key);

  final void Function() _function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _function,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: 50,
        width: size.width * .3,
        decoration: BoxDecoration(
          color: blueBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Войти',
            style: TextStyle(
                color: darkInfoColor,
                fontFamily: 'SF',
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}