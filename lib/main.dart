import 'package:ahli_gigi/pages/dashboard.dart';
import 'package:ahli_gigi/pages/register.dart';
import 'package:ahli_gigi/pages/login.dart';
import 'package:ahli_gigi/pages/forgot_pw.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
      routes: {
        'Login': (context) => Login(),
        'dashboard': (context) => Dashboard(),
        'register': (context) => Register(),
        'forgot': (context) => Forgot(),
      },
    );
  }
}
