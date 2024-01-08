import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Notification",
          style: TextStyle(
              color: colorPage.primaryColor,
              fontWeight: FontWeight.w700
          ),),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: width*0.01,
              width: width*0.01,
              padding: EdgeInsets.all(width*0.04),
              child: SvgPicture.asset(imagesPage.backarrow),
            )
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(left: width*0.04,right: width*0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today",
                  style: TextStyle(
                    fontSize: width*0.06,
                    fontWeight: FontWeight.w600,
                    color: colorPage.primaryColor,
                  ),
                ),
                Text("Clear all"
                  ,style: TextStyle(
                    color: colorPage.actreq,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: width*0.03,
          ),
          Dismissible(
            key: UniqueKey(),
            background: Padding(
              padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delete",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  Text("View",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),),
                ],
              ),
            ),
            child: Container(
              height: width*0.2,
              width: width*1,
              color: colorPage.backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(left: width*0.05),
                child: Text("The prowash of maruthi-6H had completed successfully",
                style: TextStyle(
                  color: colorPage.paragraph,
                  fontSize: width*0.05
                ),
                textAlign: TextAlign.start,),
              ),
            ),
          ),
          SizedBox(height: width*0.03,),
          Dismissible(
            key: UniqueKey(),
            background: Padding(
              padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delete",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  Text("View",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),),
                ],
              ),
            ),
            child: Container(
              height: width*0.2,
              width: width*1,
              color: colorPage.backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(left: width*0.05),
                child: Text("The prowash of maruthi-6H have some terrible",
                style: TextStyle(
                  color: colorPage.paragraph,
                  fontSize: width*0.05
                ),
                textAlign: TextAlign.start,),
              ),
            ),
          ),
          SizedBox(height: width*0.03,),
          Dismissible(
            key: UniqueKey(),
            background: Padding(
              padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delete",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  Text("View",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),),
                ],
              ),
            ),
            child: Container(
              height: width*0.2,
              width: width*1,
              color: colorPage.backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(left: width*0.05),
                child: Text("The prowash of maruthi-6H had completed successfully",
                style: TextStyle(
                  color: colorPage.paragraph,
                  fontSize: width*0.05
                ),
                textAlign: TextAlign.start,),
              ),
            ),
          ),

          Padding(
            padding:EdgeInsets.only(left: width*0.04,right: width*0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Yesterday",
                  style: TextStyle(
                    fontSize: width*0.06,
                    fontWeight: FontWeight.w600,
                    color: colorPage.primaryColor,
                  ),
                ),
                Text("Clear all"
                  ,style: TextStyle(
                    color: colorPage.actreq,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: width*0.03,
          ),
          Dismissible(
            key: UniqueKey(),
            background: Padding(
              padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delete",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("View",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),),
                ],
              ),
            ),
            child: Container(
              height: width*0.2,
              width: width*1,
              color: colorPage.backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(left: width*0.05),
                child: Text("The prowash of maruthi-6H had completed successfully",
                  style: TextStyle(
                      color: colorPage.paragraph,
                      fontSize: width*0.05
                  ),
                  textAlign: TextAlign.start,),
              ),
            ),
          ),
          SizedBox(
            height: width*0.03,
          ),
          Dismissible(
            key: UniqueKey(),
            background: Padding(
              padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delete",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("View",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),),
                ],
              ),
            ),
            child: Container(
              height: width*0.2,
              width: width*1,
              color: colorPage.backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(left: width*0.05),
                child: Text("The prowash of maruthi-6H had completed successfully",
                  style: TextStyle(
                      color: colorPage.paragraph,
                      fontSize: width*0.05
                  ),
                  textAlign: TextAlign.start,),
              ),
            ),
          ),
          SizedBox(
            height: width*0.03,
          ),
          Dismissible(
            key: UniqueKey(),
            background: Padding(
              padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delete",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text("View",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),),
                ],
              ),
            ),
            child: Container(
              height: width*0.2,
              width: width*1,
              color: colorPage.backgroundColor,
              child: Padding(
                padding: EdgeInsets.only(left: width*0.05),
                child: Text("The prowash of maruthi-6H had completed successfully",
                  style: TextStyle(
                      color: colorPage.paragraph,
                      fontSize: width*0.05
                  ),
                  textAlign: TextAlign.start,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
