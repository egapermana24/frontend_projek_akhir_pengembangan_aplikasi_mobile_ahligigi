import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String imagePath;
  final String review;
  final int rating;

  PopularCard(
    this.doctorName,
    this.specialization,
    this.imagePath,
    this.review,
    this.rating,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        width: 280,
        child: Card(
          elevation: 4,
          color: Colors.grey,
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
                      backgroundImage: AssetImage('assets/img/'),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          specialization,
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 255, 255, 255)),
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
                          color: Color.fromARGB(146, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(5),
                      height:
                          65, // Sesuaikan tinggi container dengan kebutuhan Anda
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
                  height: 5,
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        rating,
                        (index) => Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk tombol "Book" di sini
                      },
                      child: Text(
                        'Book',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
