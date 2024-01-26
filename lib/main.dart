import 'package:ahli_gigi/pages/login/login.dart';
// import 'package:ahli_gigi/pages/navbar/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';

void main() async {
  // menampilkan garis debug
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}

class MyAppBody extends StatefulWidget {
  const MyAppBody({Key? key}) : super(key: key);

  @override
  State<MyAppBody> createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {
  @override
  void initState() {
    super.initState();
    // Cek status otentikasi saat aplikasi dimulai
    checkAuthentication();
  }

  // Fungsi untuk memeriksa status otentikasi pengguna
  void checkAuthentication() async {
    // FirebaseAuth auth = FirebaseAuth.instance;
    // User? user = auth.currentUser;

    // await Future.delayed(const Duration(seconds: 1)); // Jika Anda masih ingin menambahkan penundaan

    // if (user != null) {
      // Jika sudah login, arahkan ke halaman dashboard atau navbar sesuai kebutuhan
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => NavBar(initialPageIndex: 0),
      //   ),
      // );
    // } else {
      // Jika belum login, arahkan ke halaman login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    // }
  }

  @override
  Widget build(BuildContext context) {
    // Placeholder widget saat memeriksa status otentikasi
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
