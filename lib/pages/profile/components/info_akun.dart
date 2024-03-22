import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahli_gigi/pages/profile/widget/user_profile.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';

class InfoAkun extends StatefulWidget {
  const InfoAkun({Key? key}) : super(key: key);

  @override
  State<InfoAkun> createState() => _InfoAkunState();
}

class _InfoAkunState extends State<InfoAkun> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text(
          'Info Akun',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UserProfile(
            user: FirebaseAuth.instance.currentUser,
            onPressed: () => _showFullscreenImage(context),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }

  // Function to show fullscreen image
//   void _showFullscreenImage(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           child: Container(
//             height: 300,
//             width: 300,
//             child: Image.asset(
//               'assets/icons/image.png',
//               fit: BoxFit.cover,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

  void _showFullscreenImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 300,
            width: 300,
            child: SizedBox(
              width: 150.0,
              height: 150.0,
              child: FirebaseAuth.instance.currentUser?.photoURL != null
                  ? Image.network(
                      FirebaseAuth.instance.currentUser!.photoURL!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/empty-user.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        );
      },
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: InfoAkun(),
//   ));
