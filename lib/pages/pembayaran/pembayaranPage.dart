import 'dart:convert';
import 'dart:io';
import 'package:ahli_gigi/config/api_config.dart';
import 'package:ahli_gigi/pages/pembayaran/pembayaranSukses.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class PembayaranPage extends StatefulWidget {
  final int idLayanan;
  final String layanan;
  final String harga;
  final String jam;
  const PembayaranPage({
    Key? key,
    required this.idLayanan,
    required this.layanan,
    required this.harga,
    required this.jam,
  }) : super(key: key);

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
  dateNow() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  int? selectedPaymentMethod;
  File? _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Function to get id_google of the logged-in user
  Future<String?> getIdGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      User? user = auth.currentUser;

      if (user != null) {
        String idGoogle = user.uid;
        return idGoogle;
      } else {
        return null; // No user is currently logged in
      }
    } catch (e) {
      print("Error getting id_google: $e");
      return null;
    }
  }

  Future<int> fetchUserId(String idGoogle) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/api/User?id_google=$idGoogle'),
      );

      if (response.statusCode == 200) {
        // Parse the response to get the user ID
        final Map<String, dynamic> userData = jsonDecode(response.body);
        return userData['id_user'];
      } else {
        // Handle errors
        throw Exception('Gagal memuat ID pengguna');
      }
    } catch (e) {
      print("Error fetching user ID: $e");
      throw Exception('Gagal memuat ID pengguna');
    }
  }

 Future<void> kirimDataPemesanan() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/Pemesanan');

  // Replace this with the actual user ID retrieval logic
  final String idGoogle = await getIdGoogle() ?? '';

  // Determine payment method based on selectedPaymentMethod
  String metodePembayaran = '';
  if (selectedPaymentMethod == 1) {
    metodePembayaran = 'Dompet Digital';
  } else if (selectedPaymentMethod == 2) {
    metodePembayaran = 'Bank';
  } else if (selectedPaymentMethod == 3) {
    metodePembayaran = 'COD';
  }

  try {
    // Prepare data to be sent to the API
    final Map<String, dynamic> dataPemesanan = {
      'id_layanan': widget.idLayanan,
      'id_user': await fetchUserId(idGoogle),
      'id_google': idGoogle,
      'tanggal_pemesanan': dateNow(),
      'waktu_pemesanan': widget.jam,
      'status_pemesanan': 'Menunggu Konfirmasi',
      'metode_pembayaran': metodePembayaran,
      if (_image != null)
        // Convert the image to a MultipartFile
        // and assign it to the 'bukti_pembayaran' key
        // in the dataPemesanan map
        'bukti_pembayaran': await MultipartFile.fromFile(_image!.path, filename: 'bukti_pembayaran.jpg'),
      // 'bukti_pembayaran': await MultipartFile.fromFile(_image!.path, filename: 'bukti_pembayaran.jpg'),
    };

    // Send data to the API
    final response = await Dio().post(
      url.toString(),
      data: FormData.fromMap(dataPemesanan),
    );

    // Check the response status
    if (response.statusCode! >= 200 && response.statusCode! <= 208) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PembayaranSuksesPage()),
      );
      // tampilkan semua data yang dikirimkan
      print('Berhasil mengirim data: ${response.data}');
    } else {
      // If failed, print an error message or take appropriate action
      print('Gagal mengirim data: ${dataPemesanan}');
      print('Gagal mengirim data: ${response.data}');
      print('Gagal mengirim data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pembayaran',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.primaryText),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Tambahkan SingleChildScrollView di sini
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Detail Yang Harus dibayarkan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16.0),
                // tambahkan decoration background
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Layanan',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.layanan,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Waktu',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Hari ini, ${widget.jam.substring(0, 5)} WIB',
                          // 'Hari ini, 10:00 WIB',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Pembayaran',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(double.parse(widget.harga))}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Pilih Metode Pembayaran:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                      color: selectedPaymentMethod == 1
                          ? AppColors.primaryColor
                          : Colors.grey, // Warna abu-abu jika belum terpilih
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: selectedPaymentMethod == 1
                        ? Colors.white
                            .withOpacity(0.9) // Warna latar belakang terpilih
                        : Colors.white,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/wallet.jpg',
                          width: double.infinity),
                      if (selectedPaymentMethod == 1)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text('Silahkan Untuk Melakukan:',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text(
                                '1. Pilih Dompet Digital mana yang akan digunakan',
                                style: TextStyle(fontSize: 14)),
                            Text(
                                '2. Masukkan Nomor Handphone 085794912280 sebagai penerima',
                                style: TextStyle(fontSize: 14)),
                            Text(
                                '3. Masukkan Jumlah Pembayaran sesuai dengan yang tertera',
                                style: TextStyle(fontSize: 14)),
                            Text(
                                '4. Jika Pembayaran Berhasil segera kirimkan bukti screenshot pada tombol upload bukti pembayaran',
                                style: TextStyle(fontSize: 14)),
                            Text('4. Selesai', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                      color: selectedPaymentMethod == 2
                          ? AppColors.primaryColor
                          : Colors.grey, // Warna abu-abu jika belum terpilih
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: selectedPaymentMethod == 2
                        ? Colors.white
                            .withOpacity(0.9) // Warna latar belakang terpilih
                        : Colors.white,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/img/bank.jpg',
                          width: double.infinity),
                      if (selectedPaymentMethod == 2)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text('Silahkan Untuk Melakukan:',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text('1. Pilih Bank mana yang akan digunakan',
                                style: TextStyle(fontSize: 14)),
                            Text(
                                '2. Masukkan Nomor Rekening BCA 987654321 sebagai penerima',
                                style: TextStyle(fontSize: 14)),
                            Text(
                                '3. Masukkan Jumlah Pembayaran sesuai dengan yang tertera',
                                style: TextStyle(fontSize: 14)),
                            Text(
                                '4. Jika Pembayaran Berhasil segera kirimkan bukti screenshot pada tombol upload bukti pembayaran',
                                style: TextStyle(fontSize: 14)),
                            Text('4. Selesai', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 3;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(
                      color: selectedPaymentMethod == 3
                          ? AppColors.primaryColor
                          : Colors.grey, // Warna abu-abu jika belum terpilih
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: selectedPaymentMethod == 3
                        ? Colors.white
                            .withOpacity(0.9) // Warna latar belakang terpilih
                        : Colors.white,
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/img/cod.jpg', width: double.infinity),
                      if (selectedPaymentMethod == 3)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text('Silahkan Untuk Melakukan:',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text('1. Datang ke tempat',
                                style: TextStyle(fontSize: 14)),
                            Text('2. Konfirmasi pembayaran kepada pihak kami',
                                style: TextStyle(fontSize: 14)),
                            Text(
                                '3. Melakukan transaksi pembayaran sesuai dengan yang tertera',
                                style: TextStyle(fontSize: 14)),
                            Text('4. Selesai', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (selectedPaymentMethod != 3)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bukti Pembayaran:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Column(
                      children: [
                        // Tampilkan gambar yang diupload jika ada
                        _image == null ? const SizedBox() : Image.file(_image!),

                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Container(
                            width:
                                double.infinity, // Menggunakan lebar maksimal
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors
                                  .white, // Ganti dengan warna yang diinginkan
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.primaryColor,
                                width: 2.0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Upload Bukti Pembayaran',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  kirimDataPemesanan();

                  // Panggil fungsi untuk mengambil gambar
                },
                child: Container(
                  width: double.infinity, // Menggunakan lebar maksimal
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.blue, // Ganti dengan warna yang diinginkan
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Selesai',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
