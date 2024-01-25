import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'widget/categories_card.dart';
import 'package:ahli_gigi/pages/navbar/navbar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kategori',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
            Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    // Navigate to the next page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Dashboard()), // Replace with the actual page you want to navigate to
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // Gambar kategori
                      Image.asset(
                        'assets/img/1.jpg',
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Nama kategori
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Color.fromARGB(255, 44, 44, 44).withOpacity(
                            0.7), // Warna background teks dengan opasitas
                        child: Text(
                          'Pembuatan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Warna teks
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    // Navigate to the next page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Dashboard()), // Replace with the actual page you want to navigate to
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // Gambar kategori
                      Image.asset(
                        'assets/img/2.jpg',
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Nama kategori
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Color.fromARGB(255, 44, 44, 44).withOpacity(
                            0.7), // Warna background teks dengan opasitas
                        child: Text(
                          'Pemasangan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Warna teks
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    // Navigate to the next page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Dashboard()), // Replace with the actual page you want to navigate to
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // Gambar kategori
                      Image.asset(
                        'assets/img/3.jpg',
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Nama kategori
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Color.fromARGB(255, 44, 44, 44).withOpacity(
                            0.7), // Warna background teks dengan opasitas
                        child: Text(
                          'Konsultasi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Warna teks
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    // Navigate to the next page here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Dashboard()), // Replace with the actual page you want to navigate to
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // Gambar kategori
                      Image.asset(
                        'assets/img/1.jpg',
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // Nama kategori
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Color.fromARGB(255, 44, 44, 44).withOpacity(
                            0.7), // Warna background teks dengan opasitas
                        child: Text(
                          'Garansi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Warna teks
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            // CategoryCard(
            //   categoryName: 'Pembuatan',
            //   imagePath: 'assets/img/1.jpg',
            // ),
            // CategoryCard(
            //   categoryName: 'Pemasangan',
            //   imagePath: 'assets/img/2.jpg',
            // ),
            // CategoryCard(
            //   categoryName: 'Konsultasi',
            //   imagePath: 'assets/img/3.jpg',
            // ),
            // CategoryCard(
            //   categoryName: 'Garansi',
            //   imagePath: 'assets/img/1.jpg',
            // ),

            // Tambahkan CategoryCard lainnya di sini
          ],
        ),
      ),
    );
  }
}
