extension DateTimeExtensions on DateTime {
  int daysUntil(DateTime dateTo) => difference(dateTo).inDays;
}
