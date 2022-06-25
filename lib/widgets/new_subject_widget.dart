import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/widgets/pass_fail_subjects.dart';
import 'package:provider/provider.dart';

import '../providers/subjects.dart';
import '../models/subject.dart';
import 'graded_subjects.dart';

class NewSubject extends StatefulWidget {
  final Map<Subject, String> subjectsMap;
  NewSubject(this.subjectsMap);
  @override
  State<NewSubject> createState() => _NewSubjectState();
}

class _NewSubjectState extends State<NewSubject> with TickerProviderStateMixin {
  String dropdownMenuValue = "EE1";
  String dropdownGradeMenuValue = "15";
  int currentIndex = 1;
  int key = 1;
  final List<Tab> subjectKinds = <Tab>[
    const Tab(
      text: 'Graded',
    ),
    const Tab(
      text: 'Pass or Fail',
    )
  ];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: subjectKinds.length);
  }

  // void submitSubjects(Map<String, int> enteredSubjects) {
  //
  // }
  // use the weight to calculate the compeletion percentage in each semester and overall progression
  // add more than one subject in each submission
  // change password functionality for the users
  // change username
  //

  // Widget buildModalSheetEntry() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.all(10),
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             color: Theme.of(context).canvasColor),
  //         child: DropdownButton<String>(
  //           value: dropdownMenuValue,
  //           icon: Icon(Icons.arrow_downward,
  //               size: 24, color: Theme.of(context).primaryColor),
  //           onChanged: (value) {
  //             setState(() {
  //               dropdownMenuValue = value!;
  //             });
  //           },
  //           items: [
  //             ...Subject.gradedSubjects.map((currentSubject) {
  //               return DropdownMenuItem<String>(
  //                   child: Text(currentSubject), value: currentSubject);
  //             }).toList()
  //           ],
  //         ),
  //       ),
  //       Container(
  //         padding: const EdgeInsets.all(10),
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //             color: Theme.of(context).canvasColor),
  //         child: DropdownButton<String>(
  //           key: ValueKey(dropdownMenuValue),
  //           value: dropdownGradeMenuValue,
  //           icon: Icon(Icons.arrow_downward,
  //               size: 24, color: Theme.of(context).primaryColor),
  //           onChanged: (value) {
  //             setState(() {
  //               dropdownGradeMenuValue = value!;
  //             });
  //           },
  //           items: [
  //             ...Subject.grades.map((currentGrade) {
  //               return DropdownMenuItem<String>(
  //                   child: Text(currentGrade), value: currentGrade);
  //             }).toList()
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TabBar(
            labelPadding: EdgeInsets.all(15),
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            controller: _tabController,
            tabs: [
              ...subjectKinds.map((tab) {
                return Center(
                  child: Text(
                    tab.text as String,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList()
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                GradedSubjects(widget.subjectsMap),
                PassFailSubjects(widget.subjectsMap),
              ],
            ),
          )

          // Column(
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: const <Widget>[
          //         Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: Icon(Icons.menu_book_outlined),
          //         ),
          //       ],
          //     ),
          //     buildModalSheetEntry(),
          //     ListTile(
          //         title: Text(
          //           'Add new Subject',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               color: Theme.of(context).primaryColor,
          //               fontWeight: FontWeight.w800),
          //         ),
          //         trailing: IconButton(
          //             onPressed: () {
          //               setState(() {
          //                 currentIndex++;
          //               });
          //             },
          //             icon: const Icon(Icons.add),
          //             color: Theme.of(context).primaryColor)),
          //     TextButton(
          //       onPressed: () {
          //         if (dropdownGradeMenuValue != "" ||
          //             dropdownGradeMenuValue != "") {
          //           Map<Subject, String> newMap = {
          //             Subject(dropdownMenuValue,
          //                     int.parse(dropdownGradeMenuValue)):
          //                 dropdownGradeMenuValue
          //           };
          //           providerInstance.getSemesterCompletedSubjects(newMap);
          //         }
          //       },
          //       child: const Text(
          //         'Add Subject',
          //         style: TextStyle(color: Colors.white),
          //       ),
          //       style: ButtonStyle(
          //         backgroundColor:
          //             MaterialStateProperty.all(Theme.of(context).primaryColor),
          //         foregroundColor:
          //             MaterialStateProperty.all(Theme.of(context).canvasColor),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
