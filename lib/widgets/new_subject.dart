import 'package:flutter/material.dart';

import '../models/subject.dart';

class NewSubject extends StatefulWidget {
  @override
  State<NewSubject> createState() => _NewSubjectState();
}

class _NewSubjectState extends State<NewSubject> {
  String dropdownMenuValue = "SS1";
  String dropdownGradeMenuValue = "15";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_book_outlined),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(10),
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).canvasColor),
              child: DropdownButton<String>(
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
        ),
      ],
    );
  }
}
