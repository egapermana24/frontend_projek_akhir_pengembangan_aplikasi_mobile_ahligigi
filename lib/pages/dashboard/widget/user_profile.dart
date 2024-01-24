import 'package:flutter/material.dart';
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
        ? 'Bergabung sejak ${user?.metadata.creationTime?.toLocal().toString().split(' ')[0]}'
        : '';
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(0, 0, 0, 0))),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(user?.photoURL ?? ''),
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
                        joinDate,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
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
