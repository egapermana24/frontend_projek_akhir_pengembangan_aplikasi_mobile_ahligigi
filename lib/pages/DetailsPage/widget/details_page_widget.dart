import 'package:flutter/material.dart';

class DetailsPageWidget extends StatelessWidget {
  final String imagePath;
  final String layanan;
  final String details;
  final String penjelasan;

  DetailsPageWidget(
    this.imagePath,
    this.layanan,
    this.details,
    this.penjelasan,
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Container(
          height: 220,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(7)),
                  child: Image.asset(imagePath),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          layanan,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Text(
                          details,
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(Icons.phone),
                                SizedBox(height: 8.0),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.video_call),
                                SizedBox(height: 8.0),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.mail),
                                SizedBox(height: 8.0),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            Container(
              height: 537,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      penjelasan,
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: screenWidth,
                  height: 80,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.bookmark),
                        tooltip: 'Add to Bookmark',
                        onPressed: () {
                          // Aksi ketika button diklik
                        },
                      ),
                      ElevatedButton(
                        child: const Text("Book Now!"),
                        onPressed: () {
                          // Aksi ketika button diklik
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ],
    ));
  }
}
