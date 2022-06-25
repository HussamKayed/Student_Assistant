import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register-screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: TextFormField(),
      ),
    );
  }
}
