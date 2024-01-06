import 'package:flutter/material.dart';

import 'model/attendance_data_model.dart';

/// Used to get the TimeOfDay from the Duration
TimeOfDay durationToTimeOfDay(Duration duration) {
  final int hours = duration.inHours;
  final int minutes = (duration.inMinutes % 60).abs();
  return TimeOfDay(hour: hours, minute: minutes);
}

/// Used to get the calculated hours from the attendance
/// Returns HoursOfAttendance with effective, break and gross Hours
HoursOfAttendance getCalculatedHoursFromAttendance(
  AttendanceDataModel attendanceDataModel, {
  RulerTimeFormat rulerTimeFormat = RulerTimeFormat.twentyFourHours,
}) {
  DateTime inTime = attendanceDataModel.attendanceDate;
  DateTime outTime = attendanceDataModel.attendanceDate;
  List<Duration> breakTimes = [];

  for (int i = 0; i < attendanceDataModel.attendanceInOutTimes.length; i++) {
    var inTimeOfDay = attendanceDataModel.attendanceInOutTimes[i].inTime;
    var outTimeOfDay = attendanceDataModel.attendanceInOutTimes[i].outTime;

    /// Assertions on in and out time
    assert(
      (inTimeOfDay != null) && (outTimeOfDay != null),
      'inTime and outTime can\'t be null or empty',
    );

    /// Assertions on hours and minutes
    assert(
      (inTime.hour >= 0 && inTime.hour <= rulerTimeFormat.value) &&
          (outTime.hour >= 0 && outTime.hour <= rulerTimeFormat.value),
      'Hours should be in between (0) and (${rulerTimeFormat.value})',
    );
    assert(
      (inTime.minute >= 0 && inTime.minute <= 60) &&
          (outTime.minute >= 0 && outTime.minute <= 60),
      'Minutes should be in between (0) and (60)',
    );

    DateTime currentInTime = DateTime(
      attendanceDataModel.attendanceDate.year,
      attendanceDataModel.attendanceDate.month,
      attendanceDataModel.attendanceDate.day,
      inTimeOfDay?.hour ?? 0,
      inTimeOfDay?.minute ?? 0,
    );
    DateTime currentOutTime = DateTime(
      attendanceDataModel.attendanceDate.year,
      attendanceDataModel.attendanceDate.month,
      attendanceDataModel.attendanceDate.day,
      outTimeOfDay?.hour ?? 0,
      outTimeOfDay?.minute ?? 0,
    );

    if (i == 0) {
      inTime = currentInTime;
      outTime = currentOutTime;
    } else {
      if (outTime.isBefore(currentInTime)) {
        /// Break time
        breakTimes.add(currentInTime.difference(outTime));
      }
      outTime = currentOutTime;
    }
  }

  /// Calculate gross, break, and  effective hours
  Duration grossDuration = outTime.difference(inTime);
  Duration breakDuration =
      breakTimes.fold(Duration.zero, (prev, element) => prev + element);
  Duration effectiveDuration = grossDuration - breakDuration;

  return HoursOfAttendance(
    attendanceDate: attendanceDataModel.attendanceDate,
    effectiveHours: durationToTimeOfDay(effectiveDuration),
    breakHours: durationToTimeOfDay(breakDuration),
    grossHours: durationToTimeOfDay(grossDuration),
  );
}

/// Defines the rounded corner style for the Time
/// Such as all rounded, first and last only and nothing
enum RulerTimeRoundedCornerStyle {
  allRounded,
  firstAndLastRounded,
  none,
}

/// Defines the Hours format for the Ruler Time
/// Such as 24 hours or 12 hours
enum RulerTimeFormat {
  twelveHours(12),
  twentyFourHours(24);

  final int value;

  const RulerTimeFormat(this.value);
}
