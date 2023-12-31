import 'package:ahli_gigi/pages/DetailsPage/DetailsPage.dart';
import 'package:flutter/material.dart';

class DaftarLayananCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String biography;
  final bool isAvailable;

  DaftarLayananCard({
    required this.doctorName,
    required this.specialization,
    required this.biography,
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
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(7)),
            child: Image.asset('assets/img/profile_picture.jpg',
                width: 110, height: 160),
          ),
          SizedBox(width: 16),
          // Informasi dokter
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
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
                  biography,
                  style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                SizedBox(height: 20),
                // Tombol status "Available" dan "Book"
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk mengubah status "Available"
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isAvailable ? Colors.green : Colors.red,
                      ),
                      child: Text(
                        isAvailable ? 'Available' : 'Booked',
                        style: TextStyle(
                            color:
                                Colors.white), // Ubah warna teks menjadi putih
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            Colors.white, // Ubah warna tombol menjadi putih
                      ),
                      child: Text(
                        'Book',
                        style: TextStyle(
                            color:
                                Colors.black), // Ubah warna teks menjadi hitam
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
