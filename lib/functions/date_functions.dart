import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(String pattern, DateTime date) {
  return DateFormat(pattern).format(date);
}

List<Map<dynamic, dynamic>> extractDateRange(DateTime start, DateTime end) {
  DateTime startDate = start;
  DateTime endDate = end;

  List<Map<dynamic, dynamic>> result = [];

  var range = DateTimeRange(
    start: startDate,
    end: endDate,
  );

  for (int x = 0; x < range.duration.inDays; x++) {
    DateTime? targetDate = startDate.add(Duration(days: x));

    result.add({
      'dayWeek': formatDate('EEE', targetDate),
      'day': formatDate('d', targetDate),
      'month': formatDate('MMM', targetDate),
      'year': formatDate('y', targetDate)
    });
  }

  return result;
}
