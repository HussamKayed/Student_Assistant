import 'package:flutter/material.dart';

import '../models/subject.dart';

/**
 * save the values of the dropdown list as key value pairs in memory
 * until the "add subjects" button is pressed
 */
class ModalSheetEntry extends StatefulWidget {
  ModalSheetEntry(this.dropdownMenuValue, this.dropdownGradeMenuValue);

  String dropdownMenuValue;

  String dropdownGradeMenuValue;

  @override
  State<ModalSheetEntry> createState() => _ModalSheetEntryState();
}

class _ModalSheetEntryState extends State<ModalSheetEntry> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).canvasColor),
          child: DropdownButton<String>(
            hint: Text('please select a subject'),
            value: widget.dropdownMenuValue,
            icon: Icon(Icons.arrow_downward,
                size: 24, color: Theme.of(context).primaryColor),
            onChanged: (value) {
              setState(() {
                widget.dropdownMenuValue = value!;
              });
            },
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
            key: ValueKey(widget.dropdownMenuValue),
            value: widget.dropdownGradeMenuValue,
            icon: Icon(Icons.arrow_downward,
                size: 24, color: Theme.of(context).primaryColor),
            onChanged: (value) {
              setState(() {
                widget.dropdownGradeMenuValue = value!;
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
}
