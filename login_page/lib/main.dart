import 'package:flutter/material.dart';

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
        home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(170, 240, 216, 10),
        body: Container(
          padding:
              EdgeInsets.only(left: 5.0, right: 5.0, top: 100.0, bottom: 50.0),
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: 0.8,
            child: Center(
              widthFactor: 0.8,
              heightFactor: 0.6,
              child: ListView(
                //child: Column(
                children: [
                  Image.asset(
                    "assets/user.png",
                    alignment: Alignment.center,
                    height: 150,
                    width: 200,
                    color: Color.fromRGBO(24, 214, 209, 10),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Username",
                      fillColor: Colors.white70,
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      fillColor: Colors.white70,
                      filled: true,
                      prefixIcon: Icon(Icons.lock),
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 500,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          debugPrint("Account Created!!");
                        }
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(24, 214, 209, 10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      //),
    );
  }
}
