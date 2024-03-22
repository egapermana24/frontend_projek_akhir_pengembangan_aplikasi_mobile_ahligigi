import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class detailsHistoryWidget extends StatelessWidget {
  final String imagePath;
  final int idLayanan;
  final String layanan;
  final String harga;
  final String tanggal;
  final String waktu;
  final String status;
  final String metodePembayaran;

  detailsHistoryWidget({
    Key? key,
    required this.imagePath,
    required this.idLayanan,
    required this.layanan,
    required this.harga,
    required this.tanggal,
    required this.waktu,
    required this.status,
    required this.metodePembayaran,
  }) : super(key: key);

  // Fungsi untuk memformat tanggal dalam bahasa Indonesia
  String formatDate(String dateString) {
    // Parse tanggal menjadi objek DateTime
    DateTime dateTime = DateTime.parse(dateString);

    // Format tanggal sesuai dengan bahasa Indonesia
    String formattedDate = DateFormat('dd MMMM yyyy', 'id_ID').format(dateTime);

    return formattedDate;
  }

  // Fungsi untuk memformat waktu dalam bahasa Indonesia
  String formatTime(String timeString) {
    // Gabungkan string waktu dengan string tanggal dummy
    String dateTimeString = '1970-01-01 $timeString';
    DateTime time = DateTime.parse(dateTimeString);
    String formattedTime =
        DateFormat.Hm('id_ID').format(time) + ' WIB'; // Format jam:menit
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    // Implementasi widget
    return Column(
      children: [
        // Konten widget
        Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor, width: 5),
                borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    child: Text(
                      layanan,
                      style: const TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Status
        Container(
          decoration: BoxDecoration(
            color: _getStatusColor(status),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: Text(
            status,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          thickness: 0.5,
          indent: 20,
          endIndent: 20,
          color: Colors.black,
        ),
        // Harga
        const SizedBox(height: 10),
        Text(
          'Harga',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 70, right: 70),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(double.parse(harga))}',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
        // Tanggal
        const SizedBox(height: 20),
        Text(
          'Tanggal',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 70, right: 70),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatDate(tanggal),
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ), // Gunakan fungsi formatDate di sini
        // Waktu
        SizedBox(height: 20),
        Text(
          'Jam',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 70, right: 70),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formatTime(waktu),
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
        // Metode Pembayaran
        const SizedBox(height: 20),
        Text(
          'Metode Pembayaran',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 30,
          margin: EdgeInsets.only(left: 70, right: 70),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                metodePembayaran,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ],
          ),
        ),
      ],
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
}
