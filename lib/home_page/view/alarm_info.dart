import 'package:flutter/material.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String description;
 // bool isActive;
  List<Color> gradientColors;

  AlarmInfo(
      this.alarmDateTime,
      //this.isActive,
      {required this.description, required this.gradientColors});
}
