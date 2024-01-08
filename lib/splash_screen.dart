import 'package:car_wash/auth/login_signup.dart';
import 'package:car_wash/bottom_nav1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:car_wash/introduction_pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  checkLoginStatus()async{
    SharedPreferences _prefs=await SharedPreferences.getInstance();

    loggedIn =_prefs.getBool('loggedInPref')??false;
    currentUserName = _prefs.getString('name')??'';
    firstTime=_prefs.getBool("firstTime")??false;
    currentUserEmail=_prefs.getString("email")??"";
    currentUserNumber=_prefs.getString("contact")??"";
    currentUserId=_prefs.getString("id")??"";
    currentUserImage=_prefs.getString("image")??"";

    Future.delayed(
        Duration(
          seconds: 5,
        )
    ).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
        loggedIn==false?
            firstTime? introductionPages():loginSighnup()
            :bottomNav1())));

  }
  @override
  void initState() {
    checkLoginStatus();
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(imagesPage.logo)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Quick Wash",style: TextStyle(
                fontWeight:FontWeight.w800,
                fontSize: width*0.12,
                color: colorPage.primaryColor,
              ),),
            ],
          )
        ],
      ),
    );
  }
}
