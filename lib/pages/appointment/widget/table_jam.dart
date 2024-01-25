import 'package:flutter/material.dart';

class TableJam extends StatefulWidget {
  const TableJam({Key? key}) : super(key: key);

  @override
  State<TableJam> createState() => _TableJamState();
}

class _TableJamState extends State<TableJam> {
  int selectedValue = 0;

  @override
 Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: List.generate(13, (index) {
            // Generate waktu dari jam 7 sampai jam 19
            int jam = 7 + index;
            String waktu = '${jam.toString().padLeft(2, '0')}.00';
            return buildTimeContainer(jam, waktu);
          }),
        ),
      ),
    );
  }

  Widget buildTimeContainer(int value, String time) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedValue = value;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selectedValue == value ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: TableJam(),
    ),
  ));
}
