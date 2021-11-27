import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/screens/subjects_detail_screen.dart';

class GpaSummaryScreen extends StatelessWidget {
  static const String routeName = '/gpa-summary-screen';
  double grade = 12.85;

  Widget _buildTextInfo(String identificationText, BuildContext ctx) {
    return Text(identificationText, style: Theme.of(ctx).textTheme.headline6);
  }

  Widget _buildPageInfo(BuildContext ctx) {
    return Container(
        height: MediaQuery.of(ctx).size.height * 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTextInfo('Acquired Credit Points', ctx),
                  _buildTextInfo('German System GPA', ctx),
                  _buildTextInfo('US System GPA', ctx),
                  _buildTextInfo('HAW System GPA', ctx)
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBoxContainer(ctx, grade),
                  _buildBoxContainer(ctx, grade),
                  _buildBoxContainer(ctx, grade),
                  _buildBoxContainer(ctx, grade),
                ],
              )
            ],
          ),
        ));
  }

  Widget _buildBoxContainer(BuildContext ctx, double grade) {
    return Container(
        width: MediaQuery.of(ctx).size.width * 0.25,
        height: MediaQuery.of(ctx).size.width * 0.25,
        child: Center(
            child: Text("12.312", style: Theme.of(ctx).textTheme.headline6)),
        decoration: BoxDecoration(
            color: Theme.of(ctx).canvasColor,
            border: Border.all(color: Theme.of(ctx).primaryColor, width: 10),
            borderRadius: BorderRadius.circular(10)));
  }

  @override
  Widget build(BuildContext context) {
    final semesterNumber = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('$semesterNumber semester page'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              // child: _buildPageInfo(context),
              children: [
                buildListTile(context),
                buildListTile(context),
                buildListTile(context),
                buildListTile(context),
                TextButton(
                  child: const Text(
                    "View Entered Subjects",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, SubjectsDetailScreen.routeName);
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                )
              ]),
        ));
  }

  Widget buildListTile(BuildContext ctx) {
    return Card(
      color: Theme.of(ctx).canvasColor,
      elevation: 0,
      margin: EdgeInsets.all(5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("something", style: Theme.of(ctx).textTheme.headline6),
        _buildBoxContainer(ctx, grade),
      ]),
    );
  }
}
