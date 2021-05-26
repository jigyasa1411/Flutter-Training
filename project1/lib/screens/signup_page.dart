import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project1/screens/login.dart';
import "package:intl/intl.dart";
import 'package:project1/screens/weather_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreference;
final emailController = TextEditingController();
final passController = TextEditingController();

save() async {
  await _SignUpPageState.init();
  sharedPreference.setString('email', emailController.text.toString());
  sharedPreference.setString('password', passController.text.toString());
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

enum Gender { Male, Female }

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  DateTime _birthDate;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  Gender _gender = Gender.Male;

  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    // ignore: missing_required_param
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 30, right: 30, top: 100, bottom: 20),
            child: ListView(children: [
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
                    return "Please enter your full name.";
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
                    return "Please enter your email.";
                  }

                  const emailPattern =
                      r'[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Email validation regular expression
                  final regEx = RegExp(emailPattern);

                  if (!regEx.hasMatch(value)) {
                    return "Enter a valid email ID.";
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
                controller: phoneController,
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
                    return "Please enter your number.";
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
                //controller: dateController,
                //keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  hintText: _birthDate == null
                      ? 'Date Of Birth'
                      : dateFormat.format(_birthDate).toString(),
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2025))
                      .then((date) {
                    setState(() {
                      _birthDate = date;
                    });
                  });
                },
                validator: (date) {
                  if (_birthDate == null) {
                    return "Please enter your date of birth.";
                  }
                  int age = (DateTime.now().year - _birthDate.year);
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
                    Radio(
                        value: Gender.Male,
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        }),
                    Text("Male",
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
                    Text("Female",
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 16)),
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
                      debugPrint("Details are validated!!");
                      debugPrint("Full Name: " + nameController.text);
                      debugPrint("Email ID: " + emailController.text);
                      debugPrint("Date of Birth: " +
                          dateFormat.format(_birthDate).toString());
                      debugPrint("Gender: " + _gender.toString());

                      print("Phone Number: " + phoneController.text.toString());
                      debugPrint("Account Created!!!!!!!");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeatherList()));
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
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ]),
          )),
    );
  }
}
