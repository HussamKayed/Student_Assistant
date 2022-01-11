import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../data/endpoints.dart';
import '../models/subject.dart';
import 'package:http/http.dart' as http;

class Subjects with ChangeNotifier {
  bool subjectFound = false;
  Map<String, dynamic> responseMap = {};
  Map<Subject, String> completedSubjects = {};
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

  Map<int, int> numberOfSubjectsPerSemester = {
    1: 5,
    2: 5,
    3: 6,
    4: 5,
    5: 2,
    6: 5,
    7: 3,
  };

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
    if (equals(gradesMap)) {
      return;
    } else {
      final uri;
      await filterSubject(gradesMap);
      Map<String, String> currentCompletedSubjects = {};
      if (completedSubjects.isNotEmpty) {
        completedSubjects.forEach((key, value) {
          Map<String, String> temporaryMap = {key.abbreviation: value};
          currentCompletedSubjects.addAll(temporaryMap);
        });
      }

      Map<String, String> queryParametersMap = {};

      gradesMap.forEach((subject, grade) {
        final int key = subject.semester;
        final int newValue = completedSemesterSubjectsNumber[key]! + 1;
        completedSemesterSubjectsNumber[key] = newValue;
        queryParametersMap
            .addAll({subject.abbreviation: subject.hawGrade.toString()});
      });

      completedSubjects.addAll(gradesMap);
      queryParametersMap.addAll(currentCompletedSubjects);

      uri = Uri.https(Endpoints.mainEndpoint, 'transcript', queryParametersMap);
      responseMap = await http.get(uri, headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }).then((response) {
        final responseBody = json.decode(response.body);
        return responseBody;
      });
      notifyListeners();
      for (Subject subject in completedSubjects.keys) {
        print(subject.abbreviation + " " + subject.hawGrade.toString());
      }
    }
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

  bool equals(Map<Subject, String> gradesMap) {
    final keys = gradesMap.keys;
    for (Subject subject in completedSubjects.keys) {
      for (Subject enteredSubject in keys) {
        if (subject.abbreviation == enteredSubject.abbreviation) {
          subjectFound = true;
          break;
        } else {
          subjectFound = false;
        }
      }
      if (subjectFound == true) break;
    }
    return subjectFound;
  }

  void toggleSubjectFound() {
    subjectFound = !subjectFound;
  }

  void addSubject(Map<String, Subject> subject) {
    responseMap.addAll(subject);
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

  double getUsGpaPerSemester(int semester) {
    if (responseMap.isEmpty) return 0;
    final usGpaPerSemester = responseMap['semesters'][semester - 1]['gpa_us'];
    if (usGpaPerSemester == null) {
      return 0;
    } else {
      return usGpaPerSemester;
    }
  }

  double getTotalUsGpa() {
    if (responseMap.isEmpty) return 0;
    final totalUsGpa = responseMap['gpa_us'];
    if (totalUsGpa == null) {
      return 0;
    } else {
      return totalUsGpa;
    }
  }

  double getHawGpaPerSemester(int semester) {
    if (responseMap.isEmpty) return 0;
    final hawGpaPerSemester = responseMap['semesters'][semester - 1]['gpa_haw'];
    if (hawGpaPerSemester == null) {
      return 0;
    } else {
      return hawGpaPerSemester;
    }
  }

  double getTotalHawGpa() {
    if (responseMap.isEmpty) return 0;
    final totalHawGpa = responseMap['gpa_haw'];
    if (totalHawGpa == null) {
      return 0;
    } else {
      return totalHawGpa;
    }
  }

  double getDeGpaPerSemester(int semester) {
    if (responseMap.isEmpty) return 0;
    final deGpaPerSemester = responseMap['semesters'][semester - 1]['gpa_de'];
    if (deGpaPerSemester == null) {
      return 0;
    } else {
      return deGpaPerSemester;
    }
  }

  double getTotalDeGpa() {
    if (responseMap.isEmpty) return 0;
    final totalDeGpa = responseMap['gpa_de'];
    if (totalDeGpa == null) {
      return 0;
    } else {
      return totalDeGpa;
    }
  }

  int getCpGpaPerSemester(int semester) {
    if (responseMap.isEmpty) return 0;
    final cpGpaPerSemester =
        responseMap['semesters'][semester - 1]['semester_completed_cp'];
    if (cpGpaPerSemester == null) {
      return 0;
    } else {
      return cpGpaPerSemester;
    }
  }

  int getTotalCp() {
    if (responseMap.isEmpty) return 0;
    final totalCp = responseMap['semester_completed_cp'];
    if (totalCp == null) {
      return 0;
    } else {
      return totalCp;
    }
  }

  // int numberOfSubjectsPerSemesterMap(int currentSemester) {
  //   return subjectsNumberPerSemester[currentSemester]!;
  // }
}
