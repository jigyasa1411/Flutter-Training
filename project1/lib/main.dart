import 'package:flutter/material.dart';
import 'screens/signup_page.dart';
import 'screens/weather_list.dart';
import 'screens/login_page.dart';
//import 'screens/login.dart';

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

class DrawerClass extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _DrawClassState createState() => _DrawClassState();
}

class _DrawClassState extends State<DrawerClass> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _key.currentState.openDrawer(),
        ),
      ),
      body: Container(),
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
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Sign Out")),
          ],
        )),
      ),
    );
  }
}
