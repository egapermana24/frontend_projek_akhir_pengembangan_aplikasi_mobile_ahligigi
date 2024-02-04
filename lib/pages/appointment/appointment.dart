import 'package:flutter/material.dart';
import 'package:ahli_gigi/pages/appointment/widget/table_calendar.dart';
import 'package:ahli_gigi/pages/pembayaran/pembayaranPage.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';

class AppointmentPage extends StatefulWidget {
  final int idLayanan;
  final String layanan;
  final String harga;

  const AppointmentPage({
    Key? key,
    required this.idLayanan,
    required this.layanan,
    required this.harga,
  }) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  int selectedValue = 0;
  String jam = '';

  void onJamSelected(String selectedJam) {
    setState(() {
      jam = selectedJam;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Janji Temu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            tableCalendar(),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, top: 10),
                  child: const Text(
                    'Waktu yang Tersedia :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: List.generate(9, (index) {
                    int jam = 9 + index;
                    String waktu = '${jam.toString().padLeft(2, '0')}:00:00';
                    return buildTimeContainer(jam, waktu);
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          if (jam.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PembayaranPage(
                                  idLayanan: widget.idLayanan,
                                  layanan: widget.layanan,
                                  harga: widget.harga,
                                  jam: jam,
                                ),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Peringatan!"),
                                  content: Text(
                                      "Silakan pilih waktu yang tersedia."),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text(
                          'Pilih Pembayaran',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget buildTimeContainer(int value, String jam) {
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         selectedValue = value;
  //         onJamSelected(jam);
  //       });
  //     },
  //     child: Container(
  //       padding: EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         color: selectedValue == value ? AppColors.primaryColor : Colors.grey,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Text(
  //         jam.substring(0, 5),
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // WIDGET DENGAN KONDISI APABILA WAKTU YANG SUDAH LEWAT MAKA TIDAK DAPAT DIPILIH
  Widget buildTimeContainer(int value, String jam) {
    // Mendapatkan waktu saat ini
    DateTime now = DateTime.now();
    // Mendapatkan jam yang dipilih dari string
    int selectedHour = int.parse(jam.substring(0, 2));

    // Memeriksa apakah jam yang dipilih sudah lewat atau belum
    bool isPastTime = now.hour > selectedHour ||
        (now.hour == selectedHour && now.minute >= 0);

    return InkWell(
      onTap: () {
        // Jika waktu yang dipilih belum lewat, update state
        if (!isPastTime) {
          setState(() {
            selectedValue = value;
            onJamSelected(jam);
          });
        } else {
          // Jika waktu yang dipilih sudah lewat, tampilkan pesan peringatan
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Peringatan!"),
                content: Text("Waktu sudah lewat."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selectedValue == value
              ? AppColors.primaryColor
              : (isPastTime ? Colors.red : Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          jam.substring(0, 5),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
