import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Order Details",
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
            Container(
              height: width*0.5,
              width: width*1,
              child: Image.asset(imagesPage.cardetails),
            ),
            SizedBox(
              height: width*0.02,
            ),
            Text("Vehicle",
              style: TextStyle(
                fontSize: width*0.06,
                fontWeight: FontWeight.w600,
                color: colorPage.primaryColor,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Vehicle",style: TextStyle(
                        fontSize: width*0.04,
                        color: colorPage.paragraph
                      ),),
                    ),
                    Text(": Car",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Model",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": M5",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Reg.number",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": KL-53 SG 4357",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Client",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": Navaneey",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Phone",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": +624 76597 26",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
              ],
            ),
            SizedBox(
              height: width*0.02,
            ),

            Text("Service details",
              style: TextStyle(
                fontSize: width*0.06,
                fontWeight: FontWeight.w600,
                color: colorPage.primaryColor,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("service",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": Prowash",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
              ],
            ),
            SizedBox(
              height: width*0.02,
            ),
            Text("Slot date",
              style: TextStyle(
                fontSize: width*0.06,
                fontWeight: FontWeight.w600,
                color: colorPage.primaryColor,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Date",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": 26/03/22",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Time",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": 09:00am",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
              ],
            ),

            SizedBox(height: width*0.02,),
            Text("Payment details",
              style: TextStyle(
                fontSize: width*0.06,
                fontWeight: FontWeight.w600,
                color: colorPage.primaryColor,
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Payment method",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": Online payment",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: width*0.05,),
                    SizedBox(
                      width: width*0.45,
                      child: Text("Payment status",style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),),
                    ),
                    Text(": Payment completed",
                      style: TextStyle(
                          fontSize: width*0.04,
                          color: colorPage.paragraph
                      ),)
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
