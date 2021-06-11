import 'package:firebase_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInAndSignOutAuthentication{


// Sign Out function
Future<bool> SignOut() async{
  bool isLoggedOut = false; 
  FirebaseAuth _auth = FirebaseAuth.instance;
  if(!isLoggedOut)
  {
    _auth.signOut();
    print("Successfully logged out.");
  }
  return isLoggedOut;

}


// Facebook sign in function.
Future<UserModel?> facebookUserDetails() async{
  bool facebookLoggedIn = false;
      FirebaseAuth _auth = FirebaseAuth.instance;
  // by default we request the email and the public profile  
  // or FacebookAuth.i.login()
  final LoginResult account = await FacebookAuth.instance.login(); 

  // you are logged
    UserCredential result = await _auth.signInWithCredential(
          FacebookAuthProvider.credential(account.accessToken!.token));

    // Checking if user credentiaals are received or not.
    // If user credentials are found then return true else return false;
    if(result.user==null){
      facebookLoggedIn = false;
      // User credentials are null
    }
    // user credentials are not null.
    else
    {
      facebookLoggedIn = true;
      print("Facebook Email: "+result.user!.email.toString());
    }
  

      if(facebookLoggedIn)
      {
        UserModel userModelObj=UserModel();
      userModelObj.userName=result.user!.displayName.toString();
      userModelObj.email= result.user!.email.toString();
      userModelObj.imageUrl=result.user!.photoURL.toString();


      return userModelObj;
      }
      return null;

}

// Google Sign In function.
Future<UserModel?> googleUserDetails() async{
  bool googleLoggedIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
    
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? account = await googleSignIn.signIn();
      
      UserCredential result =
          await _auth.signInWithCredential(GoogleAuthProvider.credential(
        idToken: (await account!.authentication).idToken,
        accessToken: (await account.authentication).accessToken,
      ));


      if(result.user==null)
      {
        print("Error signing in.");
        googleLoggedIn = false;
      }

      else{
        print("Google Email: "+result.user!.email.toString());
        googleLoggedIn = true;
        
      }

  
       if(googleLoggedIn){
          UserModel userModelObj=UserModel();
        userModelObj.userName=result.user!.displayName.toString();
        userModelObj.email= result.user!.email.toString();
        userModelObj.imageUrl=result.user!.photoURL.toString();
        
      return userModelObj;
        }
        return null;

}


}

