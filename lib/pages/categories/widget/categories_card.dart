import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  CategoryCard({required this.categoryName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          // Gambar kategori
          Image.asset(
            imagePath,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          // Nama kategori
          Container(
            padding: EdgeInsets.all(8),
            color: AppColors.primaryColor
                .withOpacity(0.7), // Warna background teks dengan opasitas
            child: Text(
              categoryName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks
              ),
            ),
          ),
        ],
      ),
    );
  }
}
