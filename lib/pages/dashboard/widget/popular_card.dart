import 'package:ahli_gigi/pages/details_page/DetailsPage.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  final String layanan;
  final String namaUser;
  final String imagePath;
  final String review;
  final String harga;
  final String deskripsi;
  final int rating;

  PopularCard({
    required this.layanan,
    required this.namaUser,
    required this.imagePath,
    required this.review,
    required this.harga,
    required this.deskripsi,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        width: 210,
        margin: EdgeInsets.only(
          left: 0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(imagePath),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _truncateLayanan(layanan, 15),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text(
                        namaUser,
                        style: TextStyle(
                            fontSize: 12, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Teks "Review"
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(8),
                    height:
                        40, // Sesuaikan tinggi container dengan kebutuhan Anda
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        review,
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: index < rating ? Colors.yellow : Colors.yellow,
                        size: 16,
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            imagePath: imagePath,
                            layanan: layanan,
                            harga: harga,
                            penjelasan: deskripsi,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'Pesan',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _truncateLayanan(String layanan, int maxCharacters) {
  if (layanan.length > maxCharacters) {
    return layanan.substring(0, maxCharacters) + '...';
  } else {
    return layanan;
  }
}
