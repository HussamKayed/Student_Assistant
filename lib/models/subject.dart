// To parse this JSON data, do
//
//     final transcript = transcriptFromJson(jsonString);

import 'dart:convert';
import 'transcript.dart';

Transcript transcriptFromJson(String str) =>
    Transcript.fromJson(json.decode(str));

String transcriptToJson(Transcript data) => json.encode(data.toJson());

class Subject {
  Subject(this.abbreviation, this.hawGrade);

  final String abbreviation;
  final int hawGrade;
  late int semester = 0;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        json["abbreviation"],
        json["haw_grade"],
        // json["semester"]
      );

  Map<String, dynamic> toJson() => {
        "abbreviation": abbreviation,
        "haw_grade": hawGrade
        // "semester": semester,
      };

  static const List<String> gradedSubjects = [
    "EE1",
    "MA1",
    "SO1",
    "MA2",
    "SO2",
    "EE2",
    "EL1",
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
    "BU",
    "OS",
    "DP",
    "DC",
    "CM1",
    "CM2",
    "CJ2",
    "BA",
  ];

  static const List<String> passFailSubjects = [
    "GE",
    "LSL1",
    "LSE1",
    "LSL2",
    "IC",
    "IP",
    "CJ1",
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
