import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/img/login.jpg'), // Path Gambar Background
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Container(
            width: 290,
            height: 320,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 270, // Atur lebar sesuai kebutuhan
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Username',
                            filled: true,
                            fillColor: Color.fromARGB(0, 255, 255,
                                255), // Ubah warna latar belakang sesuai keinginan Anda
                            labelStyle: TextStyle(
                                color: const Color.fromARGB(
                                    255, 0, 0, 0)), // Ubah warna teks label
                          ),
                          style: TextStyle(fontSize: 14),
                        )),
                    SizedBox(height: 20.0),
                    Container(
                        width: 270, // Atur lebar sesuai kebutuhan
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            filled: true,
                            fillColor: Color.fromARGB(0, 255, 255,
                                255), // Ubah warna latar belakang sesuai keinginan Anda
                            labelStyle: TextStyle(
                                color: const Color.fromARGB(
                                    255, 0, 0, 0)), // Ubah warna teks label
                          ),
                          style: TextStyle(fontSize: 14),
                        )),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'dashboard');
                        // Tambahkan logika untuk tombol login di sini
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Colors.black), // Ganti warna latar belakang tombol
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white), // Ganti warna teks tombol
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold)), // Ganti ukuran teks
                      ),
                      child: Text('Login'),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text: "Saya menyetujui "),
                                TextSpan(
                                  text: "syarat",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("klik syarat");
                                    },
                                ),
                                TextSpan(text: ","),
                                TextSpan(
                                  text: " ketentuan",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("klik ketentuan");
                                    },
                                ),
                                TextSpan(text: " dan "),
                                TextSpan(
                                  text: "privasi",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("klik privasi");
                                    },
                                ),
                                TextSpan(text: " Telkomsel"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
