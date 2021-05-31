import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:info_app/helper/validationFunctions.dart';
import 'package:info_app/models/personModel.dart';

import 'loginPage.dart';
import "package:intl/intl.dart";

import 'profilePage.dart';

//import 'package:info_app/models/personModel.dart';
import 'package:info_app/helper/personDatabaseHelper.dart';
//import 'dart:async';
//import 'package:sqflite/sqflite.dart';

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

  // creating database instance
  // PersonDatabaseHelper personDatabaseHelper = PersonDatabaseHelper();
  // List<Person> personList;

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

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
                  return validateName(value);
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
                  return validateEmail(value);
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
                  return validatePhoneNumber(value);
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
                  return validatePassword(value);
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      debugPrint("Details are validated!!");
                      debugPrint("Full Name: " + nameController.text);
                      debugPrint("Email ID: " + emailController.text);
                      debugPrint("Date of Birth: " +
                          dateFormat.format(_birthDate).toString());
                      debugPrint("Gender: " + _gender.toString());

                      print("Phone Number: " + phoneController.text.toString());
                      debugPrint("Account Created!!!!!!!");

                      // Creating a new variable
                      var personObject = Person(
                          nameController.text.toString(),
                          emailController.text.toString(),
                          phoneController.text,
                          passController.text.toString(),
                          dateFormat.format(_birthDate).toString(),
                          _gender.toString());
                      // Initialising database instance
                      PersonDatabaseHelper person = new PersonDatabaseHelper();
                      await person.initializeDatabase();

                      // Inserting the person details
                      await person.insertPerson(personObject);

                      // Fetching
                      var result = await person
                          .getPerson(emailController.text.toString());
                      print(result);

                      // // Inserting Person's Details into database
                      // await insertPerson(person);
                      // //print(await persons());

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
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
