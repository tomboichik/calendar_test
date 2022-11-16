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

  DateTime? choosenDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (choosenDate != null)
          Notes(
            choosenDate: choosenDate!,
            calendarRepositoryImpl: calendarRepositoryImpl,
            submitDate: (value) {
              setState(() {
                choosenDate = null;
              });
            },
          ),
        Calendar(
          choosenDate: choosenDate,
          dateTime: currentDate,
          calendarRepositoryImpl: calendarRepositoryImpl,
          chooseDate: (e) {
            setState(() {
              choosenDate = null;
            });

            Future.delayed(Duration(milliseconds: 500), () {
              setState(() {
                choosenDate = e;
              });
            });
          },
        ),
      ],
    );
  }
}
