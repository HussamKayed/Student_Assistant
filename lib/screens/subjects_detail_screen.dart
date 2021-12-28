import 'package:flutter/material.dart';

class SubjectsDetailScreen extends StatelessWidget {
  static const String routeName = "/subjects-details-screen";
  const SubjectsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text("Completed Subjects",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}
