import 'package:car_wash/auth/otp.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:car_wash/location.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class introductionPages extends StatefulWidget {
  const introductionPages({super.key});

  @override
  State<introductionPages> createState() => _introductionPagesState();
}

class _introductionPagesState extends State<introductionPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: width*1.9,
            width: width*1,
            child: IntroductionScreen(
              dotsDecorator: DotsDecorator(
                activeColor: colorPage.primaryColor,
                activeShape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(width*0.05),
                ),
                activeSize: Size(width*0.1, width*0.015)
              ),
              pages: [
                PageViewModel(
                  titleWidget:
                  Text("On site",style: TextStyle(
                    fontSize: width*0.08,
                    color: colorPage.primaryColor,
                    fontWeight: FontWeight.w800,
                  ),),
                  decoration: PageDecoration(
                    titlePadding: EdgeInsets.only(top: width*0.2,bottom: width*0.02),
                    bodyPadding: EdgeInsets.only(top: width*0.2),
                    bodyAlignment: Alignment.center,
                  ),
                  bodyWidget: Container(
                    height: width*1,
                    width: width*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(imagesPage.picone),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("You can  book  slot with location\nour service get your door step",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: width*0.05,
                              color: colorPage.primaryColor,
                            ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ),
                PageViewModel(
                    titleWidget:
                    Text("Self visit",style: TextStyle(
                      fontSize: width*0.08,
                      color: colorPage.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),),
                    decoration: PageDecoration(
                      titlePadding: EdgeInsets.only(top: width*0.2,bottom: width*0.02),
                      bodyPadding: EdgeInsets.only(top: width*0.2),
                      bodyAlignment: Alignment.center,
                    ),
                    bodyWidget: Container(
                      height: width*1,
                      width: width*1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(imagesPage.pictwo),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("You can book a slot and go at\nworkstation",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.05,
                                  color: colorPage.primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
                PageViewModel(
                    titleWidget:
                    Text("Pickup and drop",style: TextStyle(
                      fontSize: width*0.08,
                      color: colorPage.primaryColor,
                      fontWeight: FontWeight.w800,
                    ),),
                    decoration: PageDecoration(
                      titlePadding: EdgeInsets.only(top: width*0.2,bottom: width*0.02),
                      bodyPadding: EdgeInsets.only(top: width*0.2),
                      bodyAlignment: Alignment.center,
                    ),
                    bodyWidget: Container(
                      height: width*1,
                      width: width*1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(imagesPage.picthree),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("You can choose pickup &  Drop\nfacility",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: width*0.05,
                                  color: colorPage.primaryColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
              ],
              showDoneButton: true,
              showNextButton: false,
              showSkipButton: true,
              done: Text("Done",
              style: TextStyle(
                color: colorPage.primaryColor,
                fontSize: width*0.04,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: colorPage.primaryColor,
                decorationThickness: width*0.006,
                letterSpacing: width*0.003,
              ),),
              onDone: () async{
                SharedPreferences _pref=await SharedPreferences.getInstance();
                _pref.setBool("firstTime", true);

                Navigator.push(context, MaterialPageRoute(builder: (context) => location(),));
              },
              skip: Text("Skip",style: TextStyle(
                color: colorPage.primaryColor,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: colorPage.primaryColor,
                decorationThickness: width*0.006,
                letterSpacing: width*0.003,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
