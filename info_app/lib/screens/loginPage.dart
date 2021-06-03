import 'package:flutter/material.dart';
import 'package:info_app/helper/authenticationFunctions.dart';
//import 'package:info_app/helper/personDatabaseHelper.dart';
import 'package:info_app/helper/validationFunctions.dart';
import 'package:info_app/screens/dashboardPage.dart';
//import 'package:info_app/screens/profilePage.dart';
import 'signupPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(100, 181, 246, 1),
          Color.fromRGBO(60, 155, 237, 1),
          Color.fromRGBO(32, 137, 229, 1),
        ],
      )),
      child: Column(
        children: [
          SizedBox(height: 20),
          // Successive Logo
          Image.asset("assets/successive_Logo.png", height: 150, width: 300),

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(bottom: 30, top: 50, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 30, top: 50, left: 20, right: 20),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                              //color: Colors.grey,
                              spreadRadius: 7.0,
                              blurRadius: 5.0,
                              color: Color.fromRGBO(208, 222, 254, 1)
                                  .withOpacity(0.5),
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 1.0, color: Colors.grey[300]),
                            )),
                            child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black),
                                  prefixIcon: Icon(Icons.person_outline),
                                  fillColor: Colors.white,
                                  filled: true,
                                  errorBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10.0),
                                ),
                                validator: (value) {
                                  return validateEmail(value);
                                }),
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                              enabledBorder: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.lock_outline),
                              fillColor: Colors.white,
                              filled: true,
                              errorBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                            ),
                            validator: (value) {
                              return validatePassword(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.grey,
                                spreadRadius: 3.0,
                                blurRadius: 5.0,
                                color: Color.fromRGBO(204, 205, 206, 1)
                                    .withOpacity(0.5),
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(100, 181, 246, 1),
                                Color.fromRGBO(60, 155, 237, 1),
                                Color.fromRGBO(32, 137, 229, 1),
                              ],
                            )),
                        child: ElevatedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              print("Validations Passed.");

                              // checking the credentials
                              bool credentialExists = await checkCredentials(
                                  emailController.text.toString(),
                                  passwordController.text.toString());

                              // Setting up the info in profile page
                              //getList();

                              await getPersonList(
                                  emailController.text.toString());
                              //await getEmail(emailController.text.toString());

                              if (credentialExists) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashboardPage()));
                              }
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(100, 181, 246, 1)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0),
                              ))),
                        ))
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Continue with social media",
                  style: TextStyle(fontSize: 17),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset("assets/fb.png", height: 100, width: 60),
                  SizedBox(width: 30),
                  Image.asset("assets/google.png", height: 100, width: 50),
                ]),
                Container(
                  padding: EdgeInsets.only(bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 20),
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
                                color: Colors.blue[900], fontSize: 20)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}
