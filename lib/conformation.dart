import 'package:car_wash/auth/payment.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/details.dart';
import 'package:car_wash/images_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';

class conformation extends StatefulWidget {
  const conformation({super.key});

  @override
  State<conformation> createState() => _conformationState();
}

class _conformationState extends State<conformation> {
  String button="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Conformation",
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
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Details",
              style: TextStyle(
                  fontSize: width*0.06,
                  color: colorPage.primaryColor,
                  fontWeight: FontWeight.w600
              ),),
            SizedBox(
              height: width*0.03,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => details(),));
              },
              child: Container(
                height: width*0.35,
                width: width*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(width*0.03),
                      height: width*0.3,
                      width: width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                      ),
                      child: Image.asset(imagesPage.car1,fit: BoxFit.fill,),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Prowash",
                          style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: width*0.05,
                          ),
                        ),
                        Text("NAVANEEY",
                          style: TextStyle(
                            color: colorPage.paragraph,
                            fontWeight: FontWeight.w600,
                          ),),
                        Text("Car-M5",
                          style: TextStyle(
                            color: colorPage.actreq,
                            fontSize: width*0.035,
                          ),
                        ),
                        Text("KL-53 SG 4357",
                          style: TextStyle(
                            color: colorPage.actreq,
                            fontSize: width*0.035,
                          ),
                        ),
                        Text("26/03/2022",
                          style: TextStyle(
                            color: colorPage.actreq,
                            fontSize: width*0.035,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: width*0.03,
            ),

            Text("Location",
              style: TextStyle(
                  fontSize: width*0.06,
                  color: colorPage.primaryColor,
                  fontWeight: FontWeight.w600
              ),),
            SizedBox(
              height: width*0.03,
            ),

            Center(
              child: Text("52, Race Course Rd, Racecourse, Gandhi Nagar,\nBengaluru, Karnataka 560001",
                style: TextStyle(
                    fontSize: width*0.04,
                    color: colorPage.paragraph,
                ),),
            ),

            SizedBox(
              height: width*0.03,
            ),
            Text("Payment method",
              style: TextStyle(
                  fontSize: width*0.06,
                  color: colorPage.primaryColor,
                  fontWeight: FontWeight.w600
              ),),

            SizedBox(
              height: width*0.03,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(width: width*0.03),
                Padding(
                  padding: EdgeInsets.only(left: width*0.03),
                  child: Text("Online payment",
                    style:TextStyle(
                      color: colorPage.paragraph,
                      fontSize: width*0.045
                    ),),
                ),
                RadioMenuButton(
                  child: Text(""),
                value: "online",
                    groupValue: button,
                    onChanged: (value) {
                        setState(() {
                          button=value!;
                        });
                    },
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(width: width*0.03),
                Padding(
                  padding: EdgeInsets.only(left: width*0.03),
                  child: Text("Cash on delivery",
                    style:TextStyle(
                        color: colorPage.paragraph,
                        fontSize: width*0.045
                    ),),
                ),
                RadioMenuButton(
                  child: Text(""),
                  value: "Cash",
                  groupValue: button,
                  onChanged: (value) {
                    setState(() {
                      button=value!;
                    });
                  },
                )
              ],
            ),

            SizedBox(
              height: width*0.1,
            ),

            Container(
              height: width*0.17,
              width: width*1,
              color: colorPage.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Price  :",style: TextStyle(
                    color: colorPage.secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: width*0.065
                  ),),
                  Text("\$-3600/-",
                    style: TextStyle(
                      color: colorPage.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: width*0.08,
                    ),),
                  SizedBox(
                    width: width*0.07,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: width*0.1,
            ),

            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: colorPage.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width*0.05),
                        topRight: Radius.circular(width*0.05),
                      )
                    ),
                    builder: (context) {
                      return Container(
                        height: width*0.7,
                        width: width*1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                    child: SvgPicture.asset(imagesPage.close)),
                                Text("Add your bank account",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: colorPage.primaryColor,
                                  fontSize: width*0.07,
                                ),)
                              ],
                            ),
                            Text("To book your service on Quick was you need\nto add a bank account",
                            style: TextStyle(
                              color: colorPage.btmsheet,
                              fontSize: width*0.04,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => payment(),));
                              },
                              child: Center(
                                child: Container(
                                  height: width*0.15,
                                  width: width*0.5,
                                  decoration: BoxDecoration(
                                    color: colorPage.primaryColor,
                                    borderRadius: BorderRadius.circular(width*0.1),
                                  ),
                                  child: Center(
                                    child: Text("Get started",style: TextStyle(
                                      color:colorPage.backgroundColor,
                                      fontSize: width*0.065,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                );
              },
              child: Center(
                child: Container(
                  height: width*0.15,
                  width: width*0.5,
                  decoration: BoxDecoration(
                    color: colorPage.primaryColor,
                    borderRadius: BorderRadius.circular(width*0.1),
                  ),
                  child: Center(
                    child: Text("Proceed",style: TextStyle(
                      color:colorPage.backgroundColor,
                      fontSize: width*0.065,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
