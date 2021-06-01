import 'package:flutter/material.dart';
import 'package:info_app/helper/authenticationFunctions.dart';
//import 'package:info_app/helper/personDatabaseHelper.dart';
//import 'package:info_app/helper/authenticationFunctions.dart';
import 'package:info_app/models/gender.dart';
import 'package:info_app/models/personModel.dart';
//import 'package:info_app/models/personModel.dart';

//import 'package:info_app/helper/authenticationFunctions.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Gender gender = Gender.Female; // Setting up the default value of the gender.
  final _formKey = GlobalKey<FormState>();

  // Future<List<dynamic>> personList =
  //getList(personList);

  // TextEditingController name = new TextEditingController();
  // TextEditingController email = new TextEditingController();
  // TextEditingController birthDate = new TextEditingController();
  // TextEditingController phoneNumber = new TextEditingController();

// void getList(String email) async {
//   PersonDatabaseHelper person = new PersonDatabaseHelper();
//   var info = await person.getPerson(email);

//   List<Person> listPerson = [];
//   info.forEach((element) {
//     Person personObj = Person.fromMapObject(element);
//     listPerson.add(personObj);
//   });

//   listPerson.forEach((element) {
//     name = element.fullName;
//     email = element.email;
//     gender = element.gender;
//     birthDate = element.birthDate;
//     phoneNumber = element.phoneNumber;
//   });
// }

  // getFullName() async {
  //   List<Person> personList = await getList(emailController.text.toString());
  //   return personList;
  // }

  // Future<String> getName() async {
  //   List<Person> personList = await getList(emailController.text.toString());
  //   personList.forEach((element) {
  //     name = element.fullName;
  //   });
  //   return name;
  // }

  // setName() async {
  //   name = await getName();
  // }

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
                              //controller: name,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline),
                                  hintText: name == null ? "Name" : name,
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 25.0, horizontal: 10.0)),
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () => node.nextFocus(),
                            ),
                            //SizedBox(height: 20),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Icon(
                                  Icons.bookmark_outline_outlined,
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  " Gender: ",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 16),
                                ),
                                Radio(
                                    value: Gender.Male,
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value;
                                      });
                                    }),
                                Text("Male",
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 16)),
                                Radio(
                                    value: Gender.Female,
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value;
                                      });
                                    }),
                                Text("Female",
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 16)),
                              ],
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: birthDate == null
                                      ? "Date of Birth"
                                      : birthDate,
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
                              //readOnly: true,
                              decoration: InputDecoration(
                                  hintText: email == null ? "Email" : email,
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
