import 'package:ahli_gigi/pages/categories/categories.dart';
import 'package:ahli_gigi/pages/dashboard/widget/daftar_layanan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ahli_gigi/aturan/constants/warna_apps.dart';
import 'package:ahli_gigi/pages/dashboard/widget/popular_card.dart';
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
            style: const TextStyle(
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
            const Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/img/profile_picture.jpg'),
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
            const Padding(
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
                  const Text(
                    'Layanan',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      // Tambahkan logika untuk navigasi ke halaman lain di sini
                      // Misalnya, Navigator.push ke halaman baru.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Categories()),
                      );
                    },
                    child: const Text(
                      'More',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
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
                  ServiceCard('Pembuatan', 'assets/icons/google.png'),
                  ServiceCard('Pemasangan', 'assets/icons/google.png'),
                  ServiceCard('Konsultasi', 'assets/icons/google.png'),
                  ServiceCard('Garansi', 'assets/icons/google.png'),
                  // Tambahkan layanan lainnya di sini
                ],
              ),
            ),
            // Popular
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Yang Dicari',
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
                  PopularCard(
                    'Gigi Palsu',
                    'Lorem ipsum',
                    'assets/doctor1.jpg',
                    'Excellent doctor, highly recommended!, Thank You So Muchhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                    4,
                  ),
                  PopularCard(
                    'Pasang Behel',
                    'Lorem ipsum',
                    'assets/doctor2.jpg',
                    'Great with kids, very patient and understanding. Thank You So Muchhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                    5,
                  ),
                  // Tambahkan DoctorCard lainnya di sini
                ],
              ),
            ),
            const SizedBox(height: 5),
            // Popular
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daftar Layanan',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            DaftarLayananCard(
              layanan: 'Tambal Gigi',
              specialization: 'Lorem ipsum',
              biography:
                  'Lorem ipsum dolor sit amet,consectetur adipiscing elit.',
              isAvailable:
                  true, // Ganti dengan nilai sesuai dengan status dokter
            ),
            DaftarLayananCard(
              layanan: 'Gigi Palsu',
              specialization: 'Lorem ipsum',
              biography:
                  'Lorem ipsum dolor sit amet,consectetur adipiscing elit.',
              isAvailable:
                  true, // Ganti dengan nilai sesuai dengan status dokter
            ),
            DaftarLayananCard(
              layanan: 'Pasang Behel',
              specialization: 'Lorem ipsum',
              biography:
                  'Lorem ipsum dolor sit amet,consectetur adipiscing elit.',
              isAvailable:
                  true, // Ganti dengan nilai sesuai dengan status dokter
            ),
            DaftarLayananCard(
              layanan: 'Venner Scaling',
              specialization: 'Lorem ipsum',
              biography:
                  'Lorem ipsum dolor sit amet,consectetur adipiscing elit.',
              isAvailable:
                  true, // Ganti dengan nilai sesuai dengan status dokter
            ),
            // Konten dashboard lainnya dapat ditambahkan di sini
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Selamat datang di dashboard Anda!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
