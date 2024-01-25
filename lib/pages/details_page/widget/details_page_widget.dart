import 'package:ahli_gigi/pages/appointment/appointment.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DetailsPageWidget extends StatelessWidget {
  final String imagePath;
  final String layanan;
  final String harga;
  final String penjelasan;

  const DetailsPageWidget({
    Key? key,
    required this.imagePath,
    required this.layanan,
    required this.harga,
    required this.penjelasan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 225,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 13.0, right: 13.0),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(7)),
                  child: Image.asset(imagePath),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          child: Text(
                            layanan,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            '${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(double.parse(harga))}',
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 10.0),
                      //   child: Row(
                      //     children: <Widget>[
                      //       IconButton(
                      //         icon: const Icon(Icons.phone),
                      //         tooltip: 'Call',
                      //         onPressed: () {
                      //           // Aksi ketika button diklik
                      //         },
                      //       ),
                      //       const SizedBox(height: 8.0),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       IconButton(
                      //         icon: const Icon(Icons.video_call),
                      //         tooltip: 'Video Call',
                      //         onPressed: () {
                      //           // Aksi ketika button diklik
                      //         },
                      //       ),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       IconButton(
                      //         icon: const Icon(Icons.mail),
                      //         tooltip: 'Message',
                      //         onPressed: () {
                      //           // Aksi ketika button diklik
                      //         },
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          indent: 13,
          endIndent: 13,
          color: Colors.black,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                // height: 435,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 13, top: 10),
                      child: Row(
                        children: [
                          Text(
                            'Details',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Text(
                        penjelasan,
                        style: const TextStyle(fontSize: 13.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Container(
                      width: 400,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(111, 130, 130, 130),
                          // border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 1),
                            child: IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                              ),
                              iconSize: 35.0,
                              tooltip: 'Add to Bookmark',
                              onPressed: () {
                                // Aksi ketika button diklik
                              },
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 142, 142, 142))),
                          ),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, right: 13.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // Atur ukuran ElevatedButton di sini
                                fixedSize: const Size(
                                    0, 40), // Sesuaikan ukuran sesuai kebutuhan
                                // atau
                                // minimumSize: Size(120, 40),
                              ),
                              child: const Text(
                                "Book an Appointment",
                                style: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                // Aksi ketika button diklik
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => appointmentPage()),
                                );
                              },
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
