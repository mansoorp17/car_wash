import 'package:car_wash/color_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class viewAddedVehicles extends StatefulWidget {
  const viewAddedVehicles({super.key});

  @override
  State<viewAddedVehicles> createState() => _viewAddedVehiclesState();
}

class _viewAddedVehiclesState extends State<viewAddedVehicles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Added Vehicles",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: width*0.07,
            color: colorPage.primaryColor,
          ),),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
                StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("users").doc(currentUserId).snapshots(),
                    builder: (context, snapshot) {
                      if(!snapshot.hasData)
                        {
                          return CircularProgressIndicator();
                        }
                      var vehicles=snapshot.data?["vehicles"];
                      // Map <String,dynamic> dataMap=vehicles?.data["vehicles"]() as Map<String,dynamic>;
                      // List<String> keyVehicles=dataMap.keys.toList();
                      List <dynamic> vehicleList=vehicles;

                      // print(vehicles);
                      return Container(
                        height: width*2,
                        width: width*1,
                        // color: Colors.black,
                        child: ListView.separated(
                          shrinkWrap: true,

                            itemBuilder: (context, index) {
                              return Container(
                                height: width*0.45,
                                width: width*1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(width*0.03),
                                  color: Colors.blueGrey
                                ),

                                child: Padding(
                                  padding:  EdgeInsets.only(top: width*0.03,left: width*0.07,right: width*0.03),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(),
                                          Center(
                                            child: Text(vehicles[index]["name"],style: TextStyle(
                                              color: colorPage.backgroundColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: width*0.05
                                            ),),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              // print(vehicles[index]);
                                              vehicleList.removeAt(index);
                                              print(vehicleList);

                                              FirebaseFirestore.instance.collection("users").doc(currentUserId).update(
                                                {
                                                  "vehicles":vehicleList,
                                                }
                                              );
                                              // print(vehicles);
                                              setState(() {

                                              });
                                            },
                                              child: Icon(Icons.delete,color: colorPage.backgroundColor,)
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: width*0.02,
                                      ),
                                      Text("REG.NO:${vehicles[index]["reg.no"]}",style: TextStyle(
                                        color: colorPage.clickeffect,
                                      ),),
                                      SizedBox(
                                        height: width*0.02,
                                      ),
                                      Text("Vehicle Model:${vehicles[index]["vehicleModel"]}",style: TextStyle(
                                        color: colorPage.clickeffect
                                      ),),
                                      SizedBox(
                                        height: width*0.02,
                                      ),
                                      Text("Vehicle Type:${vehicles[index]["vehicleType"]}",style: TextStyle(
                                        color: colorPage.clickeffect
                                      ),)
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: width*0.01,
                              );
                            },
                            itemCount: vehicles.length,
                        ),
                      );
                    },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
