import 'dart:io';

import 'package:car_wash/auth/contact_number.dart';
import 'package:car_wash/auth/login.dart';
import 'package:car_wash/auth/userModel.dart';
import 'package:car_wash/bottom_nav1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/home.dart';
import 'package:car_wash/images_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class signUp extends StatefulWidget {
  final bool gSign;
  final String name;
  final String email;
  final String image;


  const signUp({super.key, required this.gSign, required this.name, required this.email, required this.image,});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  TextEditingController name_controller=TextEditingController();
  TextEditingController number_controller=TextEditingController();
  TextEditingController email_controller=TextEditingController();
  TextEditingController password_controller=TextEditingController();

  File? file;
  String imageUrl='';
  String image="https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";

  pickFile(ImageSource)
  async {
    final imageFile = await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(imageFile!.path);
    if (mounted) {
      setState(() {
        file = File(imageFile.path);
        fileUpload();
      });
      Navigator.pop(context);
    }
  }

    fileUpload()
    async{
      if(file!=null)
        {
          String uniqueValue=DateTime.now().toString();

          var uploadImage=await FirebaseStorage.instance.ref().child('image/$uniqueValue').putFile(file!);

          var getUrl=await uploadImage.ref.getDownloadURL();

          imageUrl=getUrl;

          setState(() {

          });
        }
    }

  @override
  void initState() {
    if(widget.gSign==true)
    {
      image =widget.image;
      name_controller.text=widget.name;
      email_controller.text=widget.email;
    }
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width*0.04),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            // height: height*1,
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
                    Text("Welcome",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: width*0.1,
                      ),),
                    Text("Please create a new account",
                      style: TextStyle(
                        color: colorPage.primaryColor,
                        fontSize: width*0.06,
                        fontWeight: FontWeight.w400,
                      ),),
                  ],
                ),
                Stack(
                  children: [
                    imageUrl==''? Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(image),
                        radius: width*0.2,
                      ),
                    ):Center(
                      child: CircleAvatar(
                          backgroundImage:NetworkImage(imageUrl),
                          radius: width*0.2
                      ),
                    ),
                    Positioned(
                      right: width*0.25,
                      bottom: width*0.0,
                      child: InkWell(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                              actions: [
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    pickFile(ImageSource.gallery);
                                  },
                                  child: Text("Photo Gallery"),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    pickFile(ImageSource.camera);
                                  },
                                  child: Text("Camera"),
                                ),
                                CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                  isDestructiveAction: true,
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(imagesPage.editPicture),
                          radius: width*0.05,
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: width*0.05,
                ),

                Column(
                  children: [
                    TextFormField(
                      controller: name_controller,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText:"Your name",
                        labelStyle: TextStyle(
                          fontSize: width*0.04,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        ),
                        hintText:"name",
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
                      height: width*0.05,
                    ),

                    TextFormField(
                      controller: number_controller,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText:"Contact number",
                        labelStyle: TextStyle(
                          fontSize: width*0.04,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        ),
                        hintText:"number",
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
                      height: width*0.05,
                    ),


                    TextFormField(
                      controller: email_controller,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,

                      decoration: InputDecoration(
                        labelText:"Email",
                        labelStyle: TextStyle(
                          fontSize: width*0.04,
                          fontWeight: FontWeight.w600,
                          color: colorPage.primaryColor,
                        ),
                        hintText:"Email",
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
                      obscureText: true,
                      maxLength: 8,

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
              ],
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () async{

                        SharedPreferences _prefs=await SharedPreferences.getInstance();
                        _prefs.setString("email", email_controller.text);

                        // currentUserImage=imageUrl;
                        // currentUserName=name_controller.text;
                        // currentUserNumber=number_controller.text;
                        // currentUserEmail=email_controller.text;
                        // currentUserPassword=password_controller.text;

                        Map<String,dynamic>data=userModel(
                            name: name_controller.text.trim(),
                            email: email_controller.text.trim(),
                            number: number_controller.text.trim(),
                            password: password_controller.text.trim(),
                            createdTime: DateTime.now(),
                            image: image,
                            vehicles: []
                        ).toJson();
                        // Map<String,dynamic>data={
                        //   "name":name_controller.text.trim(),
                        //   "number":number_controller.text.trim(),
                        //   "email":email_controller.text.trim(),
                        //   "password":password_controller.text.trim(),
                        //   "createdTime":FieldValue.serverTimestamp(),
                        //   "image":image,
                        // };

                        // Navigator.push(context, MaterialPageRoute(builder: (context) => contactNumber(),));


                        if(name_controller.text=='')
                          {
                              return showUploadMessage(context, "Name");
                          }
                        else if(number_controller.text=='') {
                          return showUploadMessage(context, "Number");
                        }
                        else if(email_controller.text=='')
                        {
                          return showUploadMessage(context, "Email");
                        }
                        else if(password_controller.text=='')
                        {
                          return showUploadMessage(context, "Password");
                        }

                        else
                          {
                            //There check the email_controller already have the database exist or not if yes it get then store to getEmail
                            QuerySnapshot getEmail=await FirebaseFirestore.instance.collection("users")
                            .where('email',isEqualTo: email_controller.text)
                            .get();

                            //There check the number_controller already have the database exist or not if yes it get then store to getEmail
                            QuerySnapshot getPhone=await FirebaseFirestore.instance.collection("users")
                            .where('number',isEqualTo:number_controller.text)
                            .get();

                            //getEmail(same email)enter user textform field then show snackbar
                            if(getEmail.docs.isNotEmpty)
                              {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Email Already Exist"))
                                  );
                                  return;
                              }

                            //getNumber(same number)enter user textform field then show snackbar
                            else if(getPhone.docs.isNotEmpty)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("NUmber Already Exist"))
                                );
                                return;
                              }
                            // else {
                            //   Map<String, dynamic>data = {
                            //     "name": name_controller.text,
                            //     "number": number_controller.text,
                            //     "email": email_controller.text,
                            //     "password": password_controller.text,
                            //     "createdTime": FieldValue.serverTimestamp(),
                            //     "image": imageUrl,
                            //   };
                            //   FirebaseFirestore.instance.collection('users')
                            //       .add(data)
                            //       .then((value) =>
                            //       value.update(
                            //           {
                            //             "id": value.id
                            //           }
                            //       )).then((value) =>
                            //   // Navigator.push(context, MaterialPageRoute(builder: (context) => bottomNav1(),))
                            //   Navigator.pushAndRemoveUntil(context,
                            //       MaterialPageRoute(
                            //         builder: (context) => bottomNav1(),), (
                            //           route) => false)
                            //   );
                            // }
                            FirebaseFirestore.instance.collection('users').add(data).then((value) => value.update(
                                {
                                  "id":value.id
                                })).then((value) =>
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login(),), (route) => false));
                        if(widget.gSign==true)
                              {
                                Map<String,dynamic>data=userModel(
                                    name: name_controller.text.trim(),
                                    email: email_controller.text.trim(),
                                    number: number_controller.text.trim(),
                                    password: password_controller.text.trim(),
                                    createdTime: DateTime.now(),
                                    image: image,
                                    vehicles: []
                                ).toJson();
                                // Map<String,dynamic>data={
                                //   "name":name_controller.text.trim(),
                                //   "number":number_controller.text.trim(),
                                //   "email":email_controller.text.trim(),
                                //   "password":password_controller.text.trim(),
                                //   "createdTime":FieldValue.serverTimestamp(),
                                //   "image":image,
                                //
                                // };

                                FirebaseFirestore.instance.collection('users').add(data).then((value) => value.update(
                                    {
                                      "id":value.id
                                    })).then((value) =>
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login(),), (route) => false));
                                return;

                              }
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
                          child: Text("Next",style: TextStyle(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              color: colorPage.textBox,
                            ),
                            children: [
                              TextSpan(
                                  text: "Sign in",
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
