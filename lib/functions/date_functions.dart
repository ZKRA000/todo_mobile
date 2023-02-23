import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//models
import '../models/easy_date.dart';

String formatDate(String pattern, DateTime date) {
  return DateFormat(pattern).format(date);
}

List<EasyDate> extractDateRange(DateTime start, DateTime end) {
  DateTime startDate = start;
  DateTime endDate = end;

  List<EasyDate> result = [];

  var range = DateTimeRange(
    start: startDate,
    end: endDate,
  );

  for (int x = 0; x < range.duration.inDays; x++) {
    DateTime? targetDate = startDate.add(Duration(days: x));

    result.add(EasyDate(
      formatDate('EEE', targetDate),
      formatDate('d', targetDate),
      formatDate('MMM', targetDate),
      formatDate('Y', targetDate),
    ));
  }

  return result;
}
