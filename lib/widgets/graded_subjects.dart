import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/widgets/modal_sheet_entry.dart';
import '../models/subject.dart';
import 'package:provider/provider.dart';
import '../providers/subjects.dart';

class GradedSubjects extends StatefulWidget {
  GradedSubjects(this.subjects, {Key? key}) : super(key: key);
  Map<Subject, String> subjects;

  @override
  State<GradedSubjects> createState() => _GradedSubjectsState();
}

class _GradedSubjectsState extends State<GradedSubjects>
    with AutomaticKeepAliveClientMixin {
  String dropdownMenuValue = "EE1";
  String dropdownGradeMenuValue = "15";
  int currentIndex = 1;
  List<String> entryBuildingTest = ["1"];

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
            hint: const Text('Please select subject'),
            items: [
              ...Subject.gradedSubjects.map((currentSubject) {
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
            key: ValueKey(dropdownGradeMenuValue),
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
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.menu_book_outlined),
              ),
            ],
          ),
          ...entryBuildingTest
              .map((item) =>
                  ModalSheetEntry(dropdownMenuValue, dropdownGradeMenuValue))
              .toList(),
          ListTile(
              title: Text(
                'Add new Subject',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w800),
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      entryBuildingTest.add('');
                    });
                  },
                  icon: const Icon(Icons.add),
                  color: Theme.of(context).primaryColor)),
          TextButton(
            onPressed: () {
              widget.subjects = {
                Subject(dropdownMenuValue, int.parse(dropdownGradeMenuValue)):
                    dropdownGradeMenuValue
              };
              providerInstance.getSemesterCompletedSubjects(widget.subjects);
            },
            child: const Text(
              'Add Subjects',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
              foregroundColor:
                  MaterialStateProperty.all(Theme.of(context).canvasColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
