import 'package:ahli_gigi/pages/DetailsPage/DetailsPage.dart';
import 'package:flutter/material.dart';

class DaftarLayananCard extends StatelessWidget {
  final String imagePath;
  final String nama_layanan;
  final String specialization;
  final String deskripsi;
  final bool isAvailable;

  DaftarLayananCard({
    required this.imagePath,
    required this.nama_layanan,
    required this.specialization,
    required this.deskripsi,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Mengubah alignment agar tombol berada di atas
        children: [
          // Foto Layanan
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(7)),
              child: Center(
                child: Image.asset(
                  imagePath,
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  specialization,
                  style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 235, 235, 235)),
                ),
                SizedBox(height: 8),
                Text(
                  _truncateDescription(deskripsi, 20),
                  style: TextStyle(
                    fontSize: 10,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                SizedBox(height: 20),
                // Tombol status "Available" dan "Book"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Tambahkan logika untuk mengubah status "Available"
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isAvailable ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          isAvailable ? 'Available' : 'Booked',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: imagePath,
                              layanan: nama_layanan,
                              details: specialization,
                              penjelasan: deskripsi,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Book',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
