import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'screens/signup_page.dart';
import 'screens/weather_list.dart';
//import 'screens/login_page.dart';
import 'screens/login.dart';
//import 'screens/homepage.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawerClass(),
    );
  }
}

SharedPreferences sharedPreferences;

class DrawerClass extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _DrawClassState createState() => _DrawClassState();
}

class _DrawClassState extends State<DrawerClass> {
  final _key = GlobalKey<ScaffoldState>();
  SharedPreferences sharedPreferences;
  String username;
  String password;
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      username = sharedPreferences.getString('email');
      password = sharedPreferences.getString('password');
    });
  }

  Future<Widget> currentLoginPageStatus() async {
    String user;
    sharedPreferences = await SharedPreferences.getInstance();
    user = sharedPreferences.get('login').toString();

    if (user == 'null') {
      return Login();
    } else if (user == 'false')
      return WeatherList();
    else {
      return Login();
    }
  }

  Future<Widget> goToLoginPage() async {
    // return Future.delayed(
    //     Duration(
    //         seconds:
    //             0), // The page will wait for 1 second for future function to get executed.
    //     () {
    //   // Navigating to the login page after waiting for 1 second.

    //   return currentLoginPageStatus();
    // });
    return currentLoginPageStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: FutureBuilder(
        future: goToLoginPage(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return snapshot.data;
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        //Future function
      ),
    );
  }
}
