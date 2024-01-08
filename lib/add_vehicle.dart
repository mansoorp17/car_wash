import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'main.dart';

class addVehicle extends StatefulWidget {
  const addVehicle({super.key});

  @override
  State<addVehicle> createState() => _addVehicleState();
}

class _addVehicleState extends State<addVehicle> {
  String? selectedItem;
  String? selectedItem2;
  TextEditingController regNo_controller=TextEditingController();
  TextEditingController clientName_controller=TextEditingController();

  // String? valueChoose;
  // String? valueChoose2;

  // Map <String,List<String> > selectItems={
  //   "bus":["Private","Tourist","KSRTC"],
  //   "car":["BMW","Benz","Audi"],
  //   "Bike":["Pulser","FZ","RE"],
  // };

  String? selectedVehicleType;
  var selectedVehicleModel;

  // List <String>listItem2=[];

  bool select=false;


  bool floatingButtonAdd=false;

  bool check1=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => addVehicle(),));
              },
              child: Container(
                height: width*0.25,
                width: width*0.17,
                decoration: BoxDecoration(
                  // color: colorPage.primaryColor,
                ),
                child: Stack(
                  children: [
                    Container(
                      height: width*0.16,
                      width: width*0.16,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.1),
                          border: Border.all(
                            color: colorPage.primaryColor,
                            width: width*0.005,
                          ),
                      ),
                      child: Icon(Icons.add),
                    ),
                    Positioned(
                      bottom: width*0.02,
                      child: Column(
                        children: [
                          Text("Add more",
                          style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

      appBar: AppBar(
        backgroundColor: colorPage.backgroundColor,
        title: Text("Add vehicle",
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
                child: SvgPicture.asset(
                    imagesPage.backarrow
                )
            )
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your vehicle type",
              style: TextStyle(
                color: colorPage.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: width*0.05,
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
                    stream: FirebaseFirestore.instance.collection("vehicles").doc("vehicles").snapshots(),
                    builder: (context, snapshot) {

                    var types=snapshot.data;
                    var dataMap=types?.data() as Map<String,dynamic>;
                    List <String> dropdownValues=dataMap.keys.toList();

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
                        value: selectedVehicleType,
                        items: List.generate(dropdownValues.length, (index) => DropdownMenuItem(
                            child: Text(dropdownValues[index]),
                          value: dropdownValues[index],
                        )),
                        onChanged: (value) {
                          setState(() {
                            selectedVehicleType=value;
                            selectedItem2=null;
                          });
                        },
                      );
                    }
                  ),
                  ),
                ),

              SizedBox(
                height: width*0.05,
              ),

              Text("Model",
                style: TextStyle(
                  color: colorPage.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: width*0.05,
                ),),

              selectedVehicleType==null?Center(child: CircularProgressIndicator()):
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
                  child: StreamBuilder<DocumentSnapshot<Map<String,dynamic>>>(
                    stream: FirebaseFirestore.instance.collection("vehicles").doc("vehicles").snapshots(),
                    builder: (context, snapshot) {

                      var vehicles=snapshot.data;
                      Map <String,dynamic>? dataMap=vehicles?.data();
                      print(dataMap);
                      List dropdownValues=dataMap?[selectedVehicleType];
                      print(dropdownValues);


                      return DropdownButton(
                        hint: Text("Select model",
                          style: TextStyle(
                              color: colorPage.primaryColor,
                              fontSize: width*0.05
                          ),),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: width*0.1,
                        isExpanded: true,
                        underline: SizedBox(),
                        value: selectedItem2,
                         items: List.generate(dropdownValues.length, (index) => DropdownMenuItem(
                          value: dropdownValues[index],
                          child: Text(dropdownValues[index]),
                      )),
                        onChanged: (value) {
                          setState(() {
                            selectedItem2=value.toString();

                            selectedVehicleModel=value;
                          });
                        },
                      );
                    }
                  ),
                ),
              ),

              SizedBox(
                height: width*0.05,
              ),

              Text("Reg.number",
                style: TextStyle(
                  color: colorPage.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: width*0.05,
                ),),

              Center(
            child: Container(
              width: width*0.9,
              height: width*0.15,
              // padding: EdgeInsets.only(left: width*0.03),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  border: Border.all(
                    color: colorPage.primaryColor,
                    width: width*0.005,
                  )
              ),
              child: TextFormField(
                controller: regNo_controller,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: "Enter Number",
                  enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width*0.02),
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(width*0.02),
                    borderSide: BorderSide(
                      color:colorPage.primaryColor,
                    )
                  )
                ),
              ),
            ),
          ),

              SizedBox(
                height: width*0.05,
              ),

              Text("Client",
                style: TextStyle(
                  color: colorPage.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: width*0.05,
                ),),

              Center(
                child: Container(
                  width: width*0.9,
                  height: width*0.15,
                  // padding: EdgeInsets.only(left: width*0.03),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                        color: colorPage.primaryColor,
                        width: width*0.005,
                      )
                  ),
                  child: TextFormField(
                    controller: clientName_controller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        hintText: "Name",
                        enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.02),
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.02),
                            borderSide: BorderSide(
                              color:colorPage.primaryColor,
                            )
                        )
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: width*0.05,
              ),

              Row(
                children: [
                  Checkbox(
                    side: BorderSide(
                      color: colorPage.primaryColor,
                      width: width*0.005
                    ),
                      value: check1,
                      onChanged: (value) {
                        check1=value!;
                        setState(() {

                        });
                      },
                  ),
                  Text("Set as default servicing",
                    style: TextStyle(
                      color: colorPage.primaryColor,
                    ),),
                ],
              ),

              SizedBox(
                height: width*0.35,
              ),

              InkWell(
                onTap: () {
                  // print(selectedItem);
                  // print(selectedItem2);
                  // print(regNo_controller.text);
                  // print(clientName_controller.text);
                  // print(currentUserId);

                  Map<String,dynamic> data={
                    "vehicleType":selectedVehicleType,
                    "vehicleModel":selectedItem2,
                    "reg.no":regNo_controller.text,
                    "name":clientName_controller.text,
                  };
                  FirebaseFirestore.instance.collection("users").doc(currentUserId).update(
                      {
                        'vehicles':FieldValue.arrayUnion(
                            [data]
                        )
                      }
                  );
                  regNo_controller.clear();
                  clientName_controller.clear();
                  selectedVehicleType=null;
                  setState(() {

                  });

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
                          children: [Container(
                            height: width*0.5,
                            width: width*1,
                            child: Lottie.asset(imagesPage.verified),
                          ),
                            Container(
                              child: Text("Vehicle added",
                                  style: GoogleFonts.poppins(
                                    color: colorPage.primaryColor,
                                    fontSize: width*0.09,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),

                          ],
                        );
                      }
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
                      child: Text("Add",style: TextStyle(
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
