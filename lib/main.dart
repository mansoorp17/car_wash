import 'package:car_wash/auth/login_signup.dart';
import 'package:car_wash/auth/payment.dart';
import 'package:car_wash/bottom_nav1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/conformation.dart';
import 'package:car_wash/custom_wash.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/location.dart';
import 'package:car_wash/power_wash.dart';
import 'package:car_wash/pro_wash.dart';
import 'package:car_wash/quickWash.dart';
import 'package:car_wash/splash_screen.dart';
import 'package:car_wash/take_a_slot_1.dart';
import 'package:car_wash/take_a_slot_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

bool loggedIn=false;

bool firstTime=false;

var width;
var height;
var currentUserImage;
var currentUserName;
var currentUserEmail;
var currentUserNumber;
var currentUserPassword;
var currentUserId;

Future<void> main()
async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    width= MediaQuery.of(context).size.width;
    height= MediaQuery.of(context).size.height;


    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.muktaVaaniTextTheme(),
          radioTheme: RadioThemeData(fillColor: MaterialStatePropertyAll(colorPage.primaryColor)),
        ),
        debugShowCheckedModeBanner: false,
        home: splashScreen(),
      ),
    );
  }
}
