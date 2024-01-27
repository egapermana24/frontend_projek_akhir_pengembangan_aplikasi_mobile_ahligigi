import 'package:ahli_gigi/config/api_config.dart';
import 'package:ahli_gigi/pages/categories/categories.dart';
import 'package:ahli_gigi/pages/dashboard/widget/daftar_layanan.dart';
import 'package:ahli_gigi/pages/dashboard/widget/user_profile.dart';
import 'package:ahli_gigi/pages/details_page/DetailsPage.dart';
import 'package:ahli_gigi/pages/navbar/navbar.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
// import 'package:ahli_gigi/pages/navbar/navbar.dart';
import 'package:ahli_gigi/pages/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ahli_gigi/pages/dashboard/widget/popular_card.dart';
import 'package:ahli_gigi/pages/dashboard/widget/service_card.dart';
import 'package:ahli_gigi/pages/layanan/layananPage.dart';
import 'package:ahli_gigi/pages/login/login.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late User? user;
  late Future<List<dynamic>> _serviceDataLayanan;
  late Future<List<dynamic>> _serviceDataUlasan;

  Future<List> getDataLayanan() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Layanan');
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  Future<List> getDataUlasan() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Ulasan');
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    _serviceDataLayanan = getDataLayanan();
    _serviceDataUlasan = getDataUlasan();
    super.initState();
    initializeUser();
  }

  void initializeUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SingleChildScrollView(
          child: FutureBuilder<List<dynamic>>(
            future: _serviceDataLayanan,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 50.0), // Ganti nilai sesuai kebutuhan
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No data available');
              } else {
                List<dynamic> serviceList = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserProfile(
                      user: user,
                    ),
                    // Bagian atas dengan foto profil dan username
                    // Konten dashboard lainnya dapat ditambahkan di sini
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0), // Atur padding vertikal
                          ),
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
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              // Tambahkan logika untuk navigasi ke halaman lain di sini
                              // Misalnya, Navigator.push ke halaman baru.
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NavBar(initialPageIndex: 3)),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: const Text(
                                'More',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Kotak container dengan gambar dan nama layanan
                    Container(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: serviceList.length > 2
                            ? 4
                            : serviceList
                                .length, // Apabila Lebih dari 2 maka tampilkan 4
                        itemBuilder: (context, index) {
                          var service = serviceList[index];
                          return GestureDetector(
                            onTap: () {
                              // Navigasi ke halaman detail dengan membawa data service
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    imagePath: service['lokasi_gambar'],
                                    layanan: service['nama_layanan'],
                                    harga: service['harga'].toString(),
                                    penjelasan: service['deskripsi'],
                                  ),
                                ),
                              );
                            },
                            child: ServiceCard(
                              service['nama_layanan'],
                              service['lokasi_gambar'],
                            ),
                          );
                        },
                      ),
                    ),
                    // Popular
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ulasan',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              // Tambahkan logika untuk navigasi ke halaman lain di sini
                              // Misalnya, Navigator.push ke halaman baru.
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NavBar(initialPageIndex: 3)),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: const Text(
                                'More',
                                style:
                                    TextStyle(fontSize: 13, color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // List ulasan populer
                    Container(
                      height: 200,
                      child: FutureBuilder<List<dynamic>>(
                        future: _serviceDataUlasan,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Text('No data available');
                          } else {
                            List<dynamic> ulasanList = snapshot.data!;
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ulasanList.length > 2
                                  ? 4
                                  : ulasanList
                                      .length, // Apabila Lebih dari 2 maka tampilkan 4
                              itemBuilder: (context, index) {
                                var ulasan = ulasanList[index];
                                return PopularCard(
                                  layanan: ulasan['nama_layanan'],
                                  namaUser: ulasan['nama_user'],
                                  imagePath: ulasan['lokasi_gambar'],
                                  review: ulasan['komentar'],
                                  harga: ulasan['harga'].toString(),
                                  deskripsi: ulasan['deskripsi'],
                                  rating: ulasan['nilai_ulasan'],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 5),
                    // Popular
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daftar Layanan',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Tambahkan logika untuk navigasi ke halaman lain di sini
                              // Misalnya, Navigator.push ke halaman baru.
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Layanan(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                'More',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: serviceList.length > 2
                          ? 2
                          : serviceList
                              .length, // Apabila Lebih dari 2 maka tampilkan 2
                      itemBuilder: (context, index) {
                        var service = serviceList[index];
                        return DaftarLayananCard(
                          imagePath: service['lokasi_gambar'],
                          nama_layanan: service['nama_layanan'],
                          harga: service['harga'].toString(),
                          deskripsi: service['deskripsi'],
                          isAvailable: false,
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
