class Subject {
  final String abbreviation;
  final String title;
  final double weighting;
  final int creditPoints;
  final double gradeHaw;
  final double gradeDe;
  final double gradeUS;

  Subject(
      {required this.abbreviation,
      required this.title,
      required this.weighting,
      required this.gradeHaw,
      required this.creditPoints,
      required this.gradeDe,
      required this.gradeUS});
}
