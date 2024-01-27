import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/pages/profile/widget/user_profile.dart';
import 'package:ahli_gigi/pages/login/login.dart';
import 'package:ahli_gigi/pages/profile/components/info_akun.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserProfile(
              user: FirebaseAuth.instance.currentUser,
              onPressed: () => _showFullscreenImage(context),
            ),
            SizedBox(
              height: 20,
            ),
            // -------INFO AKUN-------
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => InfoAkun()),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.account_circle,
                          size: 40,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        'Info Akun',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/arrow-right.png',
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            // -------ALAMAT-------
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => InfoAkun()),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.location_on_rounded,
                          size: 40,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        'Alamat',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/arrow-right.png',
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // -------TENTANG-------
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => InfoAkun()),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.info_outline,
                          size: 40,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        'Tentang',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/arrow-right.png',
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // -------BANTUAN-------
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => InfoAkun()),
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.help_outline_rounded,
                          size: 40,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        'Bantuan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/icons/arrow-right.png',
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // -------BANTUAN-------
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  _signOut(context);
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 50,
            //   margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            //   child: ElevatedButton(
            //     onPressed: () => _signOut(context),
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.red,
            //       onPrimary: Colors.white,
            //     ),
            //     child: Text('Logout'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

// Function to show fullscreen image
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

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}
