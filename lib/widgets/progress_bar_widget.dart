import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/screens/gpa_summary_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../screens/semesters_summary_screen.dart';

class ProgressBarWidget extends StatefulWidget {
  final double completionPercentage;

  ProgressBarWidget(this.completionPercentage);

  @override
  State<ProgressBarWidget> createState() => _ProgressBarWidgetState();
}

class _ProgressBarWidgetState extends State<ProgressBarWidget> {
  double currentPercentage = 0;
  int programCase = 8;

  @override
  void setState(VoidCallback fn) {
    currentPercentage = widget.completionPercentage;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 10,
            //   ),
            // ),
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(
                  GpaSummaryScreen.routeName,
                  arguments: programCase),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width * 0.7,
                alignment: MainAxisAlignment.center,
                animation: true,
                animationDuration: 1000,
                lineHeight: 60,
                fillColor: Theme.of(context).canvasColor,
                percent: widget.completionPercentage,
                center: Text(
                    '${(widget.completionPercentage * 100).toStringAsFixed(1)}%',
                    style: Theme.of(context).textTheme.headline6),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text("Program Completion",
              style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }
}
