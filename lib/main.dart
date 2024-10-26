import 'dart:io';

import 'package:flutter/material.dart';
import 'package:irrigacao/Services/HttpOverride.dart';
import 'package:irrigacao/Views/LoginPageView.dart';

void main() {
  runApp(LoginScreen());
}

// class login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = CustomHttpOverrides();
    return const MaterialApp(
      home: LoginPageView(),
    );
  }
}
