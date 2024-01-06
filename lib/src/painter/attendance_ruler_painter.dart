import 'package:flutter/material.dart';

import '../decoration/attendance_ruler_decoration.dart';
import '../model/attendance_data_model.dart';
import '../utils.dart';

/// Used to paint the actual attendance ruler on the canvas
class AttendanceRulerPainter extends CustomPainter {
  /// Data model for the attendance
  final AttendanceDataModel attendanceDataModel;

  /// Decorate the AttendanceRuler Widget
  final AttendanceRulerDecoration attendanceRulerDecoration;

  const AttendanceRulerPainter({
    required this.attendanceDataModel,
    required this.attendanceRulerDecoration,
  });

  /// Painting the AttendanceRuler widget
  @override
  void paint(Canvas canvas, Size size) {
    /// Setting the layout of the AttendanceRuler
    final double rulerHeight = size.height;
    final double widthPerHour =
        ((size.width + attendanceRulerDecoration.horizontalPadding) /
            attendanceRulerDecoration.rulerTimeFormat.value);

    /// Line painter to paint the lines on ruler
    final linePaint = Paint()
      ..color = attendanceRulerDecoration.rulerLineColor
      ..strokeWidth = attendanceRulerDecoration.rulerLineWidth;

    /// Draw the ruler lines that indicates the hours of the day on Ruler
    for (int hour = 0;
        hour < attendanceRulerDecoration.rulerTimeFormat.value;
        hour++) {
      final x = hour * widthPerHour;
      canvas.drawLine(Offset(x, 0), Offset(x, rulerHeight), linePaint);
    }

    /// InOutTime painter to paint the times rect on the ruler
    final inOutTimePaint = Paint()
      ..color = attendanceRulerDecoration.rulerTimeColor;

    /// Draw in and out times for the day on the Ruler
    for (int time = 0;
        time < attendanceDataModel.attendanceInOutTimes.length;
        time++) {
      final inTime = attendanceDataModel.attendanceInOutTimes[time].inTime;
      final outTime = attendanceDataModel.attendanceInOutTimes[time].outTime;

      /// Assertions on in and out time
      assert(
        (inTime != null) && (outTime != null),
        'inTime and outTime can\'t be null or empty',
      );

      if (inTime != null && outTime != null) {
        /// Assertions on hours and minutes
        assert(
          (inTime.hour >= 0 &&
                  inTime.hour <=
                      attendanceRulerDecoration.rulerTimeFormat.value) &&
              (outTime.hour >= 0 &&
                  outTime.hour <=
                      attendanceRulerDecoration.rulerTimeFormat.value),
          'Hours should be in between (0) and (${attendanceRulerDecoration.rulerTimeFormat.value})',
        );
        assert(
          (inTime.minute >= 0 && inTime.minute <= 60) &&
              (outTime.minute >= 0 && outTime.minute <= 60),
          'Minutes should be in between (0) and (60)',
        );
        assert(attendanceRulerDecoration.dayStartHour <= inTime.hour,
            'The day start hour (${attendanceRulerDecoration.dayStartHour}) must be less than or equal to the inTime hour (${inTime.hour})');

        final inX = (inTime.hour +
                (inTime.minute / 60.0) -
                attendanceRulerDecoration.dayStartHour) *
            widthPerHour;
        final outX = (outTime.hour +
                (outTime.minute / 60.0) -
                attendanceRulerDecoration.dayStartHour) *
            widthPerHour;

        /// Used to draw the rounded rect for the in out time
        final bool isFirstTime = (time == 0);
        final bool isLastTime =
            (time == (attendanceDataModel.attendanceInOutTimes.length - 1));

        /// Setting up the radius for the rounded corner of the rect
        final Radius circularRadius =
            attendanceRulerDecoration.rulerTimeCircularRadius ??
                Radius.circular(rulerHeight / 2);
        BorderRadius? borderRadius;

        switch (attendanceRulerDecoration.rulerTimeRoundedCornerStyle) {
          case RulerTimeRoundedCornerStyle.allRounded:
            borderRadius = BorderRadius.only(
              topLeft: circularRadius,
              bottomLeft: circularRadius,
              topRight: circularRadius,
              bottomRight: circularRadius,
            );
            break;
          case RulerTimeRoundedCornerStyle.firstAndLastRounded:
            borderRadius = BorderRadius.only(
              topLeft: isFirstTime ? circularRadius : Radius.zero,
              bottomLeft: isFirstTime ? circularRadius : Radius.zero,
              topRight: isLastTime ? circularRadius : Radius.zero,
              bottomRight: isLastTime ? circularRadius : Radius.zero,
            );
            break;
          case RulerTimeRoundedCornerStyle.none:
            borderRadius = null;
            break;
        }

        /// Setting up the Rect and RRect
        final Rect rect =
            Rect.fromPoints(Offset(inX, 0), Offset(outX, rulerHeight));

        /// drawing the Rect or RRect
        if (attendanceRulerDecoration.rulerTimeRoundedCornerStyle !=
                RulerTimeRoundedCornerStyle.none &&
            borderRadius != null) {
          final RRect roundedRect = borderRadius.toRRect(rect);
          canvas.drawRRect(roundedRect, inOutTimePaint);
        } else {
          canvas.drawRect(rect, inOutTimePaint);
        }
      }
    }
  }

  /// Used to repaint the widget
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
