import 'package:calendar_test/widgets/calendar_with_notes/calendar_with_notes.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: CalendarWithNotes(),
        ),
      ),
    );
  }
}
