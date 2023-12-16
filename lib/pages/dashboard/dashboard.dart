import 'package:ahli_gigi/pages/dashboard/widget/list_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ahli_gigi/aturan/constants/warna_apps.dart';
import 'package:ahli_gigi/pages/dashboard/widget/doctor_card.dart';
import 'package:ahli_gigi/pages/dashboard/widget/service_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color.fromARGB(
          255, 0, 0, 0), //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, 'Login'); // kembali ke halaman login
              },
            ),
          ],
          title: Text(
            'Welcome!',
            style: TextStyle(
                fontSize: 23,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255)),
      backgroundColor: AppColors.backGroundColor,
      // body: LayoutBuilder(
      //   builder: (BuildContext context, BoxConstraints constraints) {
      //     if (constraints.maxWidth <= 600) {
      //       return const ContentNewsList();
      //     } else if (constraints.maxWidth <= 1200) {
      //       return const ContentNewsGrid(gridCount: 4, fontSize: 11);
      //     } else {
      //       return const ContentNewsGrid(gridCount: 5, fontSize: 14);
      //     }
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian atas dengan foto profil dan username
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/profile_picture.jpg'),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Konten dashboard lainnya dapat ditambahkan di sini
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Layanan dan More
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Layanan',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'More',
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
            ),
            // Kotak container dengan gambar dan nama layanan
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ServiceCard('Service 1', 'assets/img/service1.jpg'),
                  ServiceCard('Service 2', 'assets/img/service2.jpg'),
                  ServiceCard('Service 3', 'assets/img/service3.jpg'),
                  ServiceCard('Service 4', 'assets/img/service4.jpg'),
                  ServiceCard('Service 5', 'assets/img/service5.jpg'),
                  // Tambahkan layanan lainnya di sini
                ],
              ),
            ),
            // Popular
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // List dokter populer
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DoctorCard(
                    'Dr. John Doe',
                    'Cardiologist',
                    'assets/doctor1.jpg',
                    'Excellent doctor, highly recommended!',
                    4,
                  ),
                  DoctorCard(
                    'Dr. Jane',
                    'Pediatrician',
                    'assets/doctor2.jpg',
                    'Great with kids, very patient and understanding.',
                    5,
                  ),
                  // Tambahkan DoctorCard lainnya di sini
                ],
              ),
            ),
            // Popular
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'List of Doctor',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            DoctorListCard(
              doctorName: 'Dr. John Doe',
              specialization: 'Cardiologist',
              biography:
                  'Lorem ipsum dolor sit amet,consectetur adipiscing elit.',
              isAvailable:
                  true, // Ganti dengan nilai sesuai dengan status dokter
            ),
            // Konten dashboard lainnya dapat ditambahkan di sini
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Selamat datang di dashboard Anda!'),
            ),
          ],
        ),
      ),
    );
  }
}
