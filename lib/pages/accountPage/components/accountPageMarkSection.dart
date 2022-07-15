import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';

import '../../../models/mark.dart';
import 'markCard.dart';

class AccountPageMarksSection extends StatelessWidget {
  const AccountPageMarksSection({
    Key? key,
    required List<Mark> marks,
  })  : _marks = marks,
        super(key: key);

  final List<Mark> _marks;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightBgColor,
      height: _marks.length * 70 + 60,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: const [
                Text(
                  'Оценки',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: _marks.length,
              itemBuilder: (context, index) => MarkCard(
                mark: _marks[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
