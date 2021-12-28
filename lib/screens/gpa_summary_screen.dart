import 'package:flutter/material.dart';

import '../widgets/gpa_summary_widget.dart';

class GpaSummaryScreen extends StatelessWidget {
  static const String routeName = '/gpa-summary-screen';

  @override
  Widget build(BuildContext context) {
    final semesterNumber = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
        appBar: AppBar(
          title: Text(getSemester(semesterNumber)),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: GpaSummaryWidget());
  }

  String getSemester(int id) {
    switch (id) {
      case 1:
        return "1st semester";
      case 2:
        return "2nd semester";
      case 3:
        return "3rd semester";
      case 4:
        return "4th semester";
      case 5:
        return "5th semester";
      case 6:
        return "6th semester";
      case 7:
        return "7th semester";
      case 8:
        return "Overall Program Progress";
      default:
        return "Invalid Semester ID";
    }
  }
}
