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
    return Container(
      width: 280,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        color: Colors.grey,
        margin: EdgeInsets.only(left: 15),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(imagePath),
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
                            color: Color.fromARGB(255, 235, 235, 235)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Kontainer untuk teks "Review"
              Container(
                padding: EdgeInsets.all(8),
                height: 70,
                width: double.infinity,
                child: Text(
                  review,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
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
                    child: Text('Book'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
