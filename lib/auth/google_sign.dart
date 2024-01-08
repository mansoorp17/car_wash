import 'package:car_wash/auth/sign_up.dart';
import 'package:car_wash/bottom_nav1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';

class AuthService{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn=GoogleSignIn();

  Future<void> hangleSignIn(BuildContext context)
  async{
    try{
      GoogleSignInAccount? googleUser=await _googleSignIn.signIn();
      if(googleUser!=null)
        {
          GoogleSignInAuthentication googleAuth=await googleUser.authentication;
          AuthCredential credential=GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
        );
          var userData=await _auth.signInWithCredential(credential);
          User? user=userData.user;

          QuerySnapshot userData1=await FirebaseFirestore.instance.collection('users')
            .where('email',isEqualTo: userData.user!.email)
            .get();

          if(userData1.docs.isNotEmpty)
            {
                currentUserName=userData1.docs[0]['name'];
                currentUserEmail=userData1.docs[0]['email'];
                currentUserImage=userData1.docs[0]['image'];
                currentUserId=userData1.docs[0].id;
                currentUserNumber=userData1.docs[0]['number'];

                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => bottomNav1(),), (route) => false);
            }

          else{
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => signUp(gSign: true,
                image: user!.photoURL!,
                name: user.displayName!,
                email: user.email!,
        ),), (route) => true);
        }
        }
    }
    catch(error)
    {
      print("Error sign in with google $error");
    }
  }
}