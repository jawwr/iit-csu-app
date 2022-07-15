import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../models/mark.dart';
import '../../../models/user.dart';
import 'accountPageAppBar.dart';
import 'accountPageMarkSection.dart';

class AccountPageBody extends StatelessWidget {
  const AccountPageBody({
    Key? key,
    required User user,
    required List<Mark> marks,
    required Future<void> Function() function,
    required bool isLoaded,
  })  : _user = user,
        _marks = marks,
        _function = function,
        _isLoaded = isLoaded,
        super(key: key);

  final bool _isLoaded;
  final Future<void> Function() _function;
  final User _user;
  final List<Mark> _marks;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: blueBgColor,
      onRefresh: _function,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AccountPageHead(
              user: _user,
            ),
            _isLoaded
                ? AccountPageMarksSection(marks: _marks)
                : const Center(
              child: CircularProgressIndicator(
                backgroundColor: blueBgColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}