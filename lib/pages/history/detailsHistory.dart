import 'package:ahli_gigi/pages/history/widget/details_History_Widget.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';

class detailsHistory extends StatefulWidget {
  final String imagePath;
  final int idLayanan;
  final String layanan;
  final String harga;
  final String tanggal;
  final String waktu;
  final String status;
  final String metodePembayaran;

  const detailsHistory({
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

  @override
  State<detailsHistory> createState() => _detailsHistoryState();
}

class _detailsHistoryState extends State<detailsHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Janji Temu',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: detailsHistoryWidget(
        imagePath: widget.imagePath,
        idLayanan: widget.idLayanan,
        layanan: widget.layanan,
        harga: widget.harga,
        tanggal: widget.tanggal,
        waktu: widget.waktu,
        status: widget.status,
        metodePembayaran: widget.metodePembayaran,
      ),
    );
  }
}
