import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:project1/main.dart';
import 'package:project1/screens/signup_page.dart';
import 'package:project1/screens/weather_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  SharedPreferences sharedPreferences;
  bool user = false;

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkIfAlreadyLogin().then((value) {
      setState(() {});
    });
  }

  Future checkIfAlreadyLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    user = (sharedPreferences.getBool('login') ?? true);
    print(user);
    if (user == true) {
      print("You are not logged in.");
    } else {
      print("You are already logged in.");
    }
    if (user == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => WeatherList()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                  Color.fromRGBO(75, 165, 40, 1),
                  Color.fromRGBO(32, 137, 229, 1),
                  Color.fromRGBO(100, 181, 246, 1),
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/successiveLogo2.png",
                  height: 150,
                  width: 350,
                  alignment: Alignment.center,
                ),
                Container(
                  height: 600,
                  width: 800,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 50, top: 50, left: 50, right: 50),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue[100].withOpacity(0.5),
                                  blurRadius: 5.0, // soften the shadow
                                  spreadRadius: 5.0, //extend the shadow
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: Column(children: [
                            TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: UnderlineInputBorder(),
                                  errorBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter username";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => node.nextFocus()),
                            TextFormField(
                                controller: passController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Password is required.";
                                  }
                                  String pattern =
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'; //Password validation regular expression.
                                  RegExp regExp = new RegExp(pattern);

                                  if (!regExp.hasMatch(value)) {
                                    return "Password must contain atleast 1 uppercase, min. 1 lowercase, 1 special character, min. 1 numeric char.";
                                  } else if (value.length < 8) {
                                    return "Password should atleast be of 8 characters.";
                                  }
                                  return null;
                                },
                                onEditingComplete: () => node.unfocus()),
                          ]),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 50),
                            Container(
                              width: 530,
                              height: 60,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    print("Validations Passed.");
                                  }
                                  String username =
                                      emailController.text.toString();

                                  String password =
                                      passController.text.toString();

                                  if ((username != '' && password != '') &&
                                      _formKey.currentState.validate()) {
                                    print('Login Successfull');
                                    sharedPreferences.setBool('login', false);
                                    sharedPreferences.setString(
                                        'username', username);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WeatherList()));
                                  }
                                },
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(80.0),
                                    ))),
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Continue with social media",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/fb.png",
                                    height: 100, width: 60),
                                SizedBox(width: 30),
                                Image.asset("assets/google.png",
                                    height: 100, width: 50),
                                Row()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                //SizedBox(width: 10),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage()));
                                  },
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 20)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
