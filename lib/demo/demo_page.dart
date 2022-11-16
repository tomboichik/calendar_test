import 'package:calendar_test/widgets/calendar_with_notes/calendar_with_notes.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: CalendarWithNotes(),
        ),
      ),
    );
  }
}
