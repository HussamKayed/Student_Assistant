import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/new_subject.dart';

class SemestersSummaryScreen extends StatefulWidget {
  static const String routeName = "/semesters-summary-page";

  @override
  State<SemestersSummaryScreen> createState() => _SemestersSummaryScreenState();
}

class _SemestersSummaryScreenState extends State<SemestersSummaryScreen> {
  void startAdddingNewSubject(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewSubject(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HAW CALCULATOR'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => startAdddingNewSubject(context),
            ),
            IconButton(
              icon: Icon(Icons.manage_accounts_sharp, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
    ;
  }
}
