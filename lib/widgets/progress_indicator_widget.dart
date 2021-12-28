import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/screens/gpa_summary_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double completionPercentage;
  final int semesterId;
  ProgressIndicatorWidget(this.completionPercentage, this.semesterId);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Navigator.of(context)
                .pushNamed(GpaSummaryScreen.routeName, arguments: semesterId),
            child: CircularPercentIndicator(
              radius: 100,
              lineWidth: 10,
              percent: completionPercentage,
              animation: false,
              fillColor: Theme.of(context).canvasColor,
              progressColor: Theme.of(context).primaryColor,
              center: Text(
                completionPercentage.toStringAsFixed(2),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(getSemester(semesterId),
            style: Theme.of(context).textTheme.headline6)
      ],
    );
  }

  String getSemester(int id) {
    switch (id) {
      case 1:
        return "1st";
      case 2:
        return "2nd";
      case 3:
        return "3rd";
      case 4:
        return "4th";
      case 5:
        return "5th";
      case 6:
        return "6th";
      case 7:
        return "7th";
      default:
        return "Invalid Semester ID";
    }
  }
}
