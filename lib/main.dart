import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/pages/navbar/navbar.dart';
import 'package:ahli_gigi/pages/register.dart';
import 'package:ahli_gigi/pages/login.dart';
import 'package:ahli_gigi/pages/forgot_pw.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(initialPageIndex: 0),

      // initialRoute: 'Login',
      // routes: {
      //   'Login': (context) => const Login(),
      //   'dashboard': (context) => Dashboard(),
      //   'register': (context) => Register(),
      //   'forgot': (context) => Forgot(),
      // },
    );
  }
}
