import 'package:flutter/material.dart';
import 'package:iit_csu_app/constant.dart';
import 'package:iit_csu_app/services/userService.dart';
import 'package:iit_csu_app/utils/notAuthPage.dart';

class AuthForm extends StatelessWidget {
  AuthForm({Key? key}) : super(key: key);

  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();

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
              entryForm(size, 'Логин', _textController1),
              entryForm(size, 'Пароль', _textController2),
              EntryBtn(
                function: () {
                  UserService.loginUser(_textController1.text, _textController2.text);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container entryForm(Size size, String hint, textController) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: blueBgColor,
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              width: size.width * .8,
              height: 50,
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: textController,
                cursorColor: blueBgColor,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: const TextStyle(
                    color: additionalInfoColor,
                    fontFamily: 'SF',
                    fontSize: 15,
                    fontWeight: FontWeight.w500
                  )
                ),
                autocorrect: false,
              ),
            );
  }
}
