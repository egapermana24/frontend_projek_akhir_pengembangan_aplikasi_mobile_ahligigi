import 'package:flutter/material.dart';
import 'widget/categories_card.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: SearchBar(),
            // ),
            CategoryCard(
              categoryName: 'Pembuatan',
              imagePath: 'assets/img/1.jpg',
            ),
            CategoryCard(
              categoryName: 'Pemasangan',
              imagePath: 'assets/img/2.jpg',
            ),
            CategoryCard(
              categoryName: 'Konsultasi',
              imagePath: 'assets/img/3.jpg',
            ),
            CategoryCard(
              categoryName: 'Garansi',
              imagePath: 'assets/img/1.jpg',
            ),
            // Tambahkan CategoryCard lainnya di sini
          ],
        ),
      ),
    );
  }
}
