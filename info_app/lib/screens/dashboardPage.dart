import 'package:flutter/material.dart';
import 'package:info_app/helper/authenticationFunctions.dart';
import 'package:info_app/screens/galleryPage.dart';
import 'package:info_app/screens/loginPage.dart';
import 'package:info_app/screens/profilePage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child:
              Image.asset("assets/successiveLogo.png", height: 150, width: 150),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(60, 155, 237, 1),
                    Color.fromRGBO(32, 137, 229, 1),
                    Color.fromRGBO(100, 181, 246, 1),
                  ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Center(
                        child: Text(name[0].toUpperCase(),
                            style: TextStyle(color: Colors.red, fontSize: 40)),
                      ),
                      height: 90,
                      width: 90,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),

                    // printing Name
                    SizedBox(height: 10),
                    Text(name == null ? "Default" : name,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),

                    Text(email1 == null ? "Email not found" : email1,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold))
                  ],
                ),
              ),

              // Buttons

              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: Row(children: [
                    // Profile

                    Icon(
                      Icons.people_outline,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_right, color: Colors.black),
                  ])),

              //Change Password
              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Change Password",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right, color: Colors.black),
                    ],
                  )),

              // Gallery

              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GalleryPage()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.image_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right, color: Colors.black),
                    ],
                  )),

              // Settings

              TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Settings",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right, color: Colors.black),
                    ],
                  )),

              Spacer(),

              // Sign Out
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.logoutVariant,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.normal),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right, color: Colors.black),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
