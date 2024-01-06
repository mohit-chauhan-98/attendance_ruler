import 'package:flutter/material.dart';

import 'decoration/attendance_ruler_decoration.dart';
import 'model/attendance_data_model.dart';
import 'painter/attendance_ruler_painter.dart';

/// Root widget to paint the actual attendance ruler on the canvas
class AttendanceRuler extends StatelessWidget {
  /// Data model for the attendance
  final AttendanceDataModel attendanceDataModel;

  /// Decorate the AttendanceRuler Widget
  final AttendanceRulerDecoration attendanceRulerDecoration;

  /// The size that this [AttendanceRuler] should aim for, given the layout
  /// If null then this will be used [Size(MediaQuery.of(context).size.width, 10.0)]
  final Size? size;

  const AttendanceRuler({
    Key? key,
    required this.attendanceDataModel,
    required this.attendanceRulerDecoration,
    this.size,
  }) : super(key: key);

  /// Painting the AttendanceRuler widget and its outer layer
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns:
          attendanceRulerDecoration.layoutDirection == Axis.vertical ? 1 : 0,
      child: Container(
        decoration: BoxDecoration(
          color: attendanceRulerDecoration.backgroundColor,
          borderRadius: attendanceRulerDecoration.borderRadius ??
              BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: attendanceRulerDecoration.verticalPadding,
          horizontal: attendanceRulerDecoration.horizontalPadding,
        ),
        child: CustomPaint(
          size: size ?? Size(MediaQuery.of(context).size.width, 10.0),
          painter: AttendanceRulerPainter(
            attendanceDataModel: attendanceDataModel,
            attendanceRulerDecoration: attendanceRulerDecoration,
          ),
        ),
      ),
    );
  }
}
