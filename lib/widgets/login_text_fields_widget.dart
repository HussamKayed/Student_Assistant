import 'package:flutter/material.dart';

class LoginTextFieldsWidget extends StatelessWidget {
  const LoginTextFieldsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        children: <Widget>[
          buildTextField(emailController, () {}, 'Email', context),
          const SizedBox(height: 10),
          buildTextField(passwordController, () {}, 'Password', context)
        ],
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller,
      Function functionToExecuteOnSubmitted,
      String placeHolder,
      BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        controller: controller,
        cursorWidth: 1,
        onSubmitted: (enteredString) {},
        decoration: InputDecoration(
            label: Text(
              placeHolder,
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: FontWeight.w900,
                  fontSize: 12),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade900, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.blue.shade900, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.blue.shade600)),
            floatingLabelBehavior: FloatingLabelBehavior.auto),
      ),
    );
  }
}
