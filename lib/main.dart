import 'package:flutter/material.dart';
import 'package:iit_csu_app/pages/home/homePage.dart';
import 'package:iit_csu_app/services/userService.dart';
import 'package:iit_csu_app/themeConstants.dart';
import 'package:iit_csu_app/utils/notFoundPage.dart';

void main() {
  UserService.loginUser('josh@mail.com', '1234');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      routes: {
        '/': (context) => const Home(),
        '/notFound': (context) => const NotFoundPage(),
      },
      initialRoute: '/',
    );
  }
}