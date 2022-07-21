import 'package:flutter/material.dart';
import 'package:iit_csu_app/services/markService.dart';
import 'package:iit_csu_app/services/userService.dart';
import 'package:iit_csu_app/utils/authForm.dart';
import 'package:iit_csu_app/utils/notAuthPage.dart';

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
  User _user = User.user();
  late List<Mark> _marks = [];
  final MarkService _markService = MarkService();
  final UserService userService = UserService();
  bool _isLoaded = false;
  bool _isAuth = UserService.userIsAuth;

  @override
  void initState() {
    super.initState();
    if (_isAuth) {
      _getUserMarks();
      _getUser();
    }
  }

  Future<void> _getUserMarks() async {
    final list = await _markService.getAllMarks().then((value) => value);
    setState(() {
      _marks = list;
    });
  }

  void _updateData() {
    setState(() {
      _isAuth = UserService.userIsAuth;
      if (_isAuth) {
        _getUserMarks();
        _getUser();
      }
    });
  }

  Future<void> _getUser() async {
    final user = UserService.user;
    setState(() {
      _user = user!;
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blueBgColor,
        title: const Text(
          'Аккаунт',
          style: TextStyle(
            color: darkInfoColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'SF',
          ),
        ),
        centerTitle: true,
      ),
      body: _isAuth
          ? AccountPageBody(
              user: _user,
              marks: _marks,
              isLoaded: _isLoaded,
              function: _getUserMarks,
              exitFunction: () {
                UserService.logOutUser();
                setState(() {
                  _isAuth = false;
                });
              },
            )
          : _notAuth(),
    );
  }

  Widget _notAuth() {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * .6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Для получения данных необходимо войти в систему',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF',
                  fontSize: 15,
                  color: additionalInfoColor),
            ),
            EntryBtn(
              function: () async {
                bool canUpdate = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AuthForm())); //Navigator.pushNamed(context, '/auth');
                if (canUpdate) {
                  _updateData();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
