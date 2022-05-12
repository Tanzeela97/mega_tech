import 'package:flutter/material.dart';

class AppUtility {
  static String? dateFormat(DateTime? dateTime) => dateTime == null
      ? null
      : '${dateTime.year}-${dateTime.month.prefixWith()}-${dateTime.day.prefixWith()}';

  static String? timeFormat(TimeOfDay? timeOfDay) => timeOfDay == null
      ? null
      : '${timeOfDay.hour.prefixWith()}:${timeOfDay.minute.prefixWith()}:${timeOfDay.period.name}';
}

extension ExtendedString on int {
  String prefixWith() {
    return this.toString().padLeft(2,'0');
  }

}