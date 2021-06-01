import 'package:flutter/material.dart';
import 'package:info_app/helper/authenticationFunctions.dart';
//import 'package:info_app/helper/personDatabaseHelper.dart';
import 'package:info_app/helper/validationFunctions.dart';
import 'package:info_app/screens/profilePage.dart';
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
          Color.fromRGBO(60, 155, 237, 1),
          Color.fromRGBO(32, 137, 229, 1),
          Color.fromRGBO(100, 181, 246, 1),
        ],
      )),
      child: Column(
        children: [
          // Successive Logo
          Image.asset("assets/successiveLogo2.png", height: 150, width: 350),

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60))),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 50, top: 50, left: 50, right: 50),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              //color: Colors.grey,
                              spreadRadius: 5.0,
                              blurRadius: 5.0,
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(0, 3),
                            )
                          ]),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              hintText: "Email",
                              prefixIcon: Icon(Icons.person_outline),
                              fillColor: Colors.white,
                              filled: true,
                              errorBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              hintText: "Password",
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
                        width: 320,
                        height: 60,
                        decoration: BoxDecoration(),
                        child: ElevatedButton(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              print("Validations Passed.");

                              // PersonDatabaseHelper person =
                              //     new PersonDatabaseHelper();
                              // Initialise the database
                              //await person.initializeDatabase();

                              // checking the credentials
                              bool credentialExists = await checkCredentials(
                                  emailController.text.toString(),
                                  passwordController.text.toString());

                              if (credentialExists) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()));
                              }
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset("assets/fb.png", height: 100, width: 60),
                  SizedBox(width: 30),
                  Image.asset("assets/google.png", height: 100, width: 50),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                          style: TextStyle(color: Colors.blue, fontSize: 20)),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}
