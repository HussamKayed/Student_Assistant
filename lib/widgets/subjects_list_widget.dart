import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../providers/subjects.dart';
import '../models/subject.dart';

class SubjectsListWidget extends StatelessWidget {
  final int semesterId;

  SubjectsListWidget(this.semesterId);

  @override
  Widget build(BuildContext context) {
    final subjectsProvider = Provider.of<Subjects>(context);
    final List<Subject> subjectsList = [];

    getListOfSubjects(subjectsProvider, subjectsList);

    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Slidable(
                closeOnScroll: true,
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      icon: Icons.delete,
                      backgroundColor: Colors.red,
                    ),
                    SlidableAction(
                      onPressed: (context) {},
                      icon: Icons.edit,
                      backgroundColor: Colors.amber.shade600,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Icon(Icons.menu_book_rounded),
                  title: Text(
                    subjectsList[index].abbreviation,
                  ),
                  subtitle: Text(subjectsList[index].hawGrade.toString()),
                  trailing: Text(subjectsList[index].hawGrade.toString()),
                ),
              ),
            ],
          );
        },
        itemCount: subjectsList.length,
      ),
    );
  }

  List getListOfSubjects(Subjects subjectsProvider, List<Subject> keysList) {
    subjectsProvider.completedSubjects.forEach((key, value) {
      if (semesterId == 8) {
        keysList.add(key);
      }
      if (key.semester == semesterId) {
        keysList.add(key);
      }
    });
    return keysList;
  }
}
