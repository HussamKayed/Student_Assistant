import 'package:flutter/material.dart';

import '../screens/subjects_detail_screen.dart';

class GpaSummaryWidget extends StatelessWidget {
  const GpaSummaryWidget({Key? key}) : super(key: key);

  Widget buildListTile(BuildContext ctx) {
    return Card(
      color: Theme.of(ctx).canvasColor,
      elevation: 0,
      margin: EdgeInsets.all(5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("something", style: Theme.of(ctx).textTheme.headline6),
        _buildBoxContainer(ctx, 1),
      ]),
    );
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
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey, offset: Offset(20.0, 10.0), blurRadius: 20.0)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final semesterId = ModalRoute.of(context)!.settings.arguments as String;
    return Container(
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
                Navigator.pushNamed(context, SubjectsDetailScreen.routeName);
              },
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(10),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
            )
          ]),
    );
  }
}
