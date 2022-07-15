import 'package:flutter/material.dart';
import 'package:iit_csu_app/services/markService.dart';
import 'package:iit_csu_app/services/userService.dart';

import '../../constant.dart';
import '../../models/mark.dart';
import '../../models/user.dart';
import 'components/accountPageBody.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  User _user = User(
      id: 1, name: '', surname: '', groupName: '', email: '', password: '');
  late List<Mark> _marks = [];
  final MarkService _markService = MarkService();
  final UserService userService = UserService();
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getUserMarks();
    _getUser();
  }

  Future<void> _getUserMarks() async {
    final list = await _markService.getAllMarks().then((value) => value);
    setState(() {
      _marks = list;
    });
  }

  Future<void> _getUser() async {
    final user = await userService.getUser().then((value) => value);
    setState(() {
      _user = user;
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blueBgColor,
        title: const Center(
          child: Text(
            'Аккаунт',
            style: TextStyle(
              color: darkInfoColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
      body: AccountPageBody(
        user: _user,
        marks: _marks,
        isLoaded: _isLoaded,
        function: _getUserMarks,
      ),
    );
  }
}