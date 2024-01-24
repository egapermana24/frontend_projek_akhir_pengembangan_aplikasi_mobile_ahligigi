import 'package:ahli_gigi/config/api_config.dart';
import 'package:ahli_gigi/pages/categories/categories.dart';
import 'package:ahli_gigi/pages/dashboard/widget/daftar_layanan.dart';
// import 'package:ahli_gigi/pages/navbar/navbar.dart';
import 'package:ahli_gigi/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ahli_gigi/aturan/constants/warna_apps.dart';
import 'package:ahli_gigi/pages/dashboard/widget/popular_card.dart';
import 'package:ahli_gigi/pages/dashboard/widget/service_card.dart';
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
  late Future<List<dynamic>> _serviceData;

  Future<List> getData() async {
    var url = Uri.parse('${ApiConfig.baseUrl}/api/Layanan'); //Api Link
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    _serviceData = getData();
    super.initState();
  }

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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
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
        child: FutureBuilder<List<dynamic>>(
          future: _serviceData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No data available');
            } else {
              List<dynamic> serviceList = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bagian atas dengan foto profil dan username
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(0, 0, 0, 0))),
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
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
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
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            // Tambahkan logika untuk navigasi ke halaman lain di sini
                            // Misalnya, Navigator.push ke halaman baru.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Categories()),
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
                    height: 125,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          serviceList.length > 5 ? 4 : serviceList.length,
                      itemBuilder: (context, index) {
                        var service = serviceList[index];
                        return ServiceCard(
                            service['nama_layanan'], 'assets/icons/image.png');
                      },
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
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
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
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: serviceList.length,
                    itemBuilder: (context, index) {
                      var service = serviceList[index];
                      return DaftarLayananCard(
                        imagePath: 'assets/icons/image2.png',
                        nama_layanan: service['nama_layanan'],
                        specialization: service['gambar_layanan'],
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
    );
  }
}
