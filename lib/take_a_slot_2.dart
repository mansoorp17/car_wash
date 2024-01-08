import 'package:car_wash/color_page.dart';
import 'package:car_wash/conformation.dart';
import 'package:car_wash/images_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';

class takeSlot2 extends StatefulWidget {
  final Map<String,dynamic> data;
  const takeSlot2({super.key, required this.data});

  @override
  State<takeSlot2> createState() => _takeSlot2State();
}

class _takeSlot2State extends State<takeSlot2> {
  String date=DateTime.now().day.toString();
  String month=DateTime.now().month.toString();
  String year=DateTime.now().year.toString();

  var dates=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","!9","20","21","22","23","24","25","26","27","28","29","30","31"];

  var months=["1","2","3","4","5","6","7","8","9","10","11","12"];

  var years=["2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020","2023"];

  var times=["9:00am","10:00am","11:00am","12:00pm","01:00pm","05:00pm","03:00pm","04:0pm"];
  int? selectTime;
  String? selectTimeSlot;

  DateTime bookingTime=DateTime.now();

  TextEditingController note_controller=TextEditingController();
  TextEditingController location_controller=TextEditingController();
  int? select;
  Map<String,dynamic>data2={};
  @override
  void initState() {
    data2=widget.data;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Take a slot",
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
          padding: EdgeInsets.all(width*0.03),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Take a date",
                style: TextStyle(
                    fontSize: width*0.06,
                    color: colorPage.primaryColor,
                    fontWeight: FontWeight.w600
                ),),
              SizedBox(
                height: width*0.03,
              ),
              Row(
                children: [
                  SvgPicture.asset(imagesPage.sloat2),
                  SizedBox(width:width*0.05),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.03),
                      border: Border.all(
                        color: colorPage.primaryColor,
                      )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: DropdownButton(
                        hint: Text("1"),
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: width*0.1,
                          underline: SizedBox(),
                          value: date,
                          onChanged: (newValue) {
                            setState(() {
                              date=newValue!;

                              bookingTime=DateTime(
                                int.tryParse(date!)!,
                                int.tryParse(month!)!,
                                int.tryParse(year!)!,
                              );

                            });
                          },
                        items: dates.map((valueItem)
                        {
                          return DropdownMenuItem(
                            value: valueItem,
                              child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(width:width*0.05),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(
                          color: colorPage.primaryColor,
                        )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: DropdownButton(
                        hint: Text("10"),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: width*0.1,
                        underline: SizedBox(),
                        value: month,
                        onChanged: (newValue) {
                          setState(() {
                            month=newValue!;
                            bookingTime=DateTime(
                              int.tryParse(date!)!,
                              int.tryParse(month!)!,
                              int.tryParse(year!)!,
                            );
                          });
                        },
                        items: months.map((valueItem)
                        {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(width:width*0.05),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        border: Border.all(
                          color: colorPage.primaryColor,
                        )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: DropdownButton(
                        hint: Text("2000"),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: width*0.1,
                        underline: SizedBox(),
                        value: year,
                        onChanged: (newValue) {
                          setState(() {
                            year=newValue!;
                            bookingTime=DateTime(
                              int.tryParse(date!)!,
                              int.tryParse(month!)!,
                              int.tryParse(year!)!,
                            );
                          });
                        },
                        items: years.map((valueItem)
                        {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: width*0.03,
              ),
              Text("pic slot",
                style: TextStyle(
                    fontSize: width*0.06,
                    color: colorPage.primaryColor,
                    fontWeight: FontWeight.w600
                ),),
              SizedBox(
                height: width*0.03,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: times.length,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if(selectTime==index)
                          {
                            selectTime=null;
                          }
                        else{
                          selectTime=index;
                          selectTimeSlot=times[index];
                        }
                        setState(() {
                          select=index;
                        });
                        // print(selectTimeSlot);
                      },
                      child: Container(
                        height: width*0.1,
                        width: width*0.25,
                        decoration: BoxDecoration(
                          color: select==index?colorPage.clickeffect:colorPage.backgroundColor,
                            borderRadius: BorderRadius.circular(width*0.03),
                            border: Border.all(
                              color: colorPage.primaryColor,
                            )
                        ),
                        child: Center(child: Text(times[index],
                        style: TextStyle(
                          color: colorPage.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: width*0.05,
                        ),)),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(
                height: width*0.03,
              ),

              Row(
                children: [
                  Text("Add your note",
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

              SizedBox(
                height: width*0.03,
              ),
              Center(
                child: Container(
                  width: width*0.85,
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    controller: note_controller,
                    maxLines: null,
                    minLines: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width*0.045,
                    ),
                    decoration: InputDecoration(
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
              ),

              SizedBox(
                height: width*0.03,
              ),

              Text("Add your location",
                style: TextStyle(
                    fontSize: width*0.06,
                    color: colorPage.primaryColor,
                    fontWeight: FontWeight.w600
                ),),
              SizedBox(
                height: width*0.03,
              ),

              Center(
                child: Container(
                  width: width*0.85,
                  child: TextFormField(
                    controller: location_controller,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: null,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width*0.045,
                    ),
                    decoration: InputDecoration(
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
              ),

              SizedBox(
                height: width*0.05,
              ),

              Center(
                child: Container(
                  height: width*0.1,
                  width: width*0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.1),
                    border: Border.all(
                      color: colorPage.primaryColor,
                    )
                  ),
                  child: Center(
                    child: Text("From saved",style: TextStyle(
                      color:colorPage.primaryColor,
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: width*0.07,
              ),

              InkWell(
                onTap: () {
                  if(select==null||location_controller.text.isEmpty)
                    {
                      if(select==null)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please select slot")));
                        }
                      else if(location_controller.text.isEmpty)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please select loacation")));
                        }
                    }
                  else{
                    data2.addAll(
                      {
                        "date":bookingTime,
                        "slot":selectTimeSlot,
                        "note":note_controller.text,
                        "location":location_controller.text,
                        "status":0,
                      }
                    );
                    // data2=widget.data;
                    print(data2);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => conformation(),));
                    FirebaseFirestore.instance.collection("booking").add(data2).then((value) => value.update(
                      {
                        "id":value.id
                      }
                    )).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => conformation(),)));
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
                      child: Text("Payment",style: TextStyle(
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
