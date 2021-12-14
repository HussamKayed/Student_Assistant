import 'package:flutter/foundation.dart';

class Subject {
  final String abbreviation;
  late double weighting;
  final int creditPoints;
  late double gradeHaw;
  late double gradeDe;
  late double gradeUS;

  Subject(
    @required this.abbreviation,
    @required this.creditPoints,
  );

  static const List<String> subjects = [
    "EE1",
    "MA1",
    "SO1",
    "GE",
    "LSL1",
    "LSE1",
    "LSL2",
    "MA2",
    "SO2",
    "EE2",
    "EL1",
    "IC",
    "SS1",
    "AD",
    "EL2",
    "DI",
    "EM",
    "SS2",
    "SE",
    "MC",
    "DS",
    "DB",
    "SP",
    "IP",
    "BU",
    "OS",
    "DP",
    "DC",
    "CJ1",
    "CM1",
    "CM2",
    "CJ2",
    "BA",
  ];

  static const List<String> grades = [
    "5",
    "6",
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
  ];
}
