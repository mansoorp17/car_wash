import 'dart:io';

import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:car_wash/quickWash.dart';
import 'package:car_wash/take_a_slot_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'main.dart';

class takeaSlot1 extends StatefulWidget {
  const takeaSlot1({super.key});

  @override
  State<takeaSlot1> createState() => _takeaSlot1State();
}

class _takeaSlot1State extends State<takeaSlot1> {
  String? valueChoose;

  String imageUrl='';
  String image="https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
  String? serviceId;
  // List listItem=[
  //   "Car-M5-KL-53 SG 4357","Car-Shift-KL-10 AB 4357","Car-M52-KL-53 SG 4357","Car-Shift-KL-102 AB 4357"
  // ];

  // List image=[
  //   "asset/images/img.png",
  //   "asset/images/img.png",
  //   "asset/images/img.png",
  // ];

  int initialIndex=0;

  // List service_images=[
  //   "asset/images/servicetheme1.png",
  //   "asset/images/servicetheme2.png",
  //   "asset/images/servicetheme3.png",
  //   "asset/images/servicetheme2.png",
  // ];
  // List service_names=[
  //   "Quick wash",
  //   "Power Wash",
  //   "Pro wash",
  //   "Custom wash",
  // ];

  var file;
  pickFile(ImageSource)
  async {
    final imageFile=await ImagePicker.platform.pickImage(source: ImageSource);
    file=File(imageFile!.path);
    if (mounted) {
      setState(() {
        file = File(imageFile.path);
        fileUpload();
      });
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

  int select1=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Booking",
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
        child: Padding(
          padding:EdgeInsets.all(width*0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Service vehicle",
              style: TextStyle(
                fontSize: width*0.06,
                color: colorPage.primaryColor,
                fontWeight: FontWeight.w600
              ),),

              Center(
                child: Container(
                  width: width*0.9,
                  height: width*0.15,
                  padding: EdgeInsets.only(left: width*0.03),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                        color: colorPage.primaryColor,
                        width: width*0.005,
                      )
                  ),
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance.collection("users").doc(currentUserId).snapshots(),
                    builder: (context, snapshot) {
                      
                      if(!snapshot.hasData)
                        {
                          return CircularProgressIndicator();
                        }
                      var types=snapshot.data;
                      var dataMap=types?.data() as Map<String,dynamic>;
                      List dropdownValues=dataMap["vehicles"];
                      return DropdownButton(
                        hint: Text("Select vehicle",
                          style: TextStyle(
                              color: colorPage.primaryColor,
                              fontSize: width*0.05
                          ),),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: width*0.1,
                        isExpanded: true,
                        underline: SizedBox(),
                        value: valueChoose,
                        onChanged: (value) {
                          // print(newValue);
                          setState(() {
                            valueChoose=value.toString();
                          });
                        },
                        items: List.generate(dropdownValues.length, (index) => DropdownMenuItem(
                            child: Text(dropdownValues[index]["reg.no"]),
                          value: dropdownValues[index]["reg.no"],
                        )),
                      );
                    }
                  ),
                ),
              ),

              SizedBox(
                height: width*0.05,
              ),
              Center(
                child: Container(
                  height: width*0.1,
                  width: width*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.06),
                    border: Border.all(
                      color: colorPage.primaryColor,
                      width: width*0.005,
                    )
                  ),
                  child: Center(
                    child: Text("Add another",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width*0.04
                    ),),
                  ),
                ),
              ),

              SizedBox(
                height: width*0.03,
              ),

              Row(
                children: [
                  Text("Add image",
                    style: TextStyle(
                        fontSize: width*0.06,
                        color: colorPage.primaryColor,
                        fontWeight: FontWeight.w600
                    ),),
                  SizedBox(width:width*0.03),
                  Text("(optional)",
                  style: TextStyle(
                    color: colorPage.primaryColor
                  ),),
                ],
              ),

              InkWell(
                onTap: () {
                  pickFile(ImageSource.gallery);
                },
                child: imageUrl==''?Container(
                  height: width*0.5,
                  width: width*1,
                  margin: EdgeInsets.all(width*0.03),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorPage.primaryColor,
                      width: width*0.005,
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(imagesPage.sloat),
                      Text("Upload your vehicle image",style: GoogleFonts.montserrat(
                        color: colorPage.checkbox,
                        fontWeight: FontWeight.w700,
                        fontSize: width*0.04
                      ),)
                    ],
                  ),
                ):
                    Container(
                      height: width*0.5,
                      width: width*1,
                      margin: EdgeInsets.all(width*0.03),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.fill),
                          border: Border.all(
                            color: colorPage.primaryColor,
                            width: width*0.005,
                          ),
                      ),
                      // child: Image(image: NetworkImage(imageUrl),fit: BoxFit.fill,),
                    )
              ),

              SizedBox(
                height: width*0.03,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pic a service",
                    style: TextStyle(
                      fontSize: width*0.06,
                      fontWeight: FontWeight.w600,
                      color: colorPage.primaryColor,
                    ),
                  ),
                  Text("View all"
                    ,style: TextStyle(
                      color: colorPage.actreq,
                    ),
                  ),
                ],
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("services").snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData)
                    {
                      return CircularProgressIndicator();
                    }

                  var services=snapshot.data?.docs;

                  return Container(
                    height: width*0.3,
                    width: width*1,
                    child: ListView.separated(
                      itemCount: services!.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            select1=index;
                            serviceId=services[index].id;
                            setState(() {

                            });
                          },
                          child: Container(
                            height: width*0.3,
                            width: width*0.3,
                            decoration: BoxDecoration(
                              color:  select1==index?colorPage.checkbox:colorPage.backgroundColor,
                              borderRadius: BorderRadius.circular(width*0.01),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(image: NetworkImage(services[index]["icon"])),
                                Text(services[index]["title"],
                                  style: TextStyle(
                                    color: colorPage.actreq,
                                  ),),
                              ],
                            ),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: width * 0.03,
                      );
                    },
                    ),
                  );
                }
              ),

              SizedBox(
                height: width*0.03,
              ),
              Text("Pic your comfort"
            ,style: TextStyle(
              color: colorPage.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: width*0.06
            ),
          ),

              Container(
                height: width*0.13,
                width: width*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                  border: Border.all(
                    color: colorPage.primaryColor,
                    width: width*0.005,
                  )
                ),
                child:Row(
                  children: [
                    SizedBox(
                        width: width*0.1
                    ),
                    Text("On site",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: width*0.05,
                      color: colorPage.primaryColor
                    ),),
                  ],
                ),
              ),
              SizedBox(
                height: width*0.04,
              ),
              Container(
                height: width*0.13,
                width: width*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    border: Border.all(
                      color: colorPage.primaryColor,
                      width: width*0.005,
                    )
                ),
                child:Row(
                  children: [
                    SizedBox(
                        width: width*0.1
                    ),
                    Text("Self visit",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width*0.05,
                          color: colorPage.primaryColor
                      ),),
                  ],
                ),
              ),
              SizedBox(
                height: width*0.04,
              ),
              Container(
                height: width*0.13,
                width: width*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    border: Border.all(
                      color: colorPage.primaryColor,
                      width: width*0.005,
                    )
                ),
                child:Row(
                  children: [
                    SizedBox(
                        width: width*0.1
                    ),
                    Text("Pick up and drop",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width*0.05,
                          color: colorPage.primaryColor
                      ),),
                  ],
                ),
              ),

              SizedBox(
                height: width*0.1,
              ),

              Center(
                child: InkWell(
                  onTap: () {
                    if(valueChoose==null)
                      {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Fill Vehicle Number")));
                      }
                    else{
                      Map<String,dynamic>data={
                        "serviceVehicle":valueChoose,
                        "image":imageUrl,
                        "service":serviceId,
                      };
                      Navigator.push(context, MaterialPageRoute(builder: (context) => takeSlot2(data: data,),));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
