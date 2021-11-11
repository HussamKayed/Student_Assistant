import 'package:flutter/material.dart';

class SemestersSummaryPage extends StatelessWidget {
  static const String routeName = "/semesters-summary-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semester Summary"),
        centerTitle: true,
      ),
    );
  }
}
