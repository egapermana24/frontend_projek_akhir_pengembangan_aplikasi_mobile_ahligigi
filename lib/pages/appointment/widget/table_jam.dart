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
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 79, 79, 79),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTimeContainer(1, '09.00'),
              buildTimeContainer(2, '11.00'),
              buildTimeContainer(3, '13.00'),
              buildTimeContainer(4, '15.00'),
              buildTimeContainer(5, '17.00'),
              buildTimeContainer(6, '19.00'),
            ],
          ),
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
