import 'package:car_wash/auth/login.dart';
import 'package:car_wash/auth/otp.dart';
import 'package:car_wash/color_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class contactNumber extends StatefulWidget {
  const contactNumber({super.key});

  @override
  State<contactNumber> createState() => _contactNumberState();
}

class _contactNumberState extends State<contactNumber> {
  TextEditingController number_controller=TextEditingController();
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
                      Text("Please enter your contact number\nwe will sent a OTP",
                        style: TextStyle(
                          color: colorPage.primaryColor,
                          fontSize: width*0.05,
                          fontWeight: FontWeight.w400,
                        ),
                      textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextFormField(
                        controller: number_controller,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          labelText:"Contact number",
                          labelStyle: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primaryColor,
                          ),
                          hintText:"number",
                          hintStyle: TextStyle(
                            fontSize: width*0.04,
                            color: colorPage.textBox,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.03),
                            borderSide: BorderSide(
                              color: colorPage.primaryColor,
                            ),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.03),
                            borderSide: BorderSide(
                              color: colorPage.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () async{
                          SharedPreferences _prefs=await SharedPreferences.getInstance();
                          _prefs.setString("contact", number_controller.text);

                          currentUserNumber=number_controller.text;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => otp(),));
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
