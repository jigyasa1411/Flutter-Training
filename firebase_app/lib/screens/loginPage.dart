

import 'package:firebase_app/helper/authentication.dart';
import 'package:firebase_app/helper/validationFunctions.dart';
import 'package:firebase_app/models/user_model.dart';
import 'package:firebase_app/screens/dashboard.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SignInAndSignOutAuthentication auth = new SignInAndSignOutAuthentication();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child:
        Form(
            key: _formKey,
            child:Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [
                      Color.fromRGBO(60, 155, 237, 1),
                      Color.fromRGBO(32, 137, 229, 1),
                      Color.fromRGBO(100, 181, 246, 1),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Image.asset("assets/successive_Logo.png",
                          height: 150, width: 300),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 90.0),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 7.0,
                                    blurRadius: 5.0,
                                    color: Color.fromRGBO(205, 219, 254, 1)
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
                                          width: 1.0, color: Colors.grey.shade300),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 10.0),
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                    validator: (value) {
                                      return validateEmail(value!);
                                    },
                                    textInputAction: TextInputAction.next,
                                    onEditingComplete: () => node.nextFocus(),
                                  ),
                                ),
                                Container(
                                  //padding: EdgeInsets.only(left: 20, right: 20),
                                  child: TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 10.0),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                    validator: (value) {
                                      return validatePassword(value!);
                                    },
                                    onEditingComplete: () => node.unfocus(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Container(
                            width: 370,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 3.0,
                                  blurRadius: 5.0,
                                  color: Color.fromRGBO(204, 205, 206, 1)
                                      .withOpacity(0.5),
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: () async{
                                if(_formKey.currentState!.validate())
                                print("Validated");
                                print("Credentials doesn't exists. Sign Up with above credentials.");
                              },
                              
                        
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color.fromRGBO(100, 181, 246, 1)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0),
                                  ))),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            child: Text(
                              'Continue with social media',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: ()async{
                                  
                                    UserModel userData = UserModel();
                                  userData =  (await auth.facebookUserDetails())!;
                                  if(userData.toString().isEmpty)
                                  {
                                    print("Error logging in");
                                  }
                                  else{
                                  
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashboardPage(userData)));
                                  }
                                  
                                  

                                },
                                child: Image.asset(
                                  'assets/fb.png',
                                  height: 70,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              TextButton(
                                onPressed: ()async{
                                  UserModel userData = UserModel();
                                  userData =  (await auth.googleUserDetails())!;
                                  if(userData.toString().isEmpty)
                                  {
                                    print("Error logging in");
                                  }
                                  else{
                                  
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DashboardPage(userData)));
                                  }
                                  },
                                
                                child: Image.asset(
                                  'assets/google.png',
                                  height: 60,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " Don't have an Account?",
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {},
                                  
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            //)
            )
            
      ),
    );
  }
}
