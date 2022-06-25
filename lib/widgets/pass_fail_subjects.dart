import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/subject.dart';
import '../providers/subjects.dart';

class PassFailSubjects extends StatefulWidget {
  PassFailSubjects(this.subjects);
  Map<Subject, String> subjects;

  @override
  State<PassFailSubjects> createState() => _PassFailSubjectsState();
}

class _PassFailSubjectsState extends State<PassFailSubjects>
    with AutomaticKeepAliveClientMixin {
  String dropdownMenuValue = 'GE';
  List<String> entryBuildingTest = [''];

  @override
  Widget build(BuildContext context) {
    final subjectsProvider = Provider.of<Subjects>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.auto_stories),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  ...Subject.passFailSubjects.map((currentSubject) {
                    return DropdownMenuItem<String>(
                        child: Text(currentSubject), value: currentSubject);
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
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
            if (dropdownMenuValue != "") {
              widget.subjects = {Subject(dropdownMenuValue, 5): '5'};
              subjectsProvider.getSemesterCompletedSubjects(widget.subjects);
            }
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
