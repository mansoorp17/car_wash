import 'package:car_wash/booking.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/profile.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';

import 'main.dart';

class bottomNav1 extends StatefulWidget {
  const bottomNav1({super.key});

  @override
  State<bottomNav1> createState() => _bottomNav1State();
}

class _bottomNav1State extends State<bottomNav1> with TickerProviderStateMixin{
  MotionTabBarController? _motionTabBarController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 3,
      vsync: this,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }
  int selectIndex=0;
  List pages=[
    home(),
    booking(),
    profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectIndex],
      bottomNavigationBar: MotionTabBar(


        controller: _motionTabBarController,
          initialSelectedTab: "Home",
          labels:  ["Home","Booked","profile"],
        icons:  [Icons.home,Icons.check_circle_outline,Icons.person],

        tabSize: width*0.15,
        tabBarHeight: width*0.15,
        textStyle: TextStyle(
          fontSize: width*0.03,
          color: colorPage.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        tabIconColor: colorPage.actreq,
        tabIconSize: width*0.08,
        tabIconSelectedSize: width*0.1,
        tabSelectedColor: colorPage.primaryColor,
        tabIconSelectedColor: Colors.white,
        tabBarColor:  colorPage.backgroundColor,
        onTabItemSelected: (int value){
          setState(() {
            _motionTabBarController!.index=value;
            selectIndex = value;

          });
        },
      ),

    );
  }
}

