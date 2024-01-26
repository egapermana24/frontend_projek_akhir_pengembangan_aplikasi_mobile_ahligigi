import 'package:ahli_gigi/pages/appointment/widget/table_calendar.dart';
import 'package:ahli_gigi/pages/pembayaran/pembayaranPage.dart';
import 'package:ahli_gigi/settings/constants/warna_apps.dart';
import 'package:flutter/material.dart';
import 'package:ahli_gigi/pages/appointment/widget/table_jam.dart';

class appointmentPage extends StatefulWidget {
  const appointmentPage({super.key});

  @override
  State<appointmentPage> createState() => _appointmentPageState();
}

class _appointmentPageState extends State<appointmentPage> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Janji Temu',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryText)),
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
                  child: const Text('Waktu yang Tersedia :',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryText)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TableJam(),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                // atau Column tergantung tata letak yang Anda butuhkan
                children: [
                  Expanded(
                    child: Container(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          // Aksi ketika button diklik
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PembayaranPage()),
                          );
                        },
                        child: Text(
                          'Pilih Pembayaran',
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
            )
          ],
        ),
      ),
    );
  }
}
