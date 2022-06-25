import 'package:flutter/material.dart';

enum AuthMode { Signup, login }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController _passwordController = TextEditingController();
  AuthMode _authMode = AuthMode.login;
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  Map<String, dynamic> _authData = {
    'email': '',
    'password': '',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.loose,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 25, 100, 1).withOpacity(0.7),
                    Color.fromRGBO(0, 40, 255, 1).withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Container(
                  child: const Text(
                    'STUDENT ASSISTANT',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Image.asset(
                    "assets/images/32-.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'E-Mail'),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return 'Invalid email!';
                                }
                                return null;
                              },
                              focusNode: _emailFocusNode,
                              onFieldSubmitted: (_) => FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode),
                              onSaved: (value) {
                                _authData['email'] = value!;
                              },
                            ),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                              obscureText: true,
                              controller: _passwordController,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 5) {
                                  return 'Password is too short!';
                                }
                              },
                              onSaved: (value) {
                                _authData['password'] = value!;
                              },
                            ),
                            if (_authMode == AuthMode.Signup)
                              TextFormField(
                                enabled: _authMode == AuthMode.Signup,
                                decoration: const InputDecoration(
                                    labelText: 'Confirm Password'),
                                obscureText: true,
                                validator: _authMode == AuthMode.Signup
                                    ? (value) {
                                        if (value != _passwordController.text) {
                                          return 'Passwords do not match!';
                                        }
                                      }
                                    : null,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
