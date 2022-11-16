import 'package:calendar_test/core/constants/date_constants.dart';
import 'package:calendar_test/core/ui/app_colors.dart';
import 'package:calendar_test/domain/calendar/calendar_repository_impl.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  final DateTime dateTime;
  final Function chooseDate;
  final DateTime? choosenDate;

  final CalendarRepositoryImpl calendarRepositoryImpl;

  const Calendar({
    Key? key,
    required this.dateTime,
    required this.calendarRepositoryImpl,
    required this.chooseDate,
    required this.choosenDate,
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
                        InkWell(
                          onTap: () {
                            chooseDate(e);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: e.day == 1 ? e.weekday * 25.0 : 0.0),
                            child: Container(
                              decoration: choosenDate == e
                                  ? BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(15),
                                    )
                                  : calendarRepositoryImpl.notedDates[e] != null
                                      ? BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )
                                      : null,
                              padding: const EdgeInsets.all(8),
                              width: 50,
                              child: Center(
                                child: Text(
                                  e.day.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          color: choosenDate != e
                                              ? Colors.black
                                              : Colors.white),
                                ),
                              ),
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
