import 'package:flutter/material.dart';
import '/semesters_summary_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "IE_GPA_Calculator",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.white,
            canvasColor: Color.fromRGBO(238, 238, 238, 1),
            fontFamily: "RobotoCondensed",
            errorColor: Colors.red,
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Colors.white), //titles
                bodyText2: TextStyle(color: Colors.black38), //subtitles
                headline6: TextStyle(
                    fontSize: 20,
                    fontFamily: "RobotoCondensed",
                    fontWeight: FontWeight.bold))),
        // theme: ThemeData(
        //     primaryColor: Color.fromRGBO(23, 8, 109, 0),
        //     accentColor: Colors.white,
        //     backgroundColor: Color.fromRGBO(238, 238, 238, 0),
        //     errorColor: Colors.red.shade600,
        //     fontFamily: "RobotCondensed",
        //     textTheme: ThemeData.light().textTheme.copyWith(
        //           bodyText1: const TextStyle(
        //             fontFamily: "RobotoCondensed-Bold",
        //             fontSize: 24,
        //           ),
        //           bodyText2: const TextStyle(
        //             //main text
        //             fontFamily: "RobotCondensed-Regular",
        //             fontSize: 20,
        //           ),
        //           headline6: const TextStyle(
        //               //subtitles
        //               fontFamily: "RobotCondensed-LightItalic",
        //               fontSize: 14,
        //               color: Colors.black),
        //         )),
        home: MyHomePage(),
        routes: {
          SemestersSummaryPage.routeName: (context) => SemestersSummaryPage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("homepage")),
      body: Center(child: Text("Good things coming")),
    );
  }
}
