import 'package:car_wash/color_page.dart';
import 'package:car_wash/details.dart';
import 'package:car_wash/images_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class booking extends StatefulWidget {
  const booking({super.key});

  @override
  State<booking> createState() => _bookingState();
}

class _bookingState extends State<booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPage.backgroundColor,
        title: Text("Bookings",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: width*0.07,
            color: colorPage.primaryColor,
          ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.04),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: width*0.15,
                width: width*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Search",
                    labelStyle: TextStyle(
                      fontSize:width*0.04,
                    ),
                    hintText: "Search bookings",
                    hintStyle:TextStyle(
                      fontSize: width*0.05,
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
                    suffixIcon: Icon(Icons.search,size: width*0.08),
                  ),
                ),
              ),

              SizedBox(
                height: width*0.03,
              ),

              Text("Bookings",
                style: TextStyle(
                  fontSize: width*0.06,
                  fontWeight: FontWeight.w600,
                  color: colorPage.primaryColor,
                ),),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => details(),));
                },
                child: Container(
                  height: width*0.77,
                  width: width*1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width*0.03),
                    // color: Colors.green,
                  ),
                  child: StreamBuilder(

                    stream: FirebaseFirestore.instance.collection("booking").where('status',isEqualTo:0).snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if(!snapshot.hasData)
                        {
                          return CircularProgressIndicator();
                        }
                      var booking=snapshot.data?.docs;

                        return Container(
                          height: width*0.35,
                          width: width*1,
                          // color: colorPage.backgroundColor,
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: width*0.35,
                                width: width*1,
                                color: colorPage.backgroundColor,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(width*0.03),
                                      height: width*0.3,
                                      width: width*0.3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(width*0.03),

                                      ),
                                      child: Image(image: NetworkImage(booking[index]["image"]),fit: BoxFit.fill,),
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        StreamBuilder(
                                          stream: FirebaseFirestore.instance.collection("services").doc(booking[index]["service"]).snapshots(),
                                          builder: (context, snapshot) {
                                            if(!snapshot.hasData)
                                              {
                                                return CircularProgressIndicator();
                                              }
                                            var service=snapshot.data;
                                            return Text(service?["title"],
                                              style: TextStyle(
                                                color: colorPage.primaryColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: width*0.04,
                                              ),
                                            );
                                          }
                                        ),
                                        Text(booking[index]["serviceVehicle"],
                                          style: TextStyle(
                                            color: colorPage.actreq,
                                            fontSize: width*0.035,
                                          ),
                                        ),
                                        Text(booking[index]["slot"],
                                          style: TextStyle(
                                            color: colorPage.actreq,
                                            fontSize: width*0.035,
                                          ),
                                        ),
                                        Text(booking[index]["location"],
                                          style: TextStyle(
                                            color: colorPage.actreq,
                                            fontSize: width*0.035,
                                          ),
                                        ),
                                        Text(booking[index]["date"].toDate().toString().substring(0,10),
                                          style: TextStyle(
                                            color: colorPage.primaryColor,
                                            fontWeight: FontWeight.w600,
                                          ),)
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: width*0.03,
                              );
                            },
                            itemCount: booking.length,
                          ),
                        );
                    },

                  ),
                ),
              ),



              Text("Serviced",
                style: TextStyle(
                  fontSize: width*0.06,
                  fontWeight: FontWeight.w600,
                  color: colorPage.primaryColor,
                ),),
              Container(
                height: width*0.77,
                width: width*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  // color: Colors.green,
                ),
                child: StreamBuilder(

                  stream: FirebaseFirestore.instance.collection("booking").where('status',isEqualTo:1).snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(!snapshot.hasData)
                    {
                      return CircularProgressIndicator();
                    }
                    var booking=snapshot.data?.docs;

                    return Container(
                      height: width*0.35,
                      width: width*1,
                      // color: colorPage.backgroundColor,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: width*0.35,
                            width: width*1,
                            color: colorPage.backgroundColor,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(width*0.03),
                                  height: width*0.3,
                                  width: width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(width*0.03),

                                  ),
                                  child: Image(image: NetworkImage(booking[index]["image"]),fit: BoxFit.fill,),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StreamBuilder(
                                        stream: FirebaseFirestore.instance.collection("services").doc(booking[index]["service"]).snapshots(),
                                        builder: (context, snapshot) {
                                          if(!snapshot.hasData)
                                          {
                                            return CircularProgressIndicator();
                                          }
                                          var service=snapshot.data;
                                          return Text(service?["title"],
                                            style: TextStyle(
                                              color: colorPage.primaryColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: width*0.04,
                                            ),
                                          );
                                        }
                                    ),
                                    Text(booking[index]["serviceVehicle"],
                                      style: TextStyle(
                                        color: colorPage.actreq,
                                        fontSize: width*0.035,
                                      ),
                                    ),
                                    Text(booking[index]["slot"],
                                      style: TextStyle(
                                        color: colorPage.actreq,
                                        fontSize: width*0.035,
                                      ),
                                    ),
                                    Text(booking[index]["location"],
                                      style: TextStyle(
                                        color: colorPage.actreq,
                                        fontSize: width*0.035,
                                      ),
                                    ),
                                    Text(booking[index]["date"].toDate().toString().substring(0,10),
                                      style: TextStyle(
                                        color: colorPage.primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),)
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: width*0.03,
                          );
                        },
                        itemCount: booking.length,
                      ),
                    );
                  },

                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => details(),));
              //   },
              //   child: Container(
              //     height: width*0.35,
              //     width: width*1,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(width*0.03),
              //       color: Colors.white,
              //     ),
              //     child: Row(
              //       children: [
              //         Container(
              //           margin: EdgeInsets.all(width*0.03),
              //           height: width*0.3,
              //           width: width*0.3,
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(width*0.03),
              //           ),
              //           child: Image.asset(imagesPage.car3,fit: BoxFit.fill,),
              //         ),
              //
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text("Quick wash",
              //               style: TextStyle(
              //                   color: colorPage.primaryColor,
              //                   fontWeight: FontWeight.w700,
              //                   fontSize: width*0.04,
              //               ),
              //             ),
              //             Text("Car-M5",
              //               style: TextStyle(
              //                 color: colorPage.actreq,
              //                 fontSize: width*0.035,
              //               ),
              //             ),
              //             Text("KL-53 SG 4357",
              //               style: TextStyle(
              //                 color: colorPage.actreq,
              //                 fontSize: width*0.035,
              //               ),
              //             ),
              //             Text("26/03/2022",
              //               style: TextStyle(
              //                 color: colorPage.actreq,
              //                 fontSize: width*0.035,
              //               ),
              //             ),
              //             Text("Expected on 04/04/2022",
              //               style: TextStyle(
              //                 color: colorPage.primaryColor,
              //                 fontWeight: FontWeight.w600,
              //               ),),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),


              // Container(
              //   height: width*0.9,
              //   width: width*1,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(width*0.03),
              //     // color: Colors.white,
              //   ),
              //   child: StreamBuilder(
              //     stream: FirebaseFirestore.instance.collection("booking").where('status',isEqualTo:1).snapshots(),
              //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              //       if(!snapshot.hasData)
              //       {
              //         return CircularProgressIndicator();
              //       }
              //       var booking=snapshot.data?.docs;
              //
              //       return Container(
              //         height: width*0.35,
              //         width: width*1,
              //         color: Colors.yellowAccent,
              //         child: Column(
              //           children: [
              //             Text("Serviced",
              //               style: TextStyle(
              //                 fontSize: width*0.06,
              //                 fontWeight: FontWeight.w600,
              //                 color: colorPage.primaryColor,
              //               ),
              //             ),
              //             ListView.separated(
              //               itemBuilder: (BuildContext context, int index) {
              //                 return Container(
              //                   height: width*0.35,
              //                   width: width*1,
              //                   color: colorPage.backgroundColor,
              //                   child: Row(
              //                     children: [
              //                       Container(
              //                         margin: EdgeInsets.all(width*0.03),
              //                         height: width*0.3,
              //                         width: width*0.3,
              //                         decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(width*0.03),
              //                         ),
              //                         child: Image(image: NetworkImage(booking[index]["image"])),
              //                       ),
              //
              //                       Column(
              //                         crossAxisAlignment: CrossAxisAlignment.start,
              //                         children: [
              //                           StreamBuilder(
              //                               stream: FirebaseFirestore.instance.collection("services").doc(booking[index]["service"]).snapshots(),
              //                               builder: (context, snapshot) {
              //                                 if(!snapshot.hasData)
              //                                 {
              //                                   return CircularProgressIndicator();
              //                                 }
              //                                 var service=snapshot.data;
              //                                 return Text(service?["title"],
              //                                   style: TextStyle(
              //                                     color: colorPage.primaryColor,
              //                                     fontWeight: FontWeight.w700,
              //                                     fontSize: width*0.04,
              //                                   ),
              //                                 );
              //                               }
              //                           ),
              //                           Text(booking[index]["serviceVehicle"],
              //                             style: TextStyle(
              //                               color: colorPage.actreq,
              //                               fontSize: width*0.035,
              //                             ),
              //                           ),
              //                           Text(booking[index]["slot"],
              //                             style: TextStyle(
              //                               color: colorPage.actreq,
              //                               fontSize: width*0.035,
              //                             ),
              //                           ),
              //                           Text(booking[index]["location"],
              //                             style: TextStyle(
              //                               color: colorPage.actreq,
              //                               fontSize: width*0.035,
              //                             ),
              //                           ),
              //                           Text(booking[index]["date"].toDate().toString().substring(0,10),
              //                             style: TextStyle(
              //                               color: colorPage.primaryColor,
              //                               fontWeight: FontWeight.w600,
              //                             ),)
              //                         ],
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               },
              //               separatorBuilder: (BuildContext context, int index) {
              //                 return SizedBox(
              //                   height: width*0.03,
              //                 );
              //               },
              //               itemCount: booking.length,
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //
              //   ),
              // ),


              // Container(
              //   height: width*0.35,
              //   width: width*1,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(width*0.03),
              //     color: Colors.white,
              //   ),
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.all(width*0.03),
              //         height: width*0.3,
              //         width: width*0.3,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(width*0.03),
              //         ),
              //         child: Image.asset(imagesPage.car2,fit: BoxFit.fill,),
              //       ),
              //
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text("Custom wash",
              //             style: TextStyle(
              //                 color: colorPage.primaryColor,
              //                 fontWeight: FontWeight.w700,
              //                 fontSize: width*0.04,
              //             ),
              //           ),
              //           Text("Car-ShiftM5",
              //             style: TextStyle(
              //               color: colorPage.actreq,
              //               fontSize: width*0.035,
              //             ),
              //           ),
              //           Text("KL-10 AB 4357",
              //             style: TextStyle(
              //               color: colorPage.actreq,
              //               fontSize: width*0.035,
              //             ),
              //           ),
              //           Text("01/04/2022",
              //             style: TextStyle(
              //               color: colorPage.actreq,
              //               fontSize: width*0.035,
              //             ),
              //           ),
              //           Text("------> vehicle dropped successfully",
              //             style: TextStyle(
              //               color: colorPage.primaryColor,
              //               fontWeight: FontWeight.w600,
              //             ),)
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   height: width*0.35,
              //   width: width*1,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(width*0.03),
              //     color: Colors.white,
              //   ),
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.all(width*0.03),
              //         height: width*0.3,
              //         width: width*0.3,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(width*0.03),
              //         ),
              //         child: Image.asset(imagesPage.car1,fit: BoxFit.fill,),
              //       ),
              //
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text("Prowash",
              //             style: TextStyle(
              //                 color: colorPage.primaryColor,
              //                 fontWeight: FontWeight.w700,
              //                 fontSize: width*0.04,
              //             ),
              //           ),
              //           Text("Car-M5",
              //             style: TextStyle(
              //               color: colorPage.actreq,
              //               fontSize: width*0.035,
              //             ),
              //           ),
              //           Text("KL-53 SG 4357",
              //             style: TextStyle(
              //               color: colorPage.actreq,
              //               fontSize: width*0.035,
              //             ),
              //           ),
              //           Text("26/03/2022",
              //             style: TextStyle(
              //               color: colorPage.actreq,
              //               fontSize: width*0.035,
              //             ),
              //           ),
              //           Text("------> vehicle dropped successfully",
              //             style: TextStyle(
              //               color: colorPage.primaryColor,
              //               fontWeight: FontWeight.w600,
              //             ),)
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
