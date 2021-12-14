import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/screens/gpa_summary_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () =>
            Navigator.of(context).pushNamed(GpaSummaryScreen.routeName),
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     width: 10,
              //   ),
              // ),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width * 0.7,
                alignment: MainAxisAlignment.center,
                animation: true,
                animationDuration: 1000,
                lineHeight: 60,
                fillColor: Theme.of(context).canvasColor,
                percent: 0.1,
                center:
                    Text("20.0%", style: Theme.of(context).textTheme.headline6),
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text("Program Completion",
                style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}
