import 'dart:ui';

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
        home: Scaffold(
          body: SingleChildScrollView(child: SignUpPage()),
        ));
  }
}

enum Gender { Male, Female }

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

//TextEditingController nameController = new TextEditingController();

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  Gender _gender = Gender.Male;

  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  DateTime selectedDate = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    // ignore: missing_required_param
    return Form(
        key: _formKey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
          child: Column(
            children: [
              Image.asset(
                "assets/successiveLogo.png",
                height: 80.0,
                width: 80.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 10),
                      child: Icon(Icons.person)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 10),
                    child: Icon(Icons.email),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }

                  const emailPattern =
                      r'[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Email validation regular expression
                  final regEx = RegExp(emailPattern);

                  if (!regEx.hasMatch(value)) {
                    return "Enter valid email";
                  }
                  return null;
                },

                // to shift the focus to next textfield or widget.
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 10),
                      child: Icon(Icons.phone)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Number is required.";
                  }
                  String numPattern =
                      r'^[0-9]+$'; //Phone Number validation regular expression.
                  RegExp regExp = new RegExp(numPattern);

                  if (!regExp.hasMatch(value)) {
                    return "Invalid number format.";
                  } else if (value.length < 10 || value.length > 10) {
                    return "Number should be of 10 digits.";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: "Date of Birth (yyyy-mm-dd)",
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(start: 10),
                    child: Icon(Icons.cake),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: (dob) {
                  var ageDiff = selectedDate.difference(DateTime.parse(
                      dob)); // finding age difference using two dates.
                  var age =
                      ((ageDiff.inDays) / 365).round(); // Finding the age.

                  if (dob == null || dob.isEmpty) {
                    return "Please enter your date of birth.";
                  }

                  if (age < 13) {
                    return "Your age is below 13, so you can't register.";
                  }
                  return null;
                },

                // to shift the focus to next textfield or widget.
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Create Password",
                  prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 10),
                      child: Icon(Icons.lock)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
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
                textInputAction: TextInputAction.next,
                onEditingComplete: () => node.nextFocus(),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: confirmPassController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 10),
                      child: Icon(Icons.lock)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Password is required.";
                  }
                  if (value != passController.value.text) {
                    return "Password do not match.";
                  }
                  return null;
                },
                onEditingComplete: () => node.unfocus(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 510,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.person,
                      color: Colors.grey[600],
                    ),
                    Text(
                      " Gender: ",
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                    Text("Male",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 16)),
                    Radio(
                        value: Gender.Male,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        }),
                    Text("Female",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 16)),
                    Radio(
                        value: Gender.Female,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        }),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 510,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      debugPrint("Account Created!!");
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(27, 213, 210, 10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ))),
                ),
              ),

              /*SizedBox(
                height: 5.0,
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
