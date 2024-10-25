import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irrigacao/Services/HttpOverride.dart';
import 'package:irrigacao/Views/LoginPageView.dart';
import 'methods.dart';

void main() {
  runApp(login());
}

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = CustomHttpOverrides();
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          Padding(padding: const EdgeInsets.all(16.0), child: LoginPageView()),
    );
  }
}
