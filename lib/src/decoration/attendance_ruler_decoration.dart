import 'package:flutter/material.dart';

import '../utils.dart';

/// Used to decorate the AttendanceRuler Widget
class AttendanceRulerDecoration {
  /// Defines the backgroundColor of the Attendance Ruler
  /// Default Value: [Color(0xFFd9f8ff)]
  final Color backgroundColor;

  /// Defines the borderRadius of the ruler background
  /// Corners of the ruler background box are rounded by this borderRadius
  /// If null then this will be used [BorderRadius.circular(20.0)]
  final BorderRadiusGeometry? borderRadius;

  /// Defines the verticalPadding of the ruler background box
  /// Default Value: 4.0
  final double verticalPadding;

  /// Defines the horizontalPadding of the ruler background box
  /// Default Value: 10.0
  final double horizontalPadding;

  /// Defines the rulerLineColor of the Attendance Ruler
  /// Ruler line indicates the hours of the day on Ruler
  /// Default Value: [Color(0xFF24d8ff)]
  final Color rulerLineColor;

  /// Defines the rulerLineWidth of the Attendance Ruler
  /// Default Value: 1.0
  final double rulerLineWidth;

  /// Defines the rulerTimeColor of the Attendance Ruler
  /// Used to paint the in and out time on the Ruler
  /// Default Value: [Color(0xFF64c3d1)]
  final Color rulerTimeColor;

  /// The axis along which the Attendance Ruler layout.
  /// Default Value: [Axis.horizontal].
  final Axis layoutDirection;

  /// Defines the Radius for the time on the ruler
  /// If null then this will be used (rulerHeight / 2)
  final Radius? rulerTimeCircularRadius;

  /// Defines the RoundedCornerStyle for the time on the rules
  /// Default Value: [RulerTimeRoundedCornerStyle.firstAndLastRounded]
  final RulerTimeRoundedCornerStyle rulerTimeRoundedCornerStyle;

  /// Defines the HoursFormat 24 or 12 for the Ruler Time
  /// Default Value: [RulerTimeFormat.twentyFourHours]
  final RulerTimeFormat rulerTimeFormat;

  /// Defines the attendance dayStartHour time
  /// Default Value: 0 (which means attendance day time)
  /// Example: if day time is 6 hrs to (12 or 24 hours of the day + 6) hrs
  /// then pass 6 in dayStartHour
  final int dayStartHour;

  const AttendanceRulerDecoration({
    this.backgroundColor = const Color(0xFFd9f8ff),
    this.borderRadius,
    this.verticalPadding = 4.0,
    this.horizontalPadding = 10.0,
    this.rulerLineColor = const Color(0xFF24d8ff),
    this.rulerLineWidth = 1.0,
    this.rulerTimeColor = const Color(0xFF64c3d1),
    this.layoutDirection = Axis.horizontal,
    this.rulerTimeCircularRadius,
    this.rulerTimeRoundedCornerStyle =
        RulerTimeRoundedCornerStyle.firstAndLastRounded,
    this.rulerTimeFormat = RulerTimeFormat.twentyFourHours,
    this.dayStartHour = 0,
  });

  /// Used to crete copy of the AttendanceRulerDecoration
  AttendanceRulerDecoration copyWith({
    Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
    double? verticalPadding,
    double? horizontalPadding,
    Color? rulerLineColor,
    double? rulerLineWidth,
    Color? rulerTimeColor,
    Axis? layoutDirection,
    Radius? rulerTimeCircularRadius,
    RulerTimeRoundedCornerStyle? rulerTimeRoundedCornerStyle,
    RulerTimeFormat? rulerTimeFormat,
    int? dayStartHour,
  }) {
    return AttendanceRulerDecoration(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      verticalPadding: verticalPadding ?? this.verticalPadding,
      horizontalPadding: horizontalPadding ?? this.horizontalPadding,
      rulerLineColor: rulerLineColor ?? this.rulerLineColor,
      rulerLineWidth: rulerLineWidth ?? this.rulerLineWidth,
      rulerTimeColor: rulerTimeColor ?? this.rulerTimeColor,
      layoutDirection: layoutDirection ?? this.layoutDirection,
      rulerTimeCircularRadius:
          rulerTimeCircularRadius ?? this.rulerTimeCircularRadius,
      rulerTimeRoundedCornerStyle:
          rulerTimeRoundedCornerStyle ?? this.rulerTimeRoundedCornerStyle,
      rulerTimeFormat: rulerTimeFormat ?? this.rulerTimeFormat,
      dayStartHour: dayStartHour ?? this.dayStartHour,
    );
  }
}
