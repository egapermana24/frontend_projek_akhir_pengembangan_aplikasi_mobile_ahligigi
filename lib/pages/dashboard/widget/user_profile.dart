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
    // fullName
    String fullName = user?.displayName ?? '';
    String joinDate = user != null
        ? 'Bergabung sejak ${user?.metadata.creationTime != null ? DateFormat('dd MMM yyyy').format(user!.metadata.creationTime!.toLocal()) : ''}'
        : '';
    String email = user?.email ?? '';
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(0, 0, 0, 0))),
              child: Row(
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
                      radius: 33,
                      backgroundColor:
                          AppColors.primaryColor, // Warna latar belakang
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user?.photoURL ?? ''),
                        backgroundColor:
                            Colors.white, // Warna latar belakang gambar
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
