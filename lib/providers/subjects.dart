import 'package:flutter/material.dart';
import '../models/subject.dart';

class Subjects with ChangeNotifier {
  List<Subject> subjects = [];
  // Map<String, Subject> completedSubjects = {
  //   "EE1" : Subject('EE1', ),
  //   "MA1",
  //   "SO1",
  //   "GE",
  //   "LSL1",
  //   "LSE1",
  //   "LSL2",
  //   "MA2",
  //   "SO2",
  //   "EE2",
  //   "EL1",
  //   "IC",
  //   "SS1",
  //   "AD",
  //   "EL2",
  //   "DI",
  //   "EM",
  //   "SS2",
  //   "SE",
  //   "MC",
  //   "DS",
  //   "DB",
  //   "SP",
  //   "IP",
  //   "BU",
  //   "OS",
  //   "DP",
  //   "DC",
  //   "CJ1",
  //   "CM1",
  //   "CM2",
  //   "CJ2",
  //   "BA",
  // };
  List<Subject> remainingSubjects = [];

  List<Subject> get subjectsGetter {
    return subjects;
  }

  void addSubject(Subject newSubject) {
    subjects.add(newSubject);
  }
}
