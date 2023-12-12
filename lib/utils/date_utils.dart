extension DateUtils on DateTime {
  String dateTimeToString(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}';
  }
}
