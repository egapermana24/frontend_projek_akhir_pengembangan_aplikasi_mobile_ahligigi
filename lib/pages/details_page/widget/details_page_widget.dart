import 'package:ahli_gigi/pages/appointment/appointment.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DetailsPageWidget extends StatelessWidget {
  final String imagePath;
  final int idLayanan;
  final String layanan;
  final String harga;
  final String penjelasan;

  const DetailsPageWidget({
    Key? key,
    required this.imagePath,
    required this.idLayanan,
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
                      border:
                          Border.all(color: AppColors.primaryColor, width: 5),
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                height: 150,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 13, top: 10),
                        child: Row(
                          children: [
                            Text(
                              'Penjelasan',
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Container(
                      width: 400,
                      height: 60,
                      // decoration: BoxDecoration(
                      //     color: const Color.fromARGB(111, 130, 130, 130),
                      //     // border: Border.all(color: Colors.black),
                      //     borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Aksi ketika button diklik
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AppointmentPage(
                                              idLayanan: idLayanan,
                                              layanan: layanan,
                                              harga: harga,
                                            )),
                                  );
                                },
                                child: Text(
                                  'Buat Janji Temu',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
