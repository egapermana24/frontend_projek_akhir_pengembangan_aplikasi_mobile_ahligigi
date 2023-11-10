// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';

// class Login extends StatelessWidget {
//   const Login({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         // decoration: BoxDecoration(
//         //   image: DecorationImage(
//         //     image: AssetImage('assets/img/login.jpg'), // Path Gambar Background
//         //     fit: BoxFit.cover,
//         //   ),
//         // ),
//         child: Center(
//           child: Container(
//             width: 290,
//             height: 320,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.2),
//               border: Border.all(color: Colors.black),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                         width: 270, // Atur lebar sesuai kebutuhan
//                         child: TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Username',
//                             filled: true,
//                             fillColor: Color.fromARGB(0, 255, 255,
//                                 255), // Ubah warna latar belakang sesuai keinginan Anda
//                             labelStyle: TextStyle(
//                                 color: const Color.fromARGB(
//                                     255, 0, 0, 0)), // Ubah warna teks label
//                           ),
//                           style: TextStyle(fontSize: 14),
//                         )),
//                     SizedBox(height: 20.0),
//                     Container(
//                         width: 270, // Atur lebar sesuai kebutuhan
//                         child: TextField(
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             filled: true,
//                             fillColor: Color.fromARGB(0, 255, 255,
//                                 255), // Ubah warna latar belakang sesuai keinginan Anda
//                             labelStyle: TextStyle(
//                                 color: const Color.fromARGB(
//                                     255, 0, 0, 0)), // Ubah warna teks label
//                           ),
//                           style: TextStyle(fontSize: 14),
//                         )),
//                     SizedBox(height: 20.0),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushReplacementNamed(context, 'dashboard');
//                         // Tambahkan logika untuk tombol login di sini
//                       },
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all(
//                             Colors.black), // Ganti warna latar belakang tombol
//                         foregroundColor: MaterialStateProperty.all(
//                             Colors.white), // Ganti warna teks tombol
//                         textStyle: MaterialStateProperty.all(TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold)), // Ganti ukuran teks
//                       ),
//                       child: Text('Login'),
//                     ),
//                     SizedBox(height: 20.0),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: RichText(
//                             textAlign: TextAlign.center,
//                             text: TextSpan(
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                               children: [
//                                 TextSpan(text: "Saya menyetujui "),
//                                 TextSpan(
//                                   text: "syarat",
//                                   style: TextStyle(
//                                     color: Colors.red,
//                                   ),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       print("klik syarat");
//                                     },
//                                 ),
//                                 TextSpan(text: ","),
//                                 TextSpan(
//                                   text: " ketentuan",
//                                   style: TextStyle(
//                                     color: Colors.red,
//                                   ),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       print("klik ketentuan");
//                                     },
//                                 ),
//                                 TextSpan(text: " dan "),
//                                 TextSpan(
//                                   text: "privasi",
//                                   style: TextStyle(
//                                     color: Colors.red,
//                                   ),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () {
//                                       print("klik privasi");
//                                     },
//                                 ),
//                                 TextSpan(text: " Telkomsel"),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/app_text_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuerySize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: size.height * 0.24,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 63, 63, 63),
                      Color.fromARGB(255, 90, 90, 90),
                      Color.fromARGB(255, 66, 66, 66),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in to your\nAccount',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Sign in to your Account',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormField(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
                      controller: emailController,
                    ),
                    AppTextFormField(
                      labelText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
                      controller: passwordController,
                      obscureText: isObscure,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(48, 48),
                            ),
                          ),
                          icon: Icon(
                            isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        style: Theme.of(context).textButtonTheme.style,
                        child: Text(
                          'Forgot Password?',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'dashboard');
                          // Tambahkan logika untuk tombol login di sini
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors
                              .black), // Ganti warna latar belakang tombol
                          foregroundColor: MaterialStateProperty.all(
                              Colors.white), // Ganti warna teks tombol
                          textStyle: MaterialStateProperty.all(TextStyle(
                              fontSize: 13,
                              fontWeight:
                                  FontWeight.bold)), // Ganti ukuran teks
                        ),
                        child: Text('Login'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            'Or login with',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: Theme.of(context).outlinedButtonTheme.style,
                            label: const Text(
                              'Google',
                              style: TextStyle(color: Colors.black),
                            ),
                            icon: Icon(Icons
                                .ac_unit), // Gantilah dengan ikon yang sesuai jika diperlukan
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: Theme.of(context).outlinedButtonTheme.style,
                            label: const Text(
                              'Facebook',
                              style: TextStyle(color: Colors.black),
                            ),
                            icon: Icon(Icons
                                .access_alarm), // Gantilah dengan ikon yang sesuai jika diperlukan
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'register');
                        // Tambahkan logika untuk tombol login di sini
                      },
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'Register Here',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
