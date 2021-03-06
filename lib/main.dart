import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/register_screen.dart';
import '/screens/gpa_summary_screen.dart';
import 'screens/auth_screen.dart';
import '/screens/subjects_detail_screen.dart';
import '/screens/splash_screen.dart';
import '/screens/semesters_summary_screen.dart';
import 'providers/subjects.dart';
import 'providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Subjects(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
          title: "Student Assistant",
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.blue.shade900,
            accentColor: Colors.white,
            canvasColor: const Color.fromRGBO(238, 238, 238, 1),
            fontFamily: "RobotoCondensed",
            errorColor: Colors.red,
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: const TextStyle(color: Colors.white), //titles
                  bodyText2: const TextStyle(color: Colors.black38), //subtitles
                  headline6: const TextStyle(
                      fontSize: 20,
                      fontFamily: "RobotoCondensed",
                      fontWeight: FontWeight.bold),
                ),
          ),
          home: SemestersSummaryScreen(),
          routes: {
            SemestersSummaryScreen.routeName: (context) =>
                SemestersSummaryScreen(),
            MyHomePage.routeName: (context) => MyHomePage(),
            GpaSummaryScreen.routeName: (context) => GpaSummaryScreen(),
            SubjectsDetailScreen.routeName: (context) => SubjectsDetailScreen(),
            AuthScreen.routeName: (context) => AuthScreen(),
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
