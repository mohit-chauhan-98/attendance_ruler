import 'package:flutter/material.dart';

/// Used to define the data model for the AttendanceRuler
class AttendanceDataModel {
  /// Date of the attendance
  final DateTime attendanceDate;

  /// Defines the in and out time for the date
  final List<InOutTime> attendanceInOutTimes;

  AttendanceDataModel({
    required this.attendanceDate,
    required this.attendanceInOutTimes,
  });
}

/// Used to define In and Out Time in the Day
class InOutTime {
  /// In times for the day
  TimeOfDay? inTime;

  /// Out times for the day
  TimeOfDay? outTime;

  InOutTime({
    this.inTime,
    this.outTime,
  });
}

/// Used to define the calculated hours from the AttendanceData
class HoursOfAttendance {
  /// Date of the attendance
  final DateTime attendanceDate;

  /// Effective Hours for the day
  final TimeOfDay effectiveHours;

  /// Break Hours for the day
  final TimeOfDay breakHours;

  /// Gross Hours for the day
  final TimeOfDay grossHours;

  HoursOfAttendance({
    required this.attendanceDate,
    required this.effectiveHours,
    required this.breakHours,
    required this.grossHours,
  });
}
