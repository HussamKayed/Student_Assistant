import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../widgets/subjects_list_widget.dart';
import '../providers/subjects.dart';

class SubjectsDetailScreen extends StatelessWidget {
  static const String routeName = "/subjects-details-screen";
  const SubjectsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subjectProvider = Provider.of<Subjects>(context);
    final semesterNumber = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Subjects Summary",
        ),
        foregroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: false,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Completed Subjects",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            SubjectsListWidget(semesterNumber)
          ],
        ),
      ),
    );
  }
}
