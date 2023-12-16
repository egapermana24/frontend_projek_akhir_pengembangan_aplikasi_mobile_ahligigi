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
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/doctor_photo.jpg'),
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
                        // Tambahkan logika untuk tombol "Book"
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
