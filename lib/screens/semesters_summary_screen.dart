import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/widgets/progress_bar_widget.dart';
import 'package:ie_gpa_calculator/widgets/progress_indicator_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/new_subject_widget.dart';
import '/providers/subjects.dart';

class SemestersSummaryScreen extends StatefulWidget {
  static const String routeName = "/semesters-summary-page";

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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Subjects(),
      child: Scaffold(
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
              SizedBox(height: 40),
              Container(
                  child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ProgressBarWidget())),
                  height: MediaQuery.of(context).size.height * 0.2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressIndicatorWidget(20, 2),
                  ProgressIndicatorWidget(20, 2),
                  ProgressIndicatorWidget(20, 2),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProgressIndicatorWidget(20, 2),
                  ProgressIndicatorWidget(20, 2),
                  ProgressIndicatorWidget(20, 2)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ProgressIndicatorWidget(20, 2)],
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
                icon: const Icon(Icons.manage_accounts_sharp,
                    color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
