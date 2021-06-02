import 'package:flutter/material.dart';
import 'package:info_app/helper/authenticationFunctions.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //Gender gender = Gender.Female;
  String _gender = gender == null
      ? "Male"
      : gender; // Setting up the default value of the gender.

  DateTime date;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(60, 155, 237, 1),
              Color.fromRGBO(32, 137, 229, 1),
              Color.fromRGBO(100, 181, 246, 1),
            ])),
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  child: Center(
                    child: Text(name[0],
                        style: TextStyle(color: Colors.red, fontSize: 40)),
                  ),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(bottom: 10, top: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(60),
                              topLeft: Radius.circular(60))),
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: 10, top: 10, right: 30, left: 30),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            spreadRadius: 5.0,
                            blurRadius: 5.0,
                            color: Colors.grey.withOpacity(0.5),
                            offset: Offset(0, 3),
                          )
                        ]),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline),
                                  hintText: name == null ? "Name" : name,
                                  hintStyle: TextStyle(color: Colors.black),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 10.0)),
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                            ),

                            Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.people_outline,
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  "  Gender: ",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                                Radio(
                                    value: "Male",
                                    groupValue: _gender,
                                    onChanged: (value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    }),
                                Text("Male",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                Radio(
                                    value: "Female",
                                    groupValue: _gender,
                                    onChanged: (value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    }),
                                Text("Female",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                              ],
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: birthDate == null
                                      ? "Date of Birth"
                                      : birthDate,
                                  hintStyle: TextStyle(color: Colors.black),
                                  prefixIcon:
                                      Icon(Icons.calendar_today_outlined),
                                  enabledBorder: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 10.0)),
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                            ),
                            // SizedBox(height: 20),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  hintText: email1 == null ? "Email" : email1,
                                  hintStyle: TextStyle(color: Colors.black),
                                  prefixIcon: Icon(Icons.alternate_email),
                                  enabledBorder: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 10.0)),
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                            ),
                            //SizedBox(height: 20),
                            TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  hintText: phoneNumber == null
                                      ? "Phone Number"
                                      : phoneNumber,
                                  hintStyle: TextStyle(color: Colors.black),
                                  prefixIcon: Icon(Icons.phone),
                                  enabledBorder: InputBorder.none,
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 10.0)),
                              //textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.unfocus(),
                            ),
                            //SizedBox(height: 20),

                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue)),
                            ),
                          ],
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
