import 'subject.dart';

class Transcript {
  Transcript({
    required this.subjects,
    required this.semesterRegularCp,
    required this.semesterCompletedCp,
    required this.semesterRegularWeightedCp,
    required this.semesterCompletedWeightedCp,
    required this.gpaHaw,
    required this.gpaDe,
    required this.gpaUs,
    required this.semesters,
  });

  final List<Subject> subjects;
  final int semesterRegularCp;
  final int semesterCompletedCp;
  final int semesterRegularWeightedCp;
  final int semesterCompletedWeightedCp;
  final int gpaHaw;
  final int gpaDe;
  final int gpaUs;
  List<Transcript> semesters = [];

  factory Transcript.fromJson(Map<String, dynamic> json) => Transcript(
        subjects: List<Subject>.from(
            json["subjects"].map((transcript) => Subject.fromJson(transcript))),
        semesterRegularCp: json["semester_regular_cp"],
        semesterCompletedCp: json["semester_completed_cp"],
        semesterRegularWeightedCp: json["semester_regular_weighted_cp"],
        semesterCompletedWeightedCp: json["semester_completed_weighted_cp"],
        gpaHaw: json["gpa_haw"],
        gpaDe: json["gpa_de"],
        gpaUs: json["gpa_us"],
        semesters: List<Transcript>.from(
            json["semesters"].map((x) => Transcript.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subjects": List<dynamic>.from(
            subjects.map((transcript) => transcript.toJson())),
        "semester_regular_cp": semesterRegularCp,
        "semester_completed_cp": semesterCompletedCp,
        "semester_regular_weighted_cp": semesterRegularWeightedCp,
        "semester_completed_weighted_cp": semesterCompletedWeightedCp,
        "gpa_haw": gpaHaw,
        "gpa_de": gpaDe,
        "gpa_us": gpaUs,
        "semesters": semesters == null
            ? null
            : List<dynamic>.from(semesters.map((x) => x.toJson())),
      };
}
