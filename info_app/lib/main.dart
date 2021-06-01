import 'package:flutter/material.dart';
import 'package:info_app/screens/loginPage.dart';
//import 'package:info_app/screens/signupPage.dart';
//import 'package:info_app/screens/dashboardPage.dart';
//import 'package:info_app/screens/profilePage.dart';

//import 'package:info_app/screens/signupPage.dart';
//import 'dart:async';
//import 'package:path/path.dart';

//import 'screens/dashboardPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
