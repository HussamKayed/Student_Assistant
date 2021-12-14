import 'package:flutter/material.dart';
import 'package:ie_gpa_calculator/widgets/login_text_fields_widget.dart';
import 'package:ie_gpa_calculator/widgets/register_text_widget.dart';
import '../widgets/login_button_widget.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Image.asset('assets/images/HAW_Marke_RGB-72dpi.png'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          LoginTextFieldsWidget(),
          RegisterTextWidget(),
          LoginButtonWidget()
        ],
      ),
    );
  }
}
