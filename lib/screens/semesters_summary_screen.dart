import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/widgets/progress_bar_widget.dart';
import 'package:ie_gpa_calculator/widgets/progress_indicator_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/new_subject_widget.dart';
import '/providers/subjects.dart';
import '../models/subject.dart';

class SemestersSummaryScreen extends StatefulWidget {
  static const String routeName = "/semesters-summary-page";
  static int subjectsNumber = 0;

  @override
  State<SemestersSummaryScreen> createState() => _SemestersSummaryScreenState();
}

class _SemestersSummaryScreenState extends State<SemestersSummaryScreen> {
  void startAdddingNewSubject(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap:
              () {}, // hena hayob2a fe async call zabatha (heya elmain get request)
          child: NewSubject(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final subject = Provider.of<Subjects>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HAW CALCULATOR'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ProgressBarWidget(subject.completedSubjectsNumber /
                        Subject.subjects.length),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProgressIndicatorWidget(
                    subject.completedSemesterSubjectsNumber[1]! /
                        subject.numberOfSubjectsPerSemester[1]!,
                    1),
                ProgressIndicatorWidget(
                    subject.completedSemesterSubjectsNumber[2]! /
                        subject.numberOfSubjectsPerSemester[2]!,
                    2),
                ProgressIndicatorWidget(
                    subject.completedSemesterSubjectsNumber[3]! /
                        subject.numberOfSubjectsPerSemester[3]!,
                    3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProgressIndicatorWidget(
                    subject.completedSemesterSubjectsNumber[4]! /
                        subject.numberOfSubjectsPerSemester[4]!,
                    4),
                ProgressIndicatorWidget(
                    subject.completedSemesterSubjectsNumber[5]! /
                        subject.numberOfSubjectsPerSemester[5]!,
                    5),
                ProgressIndicatorWidget(
                    subject.completedSemesterSubjectsNumber[6]! /
                        subject.numberOfSubjectsPerSemester[6]!,
                    6)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressIndicatorWidget(
                    subject.completedSemesterSubjectsNumber[7]! /
                        subject.numberOfSubjectsPerSemester[7]!,
                    7)
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => startAdddingNewSubject(context),
            ),
            IconButton(
              icon:
                  const Icon(Icons.manage_accounts_sharp, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
