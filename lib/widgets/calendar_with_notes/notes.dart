import 'package:calendar_test/core/ui/app_colors.dart';
import 'package:calendar_test/domain/calendar/calendar_repository_impl.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  final DateTime choosenDate;
  final Function submitDate;
  final CalendarRepositoryImpl calendarRepositoryImpl;
  const Notes({
    Key? key,
    required this.choosenDate,
    required this.calendarRepositoryImpl,
    required this.submitDate,
  }) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  TextEditingController note = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.calendarRepositoryImpl.notedDates[widget.choosenDate] != null) {
      setState(() {
        note.text =
            widget.calendarRepositoryImpl.notedDates[widget.choosenDate]!;
      });
    } else {
      setState(() {
        note.text = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${widget.choosenDate.day}.${widget.choosenDate.month}.${widget.choosenDate.year}",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TextField(
            maxLines: 5,
            controller: note,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent))),
          ),
          RawMaterialButton(
            onPressed: () {
              widget.calendarRepositoryImpl
                  .setNote(widget.choosenDate, note.text);
              widget.submitDate(note.text);
            },
            fillColor: AppColors.greenColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Submit',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
