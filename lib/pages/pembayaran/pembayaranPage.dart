import 'dart:io';
import 'package:ahli_gigi/pages/pembayaran/pembayaranSukses.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({Key? key}) : super(key: key);

  @override
  _PembayaranPageState createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {
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
                'Jumlah Yang Harus dibayarkan:',
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
                          'Tambal Gigi',
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
                          'Hari ini, 12.00 WIB',
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
                          'Rp100.000,00',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PembayaranSuksesPage()),
                  );
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

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: PembayaranPage(),
    ),
  ));
}
