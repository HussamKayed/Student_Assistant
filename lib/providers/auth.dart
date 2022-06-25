import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  Future<void> signUp(String email, String password) async {
    final uriObject = Uri.parse(''); // add endpoint later

    await http.post(
      uriObject,
      body: json.encode(
        {
          "email": email,
          "password": password,
        },
      ),
    );
  }

  Future<void> login(String email, String password) async {
    final uriObject = Uri.parse(''); // add endpoint later

    await http.post(
      uriObject,
      body: json.encode(
        {
          "email": email,
          "password": password,
        },
      ),
    );
  }
}
