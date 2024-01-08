import 'package:car_wash/auth/login.dart';
import 'package:car_wash/bottom_nav1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/introduction_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../main.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.all(width*0.04),
        child: SingleChildScrollView(
          child: Container(
            height: width*1.9,
            width: width*1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: width*0.05,
                ),
                Column(
                  children: [
                    Text("welcome",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: width*0.1,
                      ),),
                    Text("Please enter your OTP",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontSize: width*0.05,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                Pinput(
                   length: 6,
                ),

                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => bottomNav1(),));
                      },
                      child: Container(
                        height: width*0.15,
                        width: width*0.5,
                        decoration: BoxDecoration(
                          color: colorPage.primaryColor,
                          borderRadius: BorderRadius.circular(width*0.1),
                        ),
                        child: Center(
                          child: Text("Continue",style: TextStyle(
                            color:colorPage.backgroundColor,
                            fontSize: width*0.065,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: width*0.3,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              color: colorPage.textBox,
                            ),
                            children: [
                              TextSpan(
                                  text: "Sign in",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: colorPage.primaryColor,
                                  )
                              )
                            ]
                        ),

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
