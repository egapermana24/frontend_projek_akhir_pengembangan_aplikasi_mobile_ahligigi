import 'package:ahli_gigi/config/api_config.dart';
import 'package:ahli_gigi/pages/dashboard/widget/daftar_layanan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Layanan extends StatefulWidget {
  const Layanan({super.key});

  @override
  State<Layanan> createState() => _LayananState();
}

class _LayananState extends State<Layanan> {
  late User? user;
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
    initializeUser();
  }

  void initializeUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color.fromARGB(
          255, 0, 0, 0), //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
       appBar: AppBar(
        title: Text('Daftar Layanan',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      backgroundColor: AppColors.backGroundColor,
      body: SingleChildScrollView(
        child: FutureBuilder<List<dynamic>>(
          future: _serviceData,
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
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
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
                  const SizedBox(height: 5),
                  // Popular
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: serviceList.length,
                    itemBuilder: (context, index) {
                      var service = serviceList[index];
                      return DaftarLayananCard(
                        imagePath: 'assets/icons/image2.png',
                        nama_layanan: service['nama_layanan'],
                        harga: service['harga'],
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
