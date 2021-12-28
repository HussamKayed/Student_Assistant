import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../data/endpoints.dart';
import '../models/subject.dart';
import 'package:http/http.dart' as http;

class Subjects with ChangeNotifier {
  Map<String, dynamic> completedSubjects = {};
  Map<String, Subject> subjects = {
    "EE1": Subject('EE1', 15),
    "MA1": Subject('MA1', 15),
    "SO1": Subject('SO1', 15),
    "GE": Subject('GE', 0),
    "LSL1": Subject('LSL1', 0),
    "LSE1": Subject('LSE1', 0),
    "LSL2": Subject('LSL2', 0),
    "MA2": Subject('MA2', 15),
    "SO2": Subject('SO2', 15),
    "EE2": Subject('EE2', 15),
    "EL1": Subject('EL1', 15),
    "IC": Subject('IC', 0),
    "SS1": Subject('SS1', 15),
    "AD": Subject('AD', 15),
    "EL2": Subject('EL2', 15),
    "DI": Subject('DI', 15),
    "EM": Subject('EM', 15),
    "SS2": Subject('SS2', 15),
    "SE": Subject('SE', 15),
    "MC": Subject('MC', 15),
    "DS": Subject('DS', 15),
    "DB": Subject('DB', 15),
    "SP": Subject('SP', 15),
    "IP": Subject('IP', 0),
    "BU": Subject('BU', 15),
    "OS": Subject('OS', 15),
    "DP": Subject('DP', 15),
    "DC": Subject('DC', 15),
    "CJ1": Subject('CJ1', 0),
    "CM1": Subject('CM1', 15),
    "CM2": Subject('CM2', 15),
    "CJ2": Subject('CJ2', 15),
    "BA": Subject('BA', 15),
  };
  Map<String, Subject> remainingSubjects = {};

  int subjectsPerSemester = 0;

  Map<int, int> completedSemesterSubjectsNumber = {
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
  };

  // Map<String, Subject> get subjectsGetter {
  //   return subjects;
  // }

  void getSemesterCompletedSubjects(Map<Subject, String> gradesMap) async {
    final uri;
    await filterSubject(gradesMap);
    Map<String, String> headersMap = {};
    gradesMap.forEach((subject, grade) {
      final int key = subject.semester;
      final int newValue = completedSemesterSubjectsNumber[key]! + 1;
      completedSemesterSubjectsNumber[key] = newValue;
      headersMap.addAll({subject.abbreviation: subject.hawGrade.toString()});
    });

    uri = Uri.https(Endpoints.mainEndpoint, '/transcript', headersMap);
    completedSubjects = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    }).then((response) {
      final responseBody = json.decode(response.body);
      // print(responseBody);
      return responseBody;
    });
    notifyListeners();
  }

  Future filterSubject(Map<Subject, String> gradesMap) async {
    var allSubjects = [];

    allSubjects = await http
        .get(Uri.parse(Endpoints.subjectsDetails))
        .then((value) => json.decode(value.body)) as List;
    gradesMap.forEach((subject, grade) {
      for (var retrievedSubject in allSubjects) {
        // print(retrievedSubject);
        if (retrievedSubject['abbreviation'] == subject.abbreviation) {
          subject.semester = retrievedSubject['semester'];
          break;
        }
      }
    });
  }

  Future getSubjectsNumberPerSemester(String semesterId) async {
    final int subjectsPerSemester = await http
        .get(Uri.parse(Endpoints.subjectsDetails + semesterId))
        .then((response) {
      return response.body.length;
    });
    return subjectsPerSemester;
  }

  void addSubject(Map<String, Subject> subject) {
    completedSubjects.addAll(subject);
    notifyListeners();
  }

  int get subjectsNumber {
    return subjects.length;
  }

  int get completedSubjectsNumber {
    int subjectsNumber = 0;
    completedSemesterSubjectsNumber.forEach((key, value) {
      subjectsNumber += value;
    });
    return subjectsNumber;
  }
}
