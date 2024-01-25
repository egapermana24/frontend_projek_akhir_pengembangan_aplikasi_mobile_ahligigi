import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class tableCalendar extends StatefulWidget {
  const tableCalendar({super.key});

  @override
  State<tableCalendar> createState() => _tableCalendarState();
}

class _tableCalendarState extends State<tableCalendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(today.toString().split(" ")[0]),
        Container(
          child: TableCalendar(
            rowHeight: 43,
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: today, // Mengatur firstDay dan lastDay agar hanya mencakup hari ini
            lastDay: today,
            onDaySelected: _onDaySelected,
          ),
        ),
      ],
    );
  }
}

