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
        foregroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
