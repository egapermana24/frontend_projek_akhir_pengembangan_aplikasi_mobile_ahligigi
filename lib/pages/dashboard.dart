import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, 'login'); // kembali ke halaman login
              },
            ),
          ],
          title: Text(
            'Welcome!',
            style: TextStyle(
                fontSize: 23, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.grey[900]),
    );
  }
}
