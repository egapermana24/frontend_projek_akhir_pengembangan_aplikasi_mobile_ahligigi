import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:ahli_gigi/config/api_config.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  late Future<List<dynamic>> _serviceDataLayanan;

  Future<List<dynamic>> getDataLayanan() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String idGoogle = user.uid;
        var url =
            Uri.parse('${ApiConfig.baseUrl}/api/Pemesanan?idGoogle=$idGoogle');
        final response = await http.get(url);

        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          throw Exception('Failed to load data');
        }
      } else {
        throw Exception('User is not logged in');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to get user data');
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _serviceDataLayanan = getDataLayanan();
    });
  }

  @override
  void initState() {
    _serviceDataLayanan = getDataLayanan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text(
          'Riwayat Janji Temu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: FutureBuilder<List<dynamic>>(
          future: _serviceDataLayanan,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(
                      'assets/lottie/LoadingAnimation.json',
                      repeat: true,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Text('Loading...'),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Kamu Belum Memiliki Riwayat'));
            } else {
              List<dynamic> dataLayanan = snapshot.data!;
              dataLayanan.sort((a, b) {
                DateTime dateA = DateTime.parse(a['tanggal_pemesanan']);
                DateTime dateB = DateTime.parse(b['tanggal_pemesanan']);
                return dateB.compareTo(dateA);
              });
              return ListView.builder(
                itemCount: dataLayanan.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              dataLayanan[index]['lokasi_gambar'],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataLayanan[index]['nama_layanan'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${_formatDate(dataLayanan[index]['tanggal_pemesanan'])} - ${_formatTime(dataLayanan[index]['waktu_pemesanan'])}',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: _getStatusColor(
                                      dataLayanan[index]['status_pemesanan']),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                child: Text(
                                  dataLayanan[index]['status_pemesanan'],
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Menunggu Konfirmasi':
        return Colors.orange.withOpacity(0.8);
      case 'Menunggu Kunjungan':
        return Colors.blue.withOpacity(0.8);
      case 'Selesai':
        return Colors.green.withOpacity(0.8);
      case 'Tidak Valid':
        return Colors.red.withOpacity(0.8);
      default:
        return Colors.grey.withOpacity(0.8);
    }
  }

  String _formatDate(String rawDate) {
    DateTime date = DateTime.parse(rawDate);
    return DateFormat('dd MMM y').format(date);
  }

  String _formatTime(String rawTime) {
    DateTime time = DateTime.parse('2024-01-24T$rawTime');
    return DateFormat('HH.mm').format(time) + ' WIB';
  }
}
