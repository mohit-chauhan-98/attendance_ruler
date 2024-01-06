import 'package:attendance_ruler/attendance_ruler.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Data Model
final List<AttendanceDataModel> attendanceDataModel = [
  AttendanceDataModel(
    attendanceDate: DateTime(2024, 01, 05),
    attendanceInOutTimes: [
      InOutTime(
        inTime: const TimeOfDay(hour: 10, minute: 00),
        outTime: const TimeOfDay(hour: 10, minute: 15),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 10, minute: 30),
        outTime: const TimeOfDay(hour: 13, minute: 00),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 13, minute: 30),
        outTime: const TimeOfDay(hour: 16, minute: 15),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 16, minute: 30),
        outTime: const TimeOfDay(hour: 19, minute: 00),
      ),
    ],
  ),
  AttendanceDataModel(
    attendanceDate: DateTime(2024, 01, 04),
    attendanceInOutTimes: [
      InOutTime(
        inTime: const TimeOfDay(hour: 10, minute: 30),
        outTime: const TimeOfDay(hour: 13, minute: 15),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 14, minute: 05),
        outTime: const TimeOfDay(hour: 14, minute: 15),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 14, minute: 30),
        outTime: const TimeOfDay(hour: 15, minute: 20),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 15, minute: 30),
        outTime: const TimeOfDay(hour: 16, minute: 25),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 17, minute: 10),
        outTime: const TimeOfDay(hour: 17, minute: 50),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 18, minute: 00),
        outTime: const TimeOfDay(hour: 19, minute: 25),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 19, minute: 30),
        outTime: const TimeOfDay(hour: 20, minute: 50),
      ),
    ],
  ),
  AttendanceDataModel(
    attendanceDate: DateTime(2024, 01, 03),
    attendanceInOutTimes: [
      InOutTime(
        inTime: const TimeOfDay(hour: 09, minute: 35),
        outTime: const TimeOfDay(hour: 10, minute: 00),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 10, minute: 03),
        outTime: const TimeOfDay(hour: 13, minute: 15),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 13, minute: 58),
        outTime: const TimeOfDay(hour: 16, minute: 20),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 16, minute: 30),
        outTime: const TimeOfDay(hour: 19, minute: 30),
      ),
    ],
  ),
  AttendanceDataModel(
    attendanceDate: DateTime(2024, 01, 02),
    attendanceInOutTimes: [
      InOutTime(
        inTime: const TimeOfDay(hour: 10, minute: 00),
        outTime: const TimeOfDay(hour: 10, minute: 16),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 10, minute: 25),
        outTime: const TimeOfDay(hour: 12, minute: 17),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 12, minute: 21),
        outTime: const TimeOfDay(hour: 13, minute: 50),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 14, minute: 30),
        outTime: const TimeOfDay(hour: 16, minute: 35),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 16, minute: 52),
        outTime: const TimeOfDay(hour: 17, minute: 05),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 17, minute: 07),
        outTime: const TimeOfDay(hour: 19, minute: 18),
      ),
    ],
  ),
  AttendanceDataModel(
    attendanceDate: DateTime(2024, 01, 01),
    attendanceInOutTimes: [
      InOutTime(
        inTime: const TimeOfDay(hour: 09, minute: 59),
        outTime: const TimeOfDay(hour: 10, minute: 06),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 10, minute: 12),
        outTime: const TimeOfDay(hour: 13, minute: 23),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 14, minute: 00),
        outTime: const TimeOfDay(hour: 16, minute: 25),
      ),
      InOutTime(
        inTime: const TimeOfDay(hour: 16, minute: 47),
        outTime: const TimeOfDay(hour: 19, minute: 05),
      ),
    ],
  ),
];

/// Used to show the stats of the Attendance
class AttendanceStats extends StatelessWidget {
  const AttendanceStats({
    super.key,
    required this.hoursOfAttendance,
  });

  final HoursOfAttendance hoursOfAttendance;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AttendanceStatsRow(
          firstText: 'Effective Hours',
          secondText:
              '${hoursOfAttendance.effectiveHours.hour.formattedNumber}h ${hoursOfAttendance.effectiveHours.minute.formattedNumber}m',
        ),
        AttendanceStatsRow(
          firstText: 'Break Hours',
          secondText:
              '${hoursOfAttendance.breakHours.hour.formattedNumber}h ${hoursOfAttendance.breakHours.minute.formattedNumber}m',
        ),
        AttendanceStatsRow(
          firstText: 'Gross Hours',
          secondText:
              '${hoursOfAttendance.grossHours.hour.formattedNumber}h ${hoursOfAttendance.grossHours.minute.formattedNumber}m',
        ),
      ],
    );
  }
}

/// Used to show the stats of the Attendance
class AttendanceStatsRow extends StatelessWidget {
  const AttendanceStatsRow({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              firstText,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              secondText,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

/// extension on Int
extension IntExtension on int {
  String get formattedNumber => NumberFormat("00").format(this);
}
