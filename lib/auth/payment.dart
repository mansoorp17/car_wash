import 'package:car_wash/bottom_nav1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/images_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/flipcard/gesture_flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  TextEditingController cardholder_controller=TextEditingController();
  TextEditingController cardnumber_controller=TextEditingController();
  TextEditingController validthru_controller=TextEditingController();
  TextEditingController cvv_controller=TextEditingController();

  GestureFlipCardController flipCardController=GestureFlipCardController();

  bool check=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Payment",
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                GestureFlipCard(
                  enableController: true,
                  controller: flipCardController,
                  frontWidget: Container(
                    padding: EdgeInsets.only(left: width*0.08),
                    height: width*0.6,
                    width: width*0.92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.05),
                      gradient: LinearGradient(
                          colors: [
                            colorPage.gredient1,
                            colorPage.gredient2,
                          ]
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: width*0.12,
                                width: width*0.35,
                                child: Image.asset(imagesPage.rupay)
                            ),
                          ],
                        ),
                        SizedBox(
                          height: width*0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Card Number",
                              style: GoogleFonts.montserrat(
                                color: colorPage.backgroundColor,
                                fontWeight: FontWeight.w500,
                              ),),
                            Text(
                              cardnumber_controller.text==''?
                              "**** **** ** ****":
                              cardnumber_controller.text
                              ,
                              style: GoogleFonts.poppins(
                                  color: colorPage.backgroundColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: width*0.045
                              ),),

                            SizedBox(
                              height: width*0.08,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Cardholder name",
                                      style: GoogleFonts.montserrat(
                                        color: colorPage.backgroundColor,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    Text(cardholder_controller.text==''?"name": cardholder_controller.text,
                                      style: GoogleFonts.poppins(
                                          color: colorPage.backgroundColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.045
                                      ),),
                                  ],
                                ),
                                SizedBox(
                                  width: width*0.2,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Exp",
                                      style: GoogleFonts.montserrat(
                                        color: colorPage.backgroundColor,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                    Text(validthru_controller.text==''?"**/**":validthru_controller.text,
                                      style: GoogleFonts.poppins(
                                          color: colorPage.backgroundColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: width*0.045
                                      ),),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  backWidget: Container(
                    height: width*0.6,
                    width: width*0.92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.05),
                      gradient: LinearGradient(
                          colors: [
                            colorPage.gredient1,
                            colorPage.gredient2,
                          ]
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: width*0.05,
                        ),
                        Container(
                          height: width*0.15,
                          width: width*1,
                          color: colorPage.secondaryColor,
                        ),
                        SizedBox(
                          height: width*0.05,
                        ),

                        Row(
                          children: [
                            Container(
                              height: width*0.12,
                              width: width*0.65,
                              color: colorPage.checkbox,
                            ),
                            Container(
                              height: width*0.08,
                              width: width*0.27,
                              color: colorPage.backgroundColor,
                              child: Text(cvv_controller.text==''?"***":cvv_controller.text,
                              style: TextStyle(
                                color: colorPage.secondaryColor,
                                fontSize: width*0.05,
                                fontWeight: FontWeight.w500,
                              ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: width*0.05,),
                TextFormField(
                  controller: cardholder_controller,
                  textInputAction: TextInputAction.done,

                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  decoration: InputDecoration(
                    labelText:"Cardholder name",
                    labelStyle: TextStyle(
                      fontSize: width*0.04,
                      color: colorPage.primaryColor,
                    ),
                    hintText:"Cardholder name",
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
                  controller: cardnumber_controller,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {

                    });
                  },
                  maxLength: 16,

                  decoration: InputDecoration(
                    labelText:"Card number",
                    labelStyle: TextStyle(
                      fontSize: width*0.04,
                      color: colorPage.primaryColor,
                    ),
                    hintText:"Card number",
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
                  height: width*0.04,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: width*0.2,
                      width: width*0.43,
                      child: TextFormField(
                        controller: validthru_controller,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        maxLength: 5,
                        onChanged: (value) {
                          setState(() {

                          });
                        },

                        decoration: InputDecoration(
                          labelText:"Valid thru",
                          labelStyle: TextStyle(
                            fontSize: width*0.04,
                            color: colorPage.primaryColor,
                          ),
                          hintText:"Valid thru",
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
                    ),

                    SizedBox(
                      height: width*0.2,
                      width: width*0.43,
                      child: TextFormField(
                        controller: cvv_controller,
                        onTap: () {
                          flipCardController.flipcard();
                          setState(() {

                          });
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        maxLength: 3,

                        decoration: InputDecoration(
                          labelText:"CVV",
                          labelStyle: TextStyle(
                            fontSize: width*0.04,
                            color: colorPage.primaryColor,
                          ),
                          hintText:"CVV",
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
                    ),
                  ],
                ),
                SizedBox(
                  height: width*0.03,
                ),

                Row(
                  children: [
                    Checkbox(
                      side: BorderSide(
                          color: colorPage.primaryColor,
                          width: width*0.005
                      ),
                      value: check,
                      onChanged: (value) {
                        check=value!;
                        setState(() {

                        });
                      },
                    ),
                    Text("Set as default card",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                      ),),
                  ],
                ),

                SizedBox(
                  height: width*0.1,
                ),

                InkWell(
                  onTap: () {
                    if(cardholder_controller.text.isEmpty||cardnumber_controller.text.isEmpty||validthru_controller.text.isEmpty||cvv_controller.text.isEmpty)
                      {
                        if(cardholder_controller.text.isEmpty)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter cardholder name")));
                          }
                        else if(cardnumber_controller.text.isEmpty)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter card number")));
                          }
                        else if(validthru_controller.text.isEmpty)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please eneter valid thru")));
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter cvv")));
                          }
                      }
                    else
                      {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: colorPage.backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(width*0.05),
                                topRight: Radius.circular(width*0.05),
                              ),
                            ),
                            builder: (context) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: width*0.5,
                                    width: width*1,
                                    child: Lottie.asset(imagesPage.verified),
                                  ),
                                  Column(
                                    children: [
                                      Text("Payment successfull",
                                          style: GoogleFonts.poppins(
                                            color: colorPage.primaryColor,
                                            fontSize: width*0.07,
                                            fontWeight: FontWeight.w700,
                                          )
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Booking ID",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w300,
                                              fontSize: width*0.04,
                                            ),
                                          ),
                                          Text("- #24352",
                                              style: GoogleFonts.poppins(
                                                color: colorPage.primaryColor,
                                                fontSize: width*0.05,
                                                fontWeight: FontWeight.w700,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  ),

                                ],
                              );
                            }
                        );
                        Future.delayed(
                            Duration(
                              seconds: 5,
                            )
                        ).then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => bottomNav1(),),(route) => false,));
                      }
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
                  child: Text("Confirm",style: TextStyle(
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
        ),
      ),
    );
  }
}
