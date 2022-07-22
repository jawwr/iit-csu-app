import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:iit_csu_app/pages/home/homePage.dart';
import 'package:iit_csu_app/services/userService.dart';
import 'package:iit_csu_app/themeConstants.dart';
import 'package:iit_csu_app/utils/authForm.dart';
import 'package:iit_csu_app/utils/notFoundPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  UserService().entryWithStorageData();
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
        '/auth': (context) => const AuthForm(),
      },
      initialRoute: '/',
    );
  }
}