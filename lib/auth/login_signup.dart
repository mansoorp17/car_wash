import 'package:car_wash/auth/login.dart';
import 'package:car_wash/auth/sign_up.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'google_sign.dart';

class loginSighnup extends StatefulWidget {
  const loginSighnup({super.key});

  @override
  State<loginSighnup> createState() => _loginSighnupState();
}

class _loginSighnupState extends State<loginSighnup> {

  AuthService authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: width*0.5,
                        width: width*0.9,
                        // color: Colors.yellowAccent,
                        child: Image(image: AssetImage(imagesPage.carman))
                    ),
                    SizedBox(
                      height: width*0.04,
                    ),
                    Text("Here's where\nwe shine",style: TextStyle(
                      fontSize: width*0.1,
                      fontWeight: FontWeight.w800,
                      color: colorPage.primaryColor,
                    ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: width*0.04,
                    ),
                    Text("Book your easy\nbe the shiny rock star on the road",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: width*0.055,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: width*0.04,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
                      },
                      child: Container(
                        height: width*0.15,
                        width: width*0.5,
                        decoration: BoxDecoration(
                          color: colorPage.primaryColor,
                          borderRadius: BorderRadius.circular(width*0.1),
                        ),
                        child: Center(
                          child: Text("Login",style: TextStyle(
                            color:colorPage.backgroundColor,
                            fontSize: width*0.065,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        ),
                      ),
                    ),
                    Text("or"),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signUp(
                            gSign: false,
                            email: '',
                            image: '',
                            name:'',
                        ),));
                      },
                      child: Container(
                        height: width*0.15,
                        width: width*0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorPage.primaryColor),
                          color: colorPage.backgroundColor,
                          borderRadius: BorderRadius.circular(width*0.1),
                        ),
                        child: Center(
                          child: Text("Sign up",style: TextStyle(
                            color:colorPage.primaryColor,
                            fontSize: width*0.065,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        ),
                      ),
                    ),

                    Text("or"),
                    InkWell(
                      onTap: () {
                        authService.hangleSignIn(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signUp(
                            gSign: false,
                            email: '',
                            image: '',
                            name:'',
                        ),));
                      },
                      child: Container(
                        height: width*0.15,
                        width: width*0.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorPage.backgroundColor),
                          color: colorPage.primaryColor,
                          borderRadius: BorderRadius.circular(width*0.1),
                        ),
                        child: Center(
                          child: Text("G Sign",style: TextStyle(
                            color:colorPage.backgroundColor,
                            fontSize: width*0.065,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
