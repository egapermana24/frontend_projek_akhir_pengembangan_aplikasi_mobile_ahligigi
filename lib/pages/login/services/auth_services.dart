import 'package:ahli_gigi/pages/dashboard/widget/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/pages/navbar/navbar.dart';
// material
import 'package:flutter/material.dart';

class AuthService {
  static Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: ['email'])
              .signIn();

      // GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      // String userName = googleSignInAccount?.displayName ?? 'Guest';

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

      UserProfile(
        user: userCredential.user,
      );

      // Navigasi ke halaman MainTabBar setelah login berhasil
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
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:simplynews/screen/navbar/navbar.dart';

// class Authentication {
//   static SnackBar customSnackBar({required String content}) {
//     return SnackBar(
//       backgroundColor: Colors.black,
//       content: Text(
//         content,
//         style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
//       ),
//     );
//   }

//   static Future<FirebaseApp> initializeFirebase({
//     required BuildContext context,
//   }) async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();

//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => MainTabBar(
//             initialPageIndex: 0,
//           ),
//         ),
//       );
//     }

//     return firebaseApp;
//   }

//   static Future<User?> signInWithGoogle({required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;

//     if (kIsWeb) {
//       GoogleAuthProvider authProvider = GoogleAuthProvider();

//       try {
//         final UserCredential userCredential =
//             await auth.signInWithPopup(authProvider);

//         user = userCredential.user;
//       } catch (e) {
//         print(e);
//       }
//     } else {
//       final GoogleSignIn googleSignIn = GoogleSignIn();

//       try {
//         final GoogleSignInAccount? googleSignInAccount =
//             await googleSignIn.signIn();

//         if (googleSignInAccount != null) {
//           final GoogleSignInAuthentication googleSignInAuthentication =
//               await googleSignInAccount.authentication;

//           final AuthCredential credential = GoogleAuthProvider.credential(
//             accessToken: googleSignInAuthentication.accessToken,
//             idToken: googleSignInAuthentication.idToken,
//           );

//           final UserCredential userCredential =
//               await auth.signInWithCredential(credential);

//           user = userCredential.user;
//         }
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             Authentication.customSnackBar(
//               content: 'The account already exists with a different credential',
//             ),
//           );
//         } else if (e.code == 'invalid-credential') {
//           ScaffoldMessenger.of(context).showSnackBar(
//             Authentication.customSnackBar(
//               content: 'Error occurred while accessing credentials. Try again.',
//             ),
//           );
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           Authentication.customSnackBar(
//             content: 'Error occurred using Google Sign In. Try again.',
//           ),
//         );
//       }
//     }

//     return user;
//   }

//   static Future<void> signOut({required BuildContext context}) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     try {
//       if (!kIsWeb) {
//         await googleSignIn.signOut();
//       }
//       await FirebaseAuth.instance.signOut();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         Authentication.customSnackBar(
//           content: 'Error signing out. Try again.',
//         ),
//       );
//     }
//   }
// }
