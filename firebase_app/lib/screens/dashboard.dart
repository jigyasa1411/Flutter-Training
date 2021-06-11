import 'package:firebase_app/helper/authentication.dart';
import 'package:firebase_app/models/user_model.dart';
import 'package:firebase_app/screens/loginPage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
 // const DashboardPage({ Key? key }) : super(key: key);
final UserModel userModel;
DashboardPage(this.userModel);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  SignInAndSignOutAuthentication auth = new SignInAndSignOutAuthentication();

  //Map userData = {};
  @override
  Widget build(BuildContext context) {
   //print(ModalRoute.of(context)!.settings.arguments);
 //userData = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      body: Center(
        child: Column(
              mainAxisAlignment:  MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("User Name: "+widget.userModel.userName.toString(),
                style: TextStyle(fontSize: 20, color: Colors.blue),),
                SizedBox(height:5),
    
                Text("Email Id: "+widget.userModel.email.toString(),
                style: TextStyle(fontSize: 20, color: Colors.blue),),
                SizedBox(height:5),

                Image.network(widget.userModel.imageUrl.toString()),
                SizedBox(height: 20,),
    
                TextButton(onPressed: ()async {
                  bool isLogged = await auth.SignOut();
                  if(!isLogged){
                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));

                  }
                }, child: Text("LogOut"))
              ],
            ),
      ),
        
    );
  }
}