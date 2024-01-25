import 'package:flutter/material.dart';

// buatkan halaman History
class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  // buatkan list data history
  List<Map<String, dynamic>> dataHistory = [
    {
      'nama': 'Dr. Andi',
      'tanggal': '12/12/2021',
      'jam': '09.00',
      'layanan': 'Pencabutan Gigi',
      'status': 'Selesai',
    },
    {
      'nama': 'Dr. Andi',
      'tanggal': '12/12/2021',
      'jam': '09.00',
      'layanan': 'Pencabutan Gigi',
      'status': 'Selesai',
    },
    {
      'nama': 'Dr. Andi',
      'tanggal': '12/12/2021',
      'jam': '09.00',
      'layanan': 'Pencabutan Gigi',
      'status': 'Selesai',
    },
    {
      'nama': 'Dr. Andi',
      'tanggal': '12/12/2021',
      'jam': '09.00',
      'layanan': 'Pencabutan Gigi',
      'status': 'Selesai',
    },
    {
      'nama': 'Dr. Andi',
      'tanggal': '12/12/2021',
      'jam': '09.00',
      'layanan': 'Pencabutan Gigi',
      'status': 'Selesai',
    },
    {
      'nama': 'Dr. Andi',
      'tanggal': '12/12/2021',
      'jam': '09.00',
      'layanan': 'Pencabutan Gigi',
      'status': 'Selesai',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Janji Temu',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dataHistory.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person),
              ),
              title: Text(dataHistory[index]['nama']),
              subtitle: Text(
                  '${dataHistory[index]['tanggal']} - ${dataHistory[index]['jam']}'),
              trailing: Text(dataHistory[index]['status']),
            ),
          );
        },
      ),
    );
  }
}
