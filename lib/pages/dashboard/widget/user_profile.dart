import 'package:ahli_gigi/pages/navbar/navbar.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahli_gigi/pages/profile/profile.dart';

class UserProfile extends StatelessWidget {
  final User? user;
  final VoidCallback? onPressed;

  UserProfile({Key? key, required this.user, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fullName = user?.displayName ?? '';
    String shortName =
        fullName.isNotEmpty ? fullName.split(' ')[0] : 'Pengguna';
    String joinDate = user != null
        ? 'Bergabung sejak ${user?.metadata.creationTime != null ? DateFormat('dd MMM yyyy').format(user!.metadata.creationTime!.toLocal()) : ''}'
        : 'Belum Bergabung';
    String email = user?.email ?? 'Tidak ada email';
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity, // Membuat container selebar layar
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(0, 0, 0, 0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.primaryColor,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: user?.photoURL != null
                        ? NetworkImage(user!.photoURL!)
                        : AssetImage('assets/img/empty-user.png')
                            as ImageProvider,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo, $shortName!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                        Text(
                          email,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Text(
                          joinDate,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.only(bottom: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  4.0), // Sesuaikan dengan ukuran padding yang diinginkan
                              child: Image.asset(
                                'assets/icons/bell.png',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBar(initialPageIndex: 3),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    4.0), // Sesuaikan dengan ukuran padding yang diinginkan
                                child: Image.asset(
                                  'assets/icons/ic_selected_category.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
