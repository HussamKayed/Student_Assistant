import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../screens/subjects_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/subjects.dart';

class GpaSummaryWidget extends StatelessWidget {
  const GpaSummaryWidget({Key? key, required this.semesterId})
      : super(key: key);

  final int semesterId;

  Widget buildListTile(
      BuildContext ctx, String displayedDataText, double grade) {
    return Card(
      color: Theme.of(ctx).canvasColor,
      elevation: 0,
      margin: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildBoxContainer(ctx, grade),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxContainer(BuildContext ctx, double grade) {
    return Container(
      width: kIsWeb
          ? MediaQuery.of(ctx).size.width * 0.05
          : MediaQuery.of(ctx).size.width * 0.25,
      height: kIsWeb
          ? MediaQuery.of(ctx).size.width * 0.05
          : MediaQuery.of(ctx).size.width * 0.25,
      child: Center(
          child:
              Text(grade.toString(), style: Theme.of(ctx).textTheme.headline6)),
      decoration: BoxDecoration(
        color: Theme.of(ctx).canvasColor,
        border: Border.all(color: Theme.of(ctx).primaryColor, width: 10),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey, offset: Offset(20.0, 10.0), blurRadius: 20.0)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final semesterId = ModalRoute.of(context)!.settings.arguments as int;
    final subjectsProvider = Provider.of<Subjects>(context);
    double gpaDe = 0;
    double gpaHaw = 0;
    double gpaUs = 0;
    int completedCreditPoints = 0;
    if (semesterId == 8) {
      gpaDe = subjectsProvider.getTotalDeGpa();
      gpaHaw = subjectsProvider.getTotalHawGpa();
      gpaUs = subjectsProvider.getTotalUsGpa();
      completedCreditPoints = subjectsProvider.getTotalCp();
    } else {
      gpaDe = subjectsProvider.getDeGpaPerSemester(semesterId);
      gpaHaw = subjectsProvider.getHawGpaPerSemester(semesterId);
      gpaUs = subjectsProvider.getUsGpaPerSemester(semesterId);
      completedCreditPoints = subjectsProvider.getCpGpaPerSemester(semesterId);
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Acquired Credit Points',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 10,
                    ),
                    Text('German System GPA',
                        style: Theme.of(context).textTheme.headline6),
                    SizedBox(
                      height: 10,
                    ),
                    Text('US System GPA',
                        style: Theme.of(context).textTheme.headline6),
                    !kIsWeb
                        ? SizedBox(
                            height: 10,
                          )
                        : SizedBox(height: 10.0),
                    Text('HAW System GPA',
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildListTile(context, 'Acquired Credit Points',
                        completedCreditPoints.toDouble()),
                    buildListTile(context, 'German System GPA', gpaDe),
                    buildListTile(context, 'US System GPA', gpaUs),
                    buildListTile(context, 'HAW System GPA', gpaHaw),
                  ],
                ),
              ),
            ],
          ),
          TextButton(
            child: const Text(
              "View Entered Subjects",
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Navigator.pushNamed(context, SubjectsDetailScreen.routeName,
                  arguments: semesterId);
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(10),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor)),
          )
        ],
      ),
    );
  }
}
