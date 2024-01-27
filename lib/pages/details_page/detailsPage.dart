import 'package:ahli_gigi/pages/details_page/widget/details_page_widget.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String imagePath;
  final String layanan;
  final String harga;
  final String penjelasan;

  const DetailsPage({
    Key? key,
    required this.imagePath,
    required this.layanan,
    required this.harga,
    required this.penjelasan,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deskripsi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            )),
        centerTitle: true,
      ),
      body: DetailsPageWidget(
        imagePath: widget.imagePath,
        layanan: widget.layanan,
        harga: widget.harga,
        penjelasan: widget.penjelasan,
      ),
    );
  }
}
