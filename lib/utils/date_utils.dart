import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  String dateTimeToString(DateTime dateTime) {
    // return '${dateTime.hour}:${dateTime.minute}';
    return DateFormat('kk:mm').format(dateTime);
  }

  String checkDateToShowOnChat(DateTime dateTime) {
    if (calculateDifference(dateTime) == 0) {
      return dateTimeToString(dateTime);
    }

    if (calculateDifference(dateTime) == -1) {
      return 'Ontem';
    }

    if (calculateDifference(dateTime) < -1) {
      return DateFormat('dd/MM').format(dateTime);
    }

    return '';
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }
}
