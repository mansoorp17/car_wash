import 'package:car_wash/auth/login_signup.dart';
import 'package:car_wash/bottom_nav1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/images_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: Column(
          children: [
            Container(
              height: width*1.9,
              width: width*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("We want your\nlocation",
                  style: TextStyle(
                    fontSize: width*0.1,
                    fontWeight: FontWeight.w800,
                    color: colorPage.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                  ),
                  Container(
                    height: width*0.5,
                    width: width*0.9,
                    child: Image.asset(imagesPage.picfour),
                  ),
                  Text("We make yours shine, enable your\nlocation to make it easy",style: TextStyle(
                    color: colorPage.primaryColor,
                    fontSize: width*0.06,
                  ),
                  textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(width*0.05),
                              topRight: Radius.circular(width*0.05),
                            ),
                          ),
                          builder: (context) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Container(
                                height: width*0.5,
                                width: width*1,
                                child: Lottie.asset(imagesPage.verified),
                              ),
                                Container(
                                  child: Text("Location saved",
                                    style: GoogleFonts.poppins(
                                      color: colorPage.primaryColor,
                                      fontSize: width*0.09,
                                      fontWeight: FontWeight.w700,
                                    )),
                                ),

                              ],
                            );
                          }
                      );
                    },
                    child: Container(
                      height: width*0.15,
                      width: width*0.5,
                      decoration: BoxDecoration(
                        color: colorPage.primaryColor,
                        borderRadius: BorderRadius.circular(width*0.1),
                      ),
                      child: Center(
                        child: Text("Enable",style: TextStyle(
                          color:colorPage.backgroundColor,
                          fontSize: width*0.065,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => loginSighnup(),));
                    },
                    child: Container(
                      height: width*0.15,
                      width: width*0.5,
                      decoration: BoxDecoration(
                        color: colorPage.backgroundColor,
                        borderRadius: BorderRadius.circular(width*0.1),
                      ),
                      child: Center(
                        child: Text("Skip",
                        style: TextStyle(
                          color: colorPage.primaryColor,
                          fontSize: width*0.065,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
