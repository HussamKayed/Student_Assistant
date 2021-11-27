import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MyHomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
                child: Image.asset(
              'assets/images/HAW_Marke_RGB-72dpi.png',
              width: MediaQuery.of(context).size.width * 0.7,
            )),
            const SizedBox(height: 10),
            CircularProgressIndicator(
              color: Theme.of(context).canvasColor,
            )
          ],
        ));
  }
}
