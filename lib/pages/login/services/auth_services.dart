import 'dart:convert';
import 'package:ahli_gigi/config/api_config.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/pages/navbar/navbar.dart';
import 'package:flutter/material.dart';

class AuthService {
  static Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: ['email']).signIn();

      // Check if the sign-in process was canceled
      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'account-selection-canceled',
          message: 'Google Sign In process was canceled',
        );
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // tambahkan data user yang didapat dari google ke dalam database API MySQL (id_google, nama_user, email, password, no_telpon)
      // id_google dan email harus unique, maka jika id_google dan email sudah ada di database, maka tidak perlu ditambahkan lagi

      // Extract user data
      User user = userCredential.user!;
      String userId = user.uid;
      String userName = user.displayName ?? 'Pengguna';
      String userEmail = user.email!;

      // Add user data to MySQL database
      await addUserToDatabase(userId, userName, userEmail);

      // Navigate to the main page after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavBar(initialPageIndex: 0),
        ),
      );

      return userCredential;
    } catch (e) {
      // Handle any errors during the Google Sign In process
      throw FirebaseAuthException(
        code: 'google-signin-failed',
        message: 'Error during Google Sign In process: $e',
      );
    }
  }

  static Future<void> addUserToDatabase(
      String userId, String userName, String userEmail) async {
    var url = Uri.parse(
        '${ApiConfig.baseUrl}/api/User'); // Replace with your API endpoint
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'id_google': userId,
      'nama_user': userName,
      'email': userEmail,
      'role': 'user',
    });

    await http.post(url, headers: headers, body: body);
  }
}
