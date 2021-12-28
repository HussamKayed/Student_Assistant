import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/register_screen.dart';
import '/screens/gpa_summary_screen.dart';
import '/screens/login_screen.dart';
import '/screens/subjects_detail_screen.dart';
import '/screens/splash_screen.dart';
import '/screens/semesters_summary_screen.dart';
import 'providers/subjects.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Subjects(),
      child: MaterialApp(
          title: "IE_GPA_Calculator",
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue.shade900,
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
                      fontWeight: FontWeight.bold),
                ),
          ),
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
          home: SplashScreen(),
          routes: {
            // SplashScreen.routeName: (context) => SplashScreen(),
            SemestersSummaryScreen.routeName: (context) =>
                SemestersSummaryScreen(),
            MyHomePage.routeName: (context) => MyHomePage(),
            GpaSummaryScreen.routeName: (context) => GpaSummaryScreen(),
            SubjectsDetailScreen.routeName: (context) => SubjectsDetailScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen()
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = "/home-page";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(child: Text("Good things coming")),
    );
  }
}
