import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iit_csu_app/constant.dart';
import 'package:iit_csu_app/services/userService.dart';
import 'package:iit_csu_app/utils/notAuthPage.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final _service = UserService();

  bool _isError = false;
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blueBgColor,
        title: const Text(
          'Вход в систему',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'SF',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              entryLoginForm(size, _textController1),
              entryPasswordForm(size, _textController2),
              if (_isError)
                const Text(
                  'Ошибка авторизации',
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'SF',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              EntryBtn(
                function: () async {
                  try {
                    await _service.loginUser(
                      email: _textController1.text,
                      password: _textController2.text,
                    );
                    if (!mounted) return;
                    Navigator.pop(context, true);
                  } catch (e) {
                    setState(() {
                      _isError = true;
                    });
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget entryLoginForm(Size size, textController) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: blueBgColor, width: 2),
          borderRadius: BorderRadius.circular(10)),
      width: size.width * .8,
      height: 50,
      padding: const EdgeInsets.all(5),
      child: TextField(
        obscureText: false,
        controller: textController,
        cursorColor: blueBgColor,
        decoration: const InputDecoration(
            alignLabelWithHint: true,
            border: InputBorder.none,
            hintText: 'Логин',
            hintStyle: TextStyle(
                color: additionalInfoColor,
                fontFamily: 'SF',
                fontSize: 15,
                fontWeight: FontWeight.w500)),
        autocorrect: false,
      ),
    );
  }

  Widget entryPasswordForm(Size size, textController) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: blueBgColor, width: 2),
          borderRadius: BorderRadius.circular(10)),
      width: size.width * .8,
      height: 50,
      padding: const EdgeInsets.all(5),
      child: TextField(
        obscureText: !_isShow,
        controller: textController,
        cursorColor: blueBgColor,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isShow = !_isShow;
                });
              },
              icon: Icon(
                _isShow ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                color: additionalInfoColor,
              ),
            ),
            suffixIconColor: Colors.black,
            alignLabelWithHint: true,
            border: InputBorder.none,
            hintText: 'Пароль',
            hintStyle: const TextStyle(
                color: additionalInfoColor,
                fontFamily: 'SF',
                fontSize: 15,
                fontWeight: FontWeight.w500)),
        autocorrect: false,
      ),
    );
  }
}
