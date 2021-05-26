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
  bool user;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  void initState() {
    super.initState();
    checkIfAlreadyLogin(user);
  }

  void checkIfAlreadyLogin(bool user) async {
    sharedPreferences = await SharedPreferences.getInstance();
    user = (sharedPreferences.getBool('login') ?? true);
    print(user);
    if (user == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Login()));
    } else {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => WeatherList()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    child: Column(
                      children: [
                        TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Username",
                              fillColor: Colors.white,
                              filled: true,
                              //border: OutlineInputBorder()
                            ),
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => node.nextFocus()),
                        //SizedBox(height: 20),
                        TextFormField(
                            controller: passController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Password",
                              fillColor: Colors.white,
                              filled: true,
                              // border: OutlineInputBorder()
                            ),
                            //textInputAction: TextInputAction.next,
                            onEditingComplete: () => node.unfocus()),

                        SizedBox(height: 50),
                        Container(
                          width: 530,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              //if (_formKey.currentState.validate()) {}
                              String username = emailController.text;
                              String password = passController.text;
                              if (username != '' && password != '') {
                                print('Login Successfull');
                                sharedPreferences.setBool('login', false);
                                sharedPreferences.setString(
                                    'username', username);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WeatherList()));
                              }
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.black),
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
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/fb.png", height: 50, width: 50),
                            SizedBox(width: 30),
                            Image.asset("assets/google.png",
                                height: 100, width: 50)
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            //SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()));
                              },
                              child: Text("Sign Up",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
