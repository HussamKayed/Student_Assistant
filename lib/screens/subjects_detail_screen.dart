import 'package:flutter/material.dart';

class SubjectsDetailScreen extends StatelessWidget {
  static const String routeName = "/subjects-details-screen";
  const SubjectsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Subjects Summary",
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
