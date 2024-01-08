import 'package:car_wash/added_vehicles.dart';
import 'package:car_wash/auth/login_signup.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/edit_profile.dart';
import 'package:car_wash/images_page.dart';
import 'package:car_wash/take_a_slot_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  List profile=[
    {
      "leading": imagesPage.icon1,
      "title": "Recent order",
      "trailing": imagesPage.icon,
    },
    {
      "leading": imagesPage.icon2,
      "title": "Added vehicles",
      "trailing": imagesPage.icon,
    },
    {
      "leading": imagesPage.icon3,
      "title": "Payments",
      "trailing": imagesPage.icon,
    },
    {
      "leading": imagesPage.icon4,
      "title": "Active requests",
      "trailing": imagesPage.icon,
    }
  ];

  List profile2=[
    {
      "leading":imagesPage.icon5,
      "title":"FAQ",
      "trailing":imagesPage.icon,
    },
    {
      "leading":imagesPage.icon6,
      "title":"Share",
      "trailing":imagesPage.icon,
    },
    {
      "leading":imagesPage.icon7,
      "title":"Rate us",
      "trailing":imagesPage.icon,
    },
    {
      "leading":imagesPage.icon8,
      "title":"Log out",
      "trailing":imagesPage.icon,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Profile",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: width*0.07,
            color: colorPage.primaryColor,
          ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: width*0.5,
                width: width*1,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorPage.primaryColor,
                    width: width*0.005,
                  ),
                  borderRadius: BorderRadius.circular(width*0.01),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: width*0.35,
                      width: width*0.35,
                      child: CircleAvatar(
                        radius: 50,
                        // backgroundColor: colorPage.primaryColor,
                        // backgroundImage: currentUserImage==''?
                        // NetworkImage("https://e0.365dm.com/22/12/2048x1152/skysports-lionel-messi-argentina_6000508.jpg"):
                        // NetworkImage(currentUserImage),
                        
                        
                        backgroundImage: NetworkImage(currentUserImage),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: width*0.05,bottom: width*0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(currentUserName.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: width*0.05,
                            color: colorPage.primaryColor,
                          ),
                          ),
                          Text("${currentUserEmail.toString().substring(0,15)}***",
                          style: TextStyle(
                            color: colorPage.actreq,
                            fontSize: width*0.04,
                          ),
                          ),
                          Text(currentUserNumber.toString(),
                          style: TextStyle(
                            color: colorPage.actreq,
                            fontSize: width*0.04,
                          ),
                          ),

                          SizedBox(
                            height: width*0.03,
                          ),

                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => editprofile(
                                name: currentUserName.toString(), email: currentUserEmail.toString(), number: currentUserNumber.toString(), image:currentUserImage,
                              ),));
                            },
                            child: Container(
                              height: width*0.12,
                              width: width*0.4,
                              decoration: BoxDecoration(
                                color: colorPage.primaryColor,
                                borderRadius: BorderRadius.circular(width*0.1),
                              ),
                              child: Center(
                                child: Text("Edit profile",
                                  style: TextStyle(
                                    color: colorPage.backgroundColor,
                                    fontSize: width*0.04,
                                    fontWeight: FontWeight.w600,
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: width*0.03,
              ),
              Expanded(
                flex: 0,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: profile.length,
                    itemBuilder: (context, index) {
                    return InkWell(
                      onTap: index==profile.length-3?() async{
                        Navigator.push(context, MaterialPageRoute(builder:  (context) => viewAddedVehicles(),));
                      }:(){},

                      child: ListTile(
                        leading: SvgPicture.asset(profile[index]["leading"]),
                        title: Text(profile[index]["title"],
                          style: TextStyle(
                            color: colorPage.primaryColor,
                          ),),
                        trailing: SvgPicture.asset(profile[index]["trailing"]),
                      ),
                    );
                    },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: colorPage.actreq,
                    );
                  },
                ),
              ),
              Divider(
                color: colorPage.primaryColor,
                thickness: width*0.005,
              ),
              Expanded(
                flex: 0,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: profile2.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap:index==profile2.length-1? ()async{
                        SharedPreferences prefs=await SharedPreferences.getInstance();
                        // prefs.remove("loggedInPref");
                        // prefs.remove("username");
                        prefs.clear();
                        GoogleSignIn().signOut();

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => loginSighnup(),), (route) => false);

                      }:(){},
                      child: ListTile(
                        leading: SvgPicture.asset(profile2[index]["leading"]),
                        title: Text(profile2[index]["title"]),
                        trailing: SvgPicture.asset(profile2[index]["trailing"]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: colorPage.actreq,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
