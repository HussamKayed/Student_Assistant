import 'package:flutter/material.dart';
import '../screens/register_screen.dart';

class RegisterTextWidget extends StatelessWidget {
  const RegisterTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Don't have an account? ",
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text(
                  "Register now",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
