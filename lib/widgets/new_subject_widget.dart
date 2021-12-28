import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/subjects.dart';
import '../models/subject.dart';

class NewSubject extends StatefulWidget {
  @override
  State<NewSubject> createState() => _NewSubjectState();
}

class _NewSubjectState extends State<NewSubject> {
  String dropdownMenuValue = "EE1";
  String dropdownGradeMenuValue = "15";
  int currentIndex = 1;
  int key = 1;

  // void submitSubjects(Map<String, int> enteredSubjects) {
  //
  // }

  Widget buildModalSheetEntry() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).canvasColor),
          child: DropdownButton<String>(
            value: dropdownMenuValue,
            icon: Icon(Icons.arrow_downward,
                size: 24, color: Theme.of(context).primaryColor),
            onChanged: (value) {
              setState(() {
                dropdownMenuValue = value!;
              });
            },
            items: [
              ...Subject.subjects.map((currentSubject) {
                return DropdownMenuItem<String>(
                    child: Text(currentSubject), value: currentSubject);
              }).toList()
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).canvasColor),
          child: DropdownButton<String>(
            key: ValueKey(dropdownMenuValue),
            value: dropdownGradeMenuValue,
            icon: Icon(Icons.arrow_downward,
                size: 24, color: Theme.of(context).primaryColor),
            onChanged: (value) {
              setState(() {
                dropdownGradeMenuValue = value!;
              });
            },
            items: [
              ...Subject.grades.map((currentGrade) {
                return DropdownMenuItem<String>(
                    child: Text(currentGrade), value: currentGrade);
              }).toList()
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerInstance = Provider.of<Subjects>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.menu_book_outlined),
              ),
            ],
          ),
          buildModalSheetEntry(),
          // ListTile(
          //     title: Text(
          //       'Add new Subject',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontWeight: FontWeight.w800),
          //     ),
          //     trailing: IconButton(
          //         onPressed: () {
          //           setState(() {
          //             currentIndex++;
          //           });
          //         },
          //         icon: const Icon(Icons.add),
          //         color: Theme.of(context).primaryColor)),
          TextButton(
            onPressed: () {
              if (dropdownGradeMenuValue != "" ||
                  dropdownGradeMenuValue != "") {
                Map<Subject, String> newMap = {
                  Subject(dropdownMenuValue, int.parse(dropdownGradeMenuValue)):
                      dropdownGradeMenuValue
                };
                providerInstance.getSemesterCompletedSubjects(newMap);
              }
            },
            child: const Text(
              'Add Subject',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              foregroundColor:
                  MaterialStateProperty.all(Theme.of(context).canvasColor),
            ),
          )
        ],
      ),
    );
  }
}
