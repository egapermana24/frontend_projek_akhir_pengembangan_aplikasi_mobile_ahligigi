import 'package:ahli_gigi/pages/dashboard/dashboard.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';
import 'widget/categories_card.dart';
import 'package:ahli_gigi/pages/navbar/navbar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text(
          'Kategori',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0), // Mengatur sudut kanan atas
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    // Navigate to the next page here
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBar(initialPageIndex: 3),
                        ));
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // Gambar kategori
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            15.0), // Sesuaikan nilai sesuai kebutuhan
                        child: Image.asset(
                          'assets/img/Kpembuatan.jpg',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Nama kategori
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(
                                15.0), // Mengatur sudut kanan atas
                          ),
                        ),
                        child: Text(
                          'Pembuatan',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBar(initialPageIndex: 3),
                        ));
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            15.0), // Sesuaikan nilai sesuai kebutuhan
                        child: Image.asset(
                          'assets/img/Kpemasangangigipalsu.jpg',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Nama kategori
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                15.0), // Mengatur sudut kanan atas
                            bottomLeft: Radius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          'Pemasangan',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBar(initialPageIndex: 3),
                        ));
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            15.0), // Sesuaikan nilai sesuai kebutuhan
                        child: Image.asset(
                          'assets/img/Kkonsultasi.jpg',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Nama kategori
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                15.0), // Mengatur sudut kanan atas
                            bottomLeft: Radius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          'Konsultasi',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBar(initialPageIndex: 3),
                        ));
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            15.0), // Sesuaikan nilai sesuai kebutuhan
                        child: Image.asset(
                          'assets/img/Kgaransi.jpg',
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Nama kategori
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.7),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                15.0), // Mengatur sudut kanan atas
                            bottomLeft: Radius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          'Garansi',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
