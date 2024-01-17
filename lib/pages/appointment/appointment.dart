import 'package:ahli_gigi/pages/appointment/widget/table_calendar.dart';
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
        title: const Text('Appointment',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
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
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: const Text('Waktu yang Tersedia :',
                      style: TextStyle(fontSize: 20)))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          tableJam(),
        ],
      ),
    );
  }
}
