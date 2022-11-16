import 'package:calendar_test/domain/calendar/calendar_repository_impl.dart';
import 'package:calendar_test/widgets/calendar_with_notes/calendar.dart';
import 'package:calendar_test/widgets/calendar_with_notes/notes.dart';
import 'package:flutter/material.dart';

class CalendarWithNotes extends StatefulWidget {
  const CalendarWithNotes({Key? key}) : super(key: key);

  @override
  State<CalendarWithNotes> createState() => _CalendarWithNotesState();
}

class _CalendarWithNotesState extends State<CalendarWithNotes> {
  DateTime currentDate = DateTime.now();

  CalendarRepositoryImpl calendarRepositoryImpl = CalendarRepositoryImpl();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Notes(),
        Calendar(
          dateTime: currentDate,
          calendarRepositoryImpl: calendarRepositoryImpl,
        ),
      ],
    );
  }
}
