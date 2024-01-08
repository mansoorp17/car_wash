import 'package:car_wash/auth/sign_up.dart';
import 'package:car_wash/bottom_nav1.dart';
import 'package:car_wash/color_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'google_sign.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController username_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(width*0.04),
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
                      Text("Welcome back",
                        style: TextStyle(
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: width*0.1,
                      ),),
                      Text("Please login into your account",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontSize: width*0.06,
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      TextFormField(
                        controller: username_controller,
                        textInputAction: TextInputAction.done,

                        decoration: InputDecoration(
                          labelText:"User name",
                          labelStyle: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primaryColor,
                          ),
                          hintText:"username",
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

                      SizedBox(
                        height: width*0.06,
                      ),

                      TextFormField(
                        controller: password_controller,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,

                        decoration: InputDecoration(
                          labelText:"Password",
                          labelStyle: TextStyle(
                            fontSize: width*0.04,
                            fontWeight: FontWeight.w600,
                            color: colorPage.primaryColor,
                          ),
                          hintText:"password",
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
                      SizedBox(
                        height: width*0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: width*0.05,
                                width: width*0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorPage.primaryColor,width: width*0.009,
                                  )
                                ),
                              ),
                              Text("Remember me",style: TextStyle(
                                color: colorPage.primaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: width*0.04,
                              ),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Forget password?",style: TextStyle(
                                color: colorPage.primaryColor,
                                fontSize: width*0.04,
                                fontWeight: FontWeight.w500
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () async{

                          currentUserName=username_controller.text;
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottomNav1(),));


                          QuerySnapshot userData=await FirebaseFirestore.instance.collection("users")
                              .where('email',isEqualTo: username_controller.text.trim())
                              .get();

                          if(userData.docs.isNotEmpty) {
                            if (userData.docs[0]['password'] == password_controller.text) {
                              currentUserName = userData.docs[0]['name'];
                              currentUserNumber = userData.docs[0]['number'];
                              currentUserEmail = userData.docs[0]['email'];
                              currentUserPassword = userData.docs[0]['password'];
                              currentUserImage = userData.docs[0]['image'];
                              currentUserId=userData.docs[0].id;
                              // current user id

                              SharedPreferences _prefs=await SharedPreferences.getInstance();
                              _prefs.setBool('loggedInPref', true);

                              _prefs.setString('username', username_controller.text);
                              _prefs.setString('password', password_controller.text);
                              _prefs.setString('number', currentUserNumber);
                              _prefs.setString('name', currentUserName);
                              _prefs.setString('email', currentUserEmail);
                              _prefs.setString('image', currentUserImage);
                              _prefs.setString('id', currentUserId);

                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                    builder: (context) => bottomNav1(),), (
                                      route) => false);
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Wrong Password")
                                  )
                              );
                            }
                          }
                          else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("User Not Found Please SignUp")
                                  )
                              );
                            }
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
                      SizedBox(height: width*0.3,),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => signUp(
                              gSign: false,
                              email: '',
                              image: '',
                              name:'',
                          ),));
                        },
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: colorPage.textBox,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign up",
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
