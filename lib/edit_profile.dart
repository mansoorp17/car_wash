import 'dart:io';

import 'package:car_wash/bottom_nav1.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class editprofile extends StatefulWidget {
  final String name;
  final String email;
  final String number;
  final String image;

  const editprofile({super.key, required this.name, required this.email, required this.number, required this.image});

  @override
  State<editprofile> createState() => _editprofileState();
}

class _editprofileState extends State<editprofile> {
  TextEditingController name_controller=TextEditingController();
  TextEditingController number_controller=TextEditingController();

  // var file;
  // pickFile(ImageSource)
  // async {
  //   final imageFile=await ImagePicker.platform.pickImage(source: ImageSource);
  //   file=File(imageFile!.path);
  //   if(mounted)
  //   {
  //     setState(() {
  //       file=File(imageFile.path);
  //     });
  //   }
  // }
  File? file;
  String imageUrl='';
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
      loading=false;

      setState(() {

      });
    }
  }

  bool loading=false;

  @override
  void initState() {
    name_controller.text=widget.name;
    number_controller.text=widget.number;// TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Edit profile",
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

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: width*0.03,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(width*0.03),topRight: Radius.circular(width*0.03)),
                  ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: width*0.8,
                        width: width*1,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                loading=true;
                                pickFile(ImageSource.camera);
                              },
                              child: Container(
                                height: width*0.5,
                                  width: width*0.5,
                                  child: Icon(Icons.add_a_photo_sharp,
                                    size: width*0.15,
                                    color: colorPage.primaryColor,
                                  ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                loading=true;
                                pickFile(ImageSource.gallery);
                              },
                              child: Container(
                                height: width*0.5,
                                  width: width*0.5,
                                  child: Icon(Icons.photo_library_rounded,
                                    size: width*0.15,
                                    color: colorPage.primaryColor,
                                  )
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                );
              },
              child: file!=null?Stack(
                children: [
                  loading==true?CircularProgressIndicator():Center(
                    child: CircleAvatar(
                      radius: width*0.2,
                      // backgroundImage: FileImage(file!),
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                  ),
                  Positioned(
                    bottom: width*0.02,
                    left: width*0.6,
                    child: CircleAvatar(
                        backgroundColor: colorPage.primaryColor,
                        child: Icon(Icons.add_a_photo_rounded,
                          color: colorPage.backgroundColor,)
                    ),
                  ),
                ],
              ):Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: width*0.2,
                      backgroundImage: NetworkImage(widget.image),
                      // backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: width*0.02,
                      left: width*0.6,
                      child: CircleAvatar(
                        backgroundColor: colorPage.primaryColor,
                          child: Icon(Icons.add_a_photo_rounded,
                          color: colorPage.backgroundColor,)
                      ),
                  ),
                ],
              ),
            ),

            SizedBox(height: width*0.3,),

            SizedBox(
              height: width*0.15,
              width: width*0.8,
              child: TextFormField(
                controller: name_controller,
                textInputAction: TextInputAction.done,

                decoration: InputDecoration(
                  labelText:"Full name",
                  labelStyle: TextStyle(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w600,
                    color: colorPage.primaryColor,
                  ),
                  hintText:"Full name",
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

            SizedBox(height: width*0.1,),

            SizedBox(
              height: width*0.15,
              width: width*0.8,
              child: TextFormField(
                controller: number_controller,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,

                decoration: InputDecoration(
                  labelText:"Phone",
                  labelStyle: TextStyle(
                    fontSize: width*0.04,
                    fontWeight: FontWeight.w600,
                    color: colorPage.primaryColor,
                  ),
                  hintText:"Phone",
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

            SizedBox(height: width*0.5,),

            Center(
              child: InkWell(
                onTap: () {
                  currentUserName=name_controller.text;
                  currentUserNumber=number_controller.text;
                  currentUserImage=imageUrl;
                  // imageUrl='';
                  print(currentUserImage);

                  if(currentUserImage=='')
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Wait for image upload")
                          )
                      );
                    }
                  else
                    {
                      loading=false;
                      FirebaseFirestore.instance.collection("users").doc(currentUserId).update(
                          {
                            'image':currentUserImage,
                            'name':currentUserName,
                            'number':currentUserNumber,
                          }
                      );
                      setState(() {

                      });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => bottomNav1(),));
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
                    child: Text("Update",style: TextStyle(
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
