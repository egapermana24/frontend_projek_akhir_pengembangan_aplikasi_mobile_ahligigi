import 'package:flutter/material.dart';

class DoctorListCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String biography;
  final bool isAvailable;

  DoctorListCard({
    required this.doctorName,
    required this.specialization,
    required this.biography,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Mengubah alignment agar tombol berada di atas
        children: [
          // Foto dokter
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
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  biography,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          // Tombol status "Available" dan "Book"
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk mengubah status "Available"
                },
                style: ElevatedButton.styleFrom(
                  primary: isAvailable ? Colors.green : Colors.red,
                ),
                child: Text(isAvailable ? 'Available' : 'Booked'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk tombol "Book"
                },
                child: Text('Book'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
