# attendance_ruler

<a href="https://flutter.dev/"><img src="https://img.shields.io/badge/flutter-website-deepskyblue.svg" alt="Flutter Website"></a>
<a href="https://dart.dev"><img src="https://img.shields.io/badge/dart-website-deepskyblue.svg" alt="Dart Website"></a>
<a href="https://developer.android.com" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Android-deepskyblue">
</a>
<a href="https://developer.apple.com/ios/" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-iOS-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Web-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Mac-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Linux-deepskyblue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Windows-deepskyblue">
</a>
<a href=""><img src="https://app.codacy.com/project/badge/Grade/dc683c9cc61b499fa7cdbf54e4d9ff35"/></a>
<a href="https://github.com/mohit-chauhan-98/attendance_ruler/blob/master/LICENSE" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/github/license/mohit-chauhan-98/attendance_ruler"></a>
<a href="https://pub.dev/packages/attendance_ruler"><img src="https://img.shields.io/pub/v/attendance_ruler?color=as&label=attendance_ruler&logo=as1&logoColor=blue&style=social"></a>
<a href="https://github.com/mohit-chauhan-98/attendance_ruler"><img src="https://img.shields.io/github/stars/mohit-chauhan-98/attendance_ruler?style=social" alt="MIT License"></a>

## Key Definition

* A package that gives us a attendance ruler a custom widget. This widget is used to show the
  attendance in and out time on the ruler with easy customization.

# Preview

![attendance_ruler](https://github.com/mohit-chauhan-98/attendance_ruler/blob/master/media/attendance_ruler.png?raw=true)

## Basic Usage

Import it to your project file

```
import 'package:attendance_ruler/attendance_ruler.dart';
```

And add it in its most basic form like it:

```
AttendanceRuler(
  attendanceDataModel: AttendanceDataModel(
    attendanceDate: DateTime(2024, 01, 01),
    attendanceInOutTimes: [
      InOutTime(
        inTime: const TimeOfDay(hour: 10, minute: 00),
        outTime: const TimeOfDay(hour: 19, minute: 00),
      ),
    ],
  ),
  attendanceRulerDecoration: const AttendanceRulerDecoration(),
);
```

### Required parameters of AttendanceRuler
------------

| Parameter                                           | Description                         |
|-----------------------------------------------------|-------------------------------------|
| AttendanceDataModel attendanceDataModel             | Data model for the attendance       |
| AttendanceRulerDecoration attendanceRulerDecoration | Decorate the AttendanceRuler Widget |

### Optional parameters of AttendanceRuler
------------

| Parameter  | Default                                                                        | Description                                                         |
|------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------|
| Size? size | If null then this will be used - Size(MediaQuery.of(context).size.width, 10.0) | The size that this AttendanceRuler should aim for, given the layout |

### Required parameters of AttendanceDataModel
------------

| Parameter                            | Description                              |
|--------------------------------------|------------------------------------------|
| DateTime attendanceDate              | Date of the attendance                   |
| List<InOutTime> attendanceInOutTimes | Defines the in and out time for the date |

### Optional parameters of InOutTime
------------

| Parameter          | Default | Description           |
|--------------------|---------|-----------------------|
| TimeOfDay? inTime  | --      | In times for the day  |
| TimeOfDay? outTime | --      | Out times for the day |

### Optional parameters of AttendanceRulerDecoration
------------

| Parameter                                               | Default                                                      | Description                                               |
|---------------------------------------------------------|--------------------------------------------------------------|-----------------------------------------------------------|
| Color backgroundColor                                   | Color(0xFFd9f8ff)                                            | Defines the backgroundColor of the Attendance Ruler       |
| BorderRadiusGeometry? borderRadius                      | If null then this will be used - BorderRadius.circular(20.0) | Defines the borderRadius of the ruler background          |
| double verticalPadding                                  | 4.0                                                          | Defines the verticalPadding of the ruler background box   |
| double horizontalPadding                                | 10.0                                                         | Defines the horizontalPadding of the ruler background box |
| Color rulerLineColor                                    | Color(0xFF24d8ff)                                            | Defines the rulerLineColor of the Attendance Ruler        |
| double rulerLineWidth                                   | 1.0                                                          | Defines the rulerLineWidth of the Attendance Ruler        |
| Color rulerTimeColor                                    | Color(0xFF64c3d1)                                            | Defines the rulerTimeColor of the Attendance Ruler        |
| Axis layoutDirection                                    | Axis.horizontal                                              | The axis along which the Attendance Ruler layout.         |
| Radius? rulerTimeCircularRadius                         | If null then this will be used (rulerHeight / 2)             | Defines the Radius for the time on the ruler              |
| RulerTimeRoundedCornerStyle rulerTimeRoundedCornerStyle | RulerTimeRoundedCornerStyle.firstAndLastRounded              | Defines the RoundedCornerStyle for the time on the rules  |
| RulerTimeFormat rulerTimeFormat                         | RulerTimeFormat.twentyFourHours                              | Defines the HoursFormat 24 or 12 for the Ruler Time       |
| int dayStartHour                                        | 0                                                            | Defines the attendance dayStartHour time                  |

### Guideline for contributors
------------

* Contribution towards my repository is always welcome, i request contributors to create a pull
  request for development.

### Guideline to report an issue/feature request
------------
It would be great for me if the reporter can share the below things to understand the root cause of
the issue.

* Library version
* Code snippet
* Logs if applicable
* Device specification like (Manufacturer, OS version, etc)
* Screenshot/video with steps to reproduce the issue
* Library used

LICENSE!
------------
**attendance_ruler**
is [MIT-licensed.](https://github.com/mohit-chauhan-98/attendance_ruler/blob/master/LICENSE)