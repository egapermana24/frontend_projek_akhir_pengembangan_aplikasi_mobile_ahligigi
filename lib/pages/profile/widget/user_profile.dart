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
    String shortName = fullName.isNotEmpty
        ? fullName.split(' ').length >= 2
            ? '${fullName.split(' ')[0]} ${fullName.split(' ')[1]}'
            : fullName
        : 'Pengguna';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        radius: 52,
                        backgroundColor: AppColors.primaryColor,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: user?.photoURL != null
                              ? NetworkImage(user!.photoURL!)
                              : AssetImage('assets/img/empty-user.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    // SizedBox(width: 16),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            fullName.isNotEmpty ? fullName : 'Pengguna',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText,
                            ),
                            textAlign: TextAlign.center,
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
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
