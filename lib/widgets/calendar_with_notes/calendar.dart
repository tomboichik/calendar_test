import 'package:calendar_test/core/constants/date_constants.dart';
import 'package:calendar_test/domain/calendar/calendar_repository_impl.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  final DateTime dateTime;

  final CalendarRepositoryImpl calendarRepositoryImpl;

  const Calendar({
    Key? key,
    required this.dateTime,
    required this.calendarRepositoryImpl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              '${months[dateTime.month]} ${dateTime.year}',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: weekDays
                  .map((e) => Center(
                        child: Text(e),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: Center(
              child: Wrap(
                children: calendarRepositoryImpl
                    .getListOfDays(dateTime)
                    .map((
                      e,
                    ) =>
                        Padding(
                          padding: EdgeInsets.only(
                              left: e.day == 1 ? e.weekday * 25.0 : 0.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: 50,
                            child: Center(
                              child: Text(e.day.toString()),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
