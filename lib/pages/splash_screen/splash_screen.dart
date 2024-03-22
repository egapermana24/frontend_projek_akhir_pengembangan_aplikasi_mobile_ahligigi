import 'dart:async';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../login/login.dart';
import 'package:ahli_gigi/pages/navbar/navbar.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Waktu tunda sebelum berpindah ke halaman utama (dalam milidetik)
    const splashDuration = 4500;

    // Fungsi untuk berpindah ke halaman utama setelah waktu tertentu
    Timer(
      Duration(milliseconds: splashDuration),
      () async {
        // Periksa apakah pengguna sudah login
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          // Jika sudah login, arahkan ke halaman utama (MainTabBar)
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => NavBar(initialPageIndex: 0),
            ),
          );
        } else {
          // Jika belum login, arahkan ke halaman SplashNext1
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) => Login(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: screenWidth,
                  color: AppColors.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/lottie/SplashDental.json',
                        repeat: true,
                        width: 300,
                        height: 300,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              child: Image.asset(
                'assets/img/logo-gigi.png',
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
