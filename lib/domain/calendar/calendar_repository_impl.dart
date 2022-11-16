class CalendarRepositoryImpl {
  static int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  List<DateTime> dayMonthes = [];

  List<DateTime> getListOfDays(DateTime currentDate) {
    dayMonthes = List<int>.generate(daysInMonth(currentDate), (i) => i + 1)
        .map((e) => DateTime(currentDate.year, currentDate.month, e))
        .toList();

    return dayMonthes;
  }

  Map<DateTime, String> notedDates = {};

  setNote(DateTime choosenDate, String text) {
    notedDates[choosenDate] = text;
  }
}
