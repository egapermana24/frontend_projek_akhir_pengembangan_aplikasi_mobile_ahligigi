import 'package:ahli_gigi/pages/details_page/detailsPage.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DaftarLayananCard extends StatelessWidget {
  final String imagePath;
  final int idLayanan;
  final String nama_layanan;
  final String harga;
  final String deskripsi;
  final bool isAvailable;

  DaftarLayananCard({
    required this.imagePath,
    required this.idLayanan,
    required this.nama_layanan,
    required this.harga,
    required this.deskripsi,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    int hargas = 0; // Initialize harga as an integer

    try {
      // Attempt to parse harga as an integer, catching potential errors
      hargas = int.parse(harga);
    } catch (e) {
      // Handle parsing errors gracefully
      print("Error parsing harga: $e");
      // Provide a default value or alternative action as needed
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(color: AppColors.primaryColor),
        // shadow
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Mengubah alignment agar tombol berada di atas
            children: [
              // Foto Layanan
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(11)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Informasi dokter
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama_layanan,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText),
                    ),
                    Text(
                      '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(double.parse(harga))}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black38,
                      ),
                    ),

                    SizedBox(height: 8),
                    Text(
                      _truncateDescription(deskripsi, 20),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),
                    // SizedBox(height: 10),
                    // Tombol status "Available" dan "Book"
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    imagePath: imagePath,
                    idLayanan: idLayanan,
                    layanan: nama_layanan,
                    harga: harga,
                    penjelasan: deskripsi,
                  ),
                ),
              );
            },
            child: Container(
              width: double
                  .infinity, // Set lebar ke infinity untuk memenuhi panjang baris
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  'Pesan',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _truncateDescription(String description, int maxWords) {
  List<String> words = description.split(' ');
  if (words.length > maxWords) {
    words = words.sublist(0, maxWords);
    return words.join(' ') + '...';
  } else {
    return description;
  }
}
