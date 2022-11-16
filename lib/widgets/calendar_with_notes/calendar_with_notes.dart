import 'package:calendar_test/widgets/calendar_with_notes/calendar.dart';
import 'package:flutter/material.dart';

class CalendarWithNotes extends StatefulWidget {
  const CalendarWithNotes({Key? key}) : super(key: key);

  @override
  State<CalendarWithNotes> createState() => _CalendarWithNotesState();
}

class _CalendarWithNotesState extends State<CalendarWithNotes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Calendar(),
      ],
    );
  }
}
