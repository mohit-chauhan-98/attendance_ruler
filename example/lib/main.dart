import 'dart:async';
import 'dart:developer' as dev;

import 'package:attendance_ruler/attendance_ruler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'utils.dart';

/// Entry point of the program
void main() async {
  /// Runs the program in its own error zone
  await runZonedGuarded(() async {
    /// Ensuring that framework is binds with the engine
    WidgetsFlutterBinding.ensureInitialized();

    /// Setting fixed device orientation
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// Attaching the App
    runApp(const AttendanceApp());
  }, (error, stackTrace) async {
    if (kDebugMode) {
      dev.log('runZonedGuarded error: ${error.toString()}');
    }
  });
}

/// Root of the Attendance App
class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendance App',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.cyan,
      ),
      themeMode: ThemeMode.light,
      home: const AttendancePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Main page of the Attendance App
class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Attendance'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    var data = attendanceDataModel[index];
                    return AttendanceRulerListTile(
                      attendanceDataModel: data,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1.0,
                    );
                  },
                  itemCount: attendanceDataModel.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// List tile with the attendance ruler used in attendance page
class AttendanceRulerListTile extends StatelessWidget {
  final AttendanceDataModel attendanceDataModel;

  const AttendanceRulerListTile({
    super.key,
    required this.attendanceDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('MMM dd, EEE').format(
              attendanceDataModel.attendanceDate,
            ),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AttendanceRuler(
              attendanceDataModel: attendanceDataModel,
              attendanceRulerDecoration: const AttendanceRulerDecoration(
                dayStartHour: 6,
              ),
            ),
          ),
          Center(
            child: AttendanceStats(
              hoursOfAttendance:
                  getCalculatedHoursFromAttendance(attendanceDataModel),
            ),
          ),
        ],
      ),
    );
  }
}
