import 'package:flutter/material.dart';

import '../widgets/gpa_summary_widget.dart';

class GpaSummaryScreen extends StatelessWidget {
  static const String routeName = '/gpa-summary-screen';

  @override
  Widget build(BuildContext context) {
    final semesterNumber = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('$semesterNumber semester page'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: GpaSummaryWidget());
  }
}
