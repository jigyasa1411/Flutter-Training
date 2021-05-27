import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/signup_page.dart';
import 'screens/weather_list.dart';
import 'screens/login_page.dart';
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

  Future<Widget> goToLogin() async {
    return Future.delayed(
        Duration(
            seconds:
                1), // The page will wait for 1 second for future function to get executed.
        () {
      // Navigating to the login page after waiting for 1 second.
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Login()));
      return Text("Done");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("Home Page"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _key.currentState.openDrawer(),
        ),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        future: goToLogin(), //Future function
      ),
      drawer: SafeArea(
        child: Drawer(
            child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text("SignUp")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WeatherList()));
                },
                child: Text("WeatherList")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Log In")),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Successive Technologies Log In")),
            TextButton(
                onPressed: () {
                  sharedPreferences.setBool('login', true);
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Sign Out")),
          ],
        )),
      ),
    );
  }
}
