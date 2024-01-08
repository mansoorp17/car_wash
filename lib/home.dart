import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_wash/add_vehicle.dart';
import 'package:car_wash/color_page.dart';
import 'package:car_wash/custom_wash.dart';
import 'package:car_wash/images_page.dart';
import 'package:car_wash/notification.dart';
import 'package:car_wash/power_wash.dart';
import 'package:car_wash/pro_wash.dart';
import 'package:car_wash/quickWash.dart';
import 'package:car_wash/take_a_slot_1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
List image=[
  "asset/images/img.png",
  "asset/images/img.png",
  "asset/images/img.png",
];

int initialIndex=0;





bool floatingButtonAdd=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      floatingActionButton:
      InkWell(
        onTap: () {
          floatingButtonAdd = !floatingButtonAdd;
          setState(() {

          });

        },

        child:floatingButtonAdd?

        Container(
          height: width*0.3,
          width: width*0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width*0.03),
            // color: Colors.red,
          ),
          child: Stack(
            children: [
              Container(
                height: width*0.24,
                width: width*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  color: colorPage.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => takeaSlot1(),));
                      },
                      child: Container(
                        height: width*0.05,
                        width: width*0.22,
                        decoration: BoxDecoration(
                            color: colorPage.backgroundColor,
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                        child: Center(
                          child: Text("Take a slot",
                            style: TextStyle(
                              color: colorPage.primaryColor,
                            ),),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width*0.015,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => addVehicle(),));
                      },
                      child: Container(
                        height: width*0.05,
                        width: width*0.22,
                        decoration: BoxDecoration(
                            color: colorPage.backgroundColor,
                            borderRadius: BorderRadius.circular(width*0.03)
                        ),
                        child: Center(
                          child: Text("Add vehicle",
                            style: TextStyle(
                              color: colorPage.primaryColor,
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: width*0.000,
                left: width*0.09,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorPage.primaryColor,
                    shape: BoxShape.circle
                  ),
                  child: Container(
                    height: width*0.08,
                    width: width*0.08,
                    margin: EdgeInsets.all(width*0.015),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width*0.3),
                      color: colorPage.actreq,
                      border: Border.all(
                        color: colorPage.primaryColor,
                      )
                    ),
                    child: Icon(Icons.close,color: colorPage.backgroundColor,),
                  ),
                ),
              ),
            ],
          ),

        ):

        Container(
          height: width*0.1,
          width: width*0.22,
          decoration: BoxDecoration(
            color: colorPage.primaryColor,
            borderRadius: BorderRadius.circular(width*0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.add,color: colorPage.backgroundColor,),
                Text("Add",
                style: TextStyle(
                  fontSize: width*0.05,
                  fontWeight: FontWeight.w600,
                  color: colorPage.backgroundColor,
                ),),
              ],
            ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
       title: Text("Hello,$currentUserName",style: TextStyle(
         color: colorPage.primaryColor,
       ),),
       leading: Padding(
         padding: EdgeInsets.all(width*0.04),
         child: Container(
           height: width*0.01,
           width: width*0.01,
           child: SvgPicture.asset(imagesPage.menu),
         ),
       ),
        actions: [
          Padding(
            padding: EdgeInsets.all(width*0.03),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => notification(),));
              },
              child: Stack(
                children: [
                  Positioned(
                    right: width*0.01,
                    child: CircleAvatar(
                      radius: width*0.02,
                      backgroundColor: colorPage.primaryColor,
                    ),
                  ),
                  Container(
                      child: SvgPicture.asset(imagesPage.bell)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.04),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
                    hintText: "Search services",
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

              Text("Offers",
                style: TextStyle(
                  fontSize: width*0.06,
                  fontWeight: FontWeight.w600,
                  color: colorPage.primaryColor,
              ),),

              // CarouselSlider.builder(
              //   itemCount: image.length,
              //   options: CarouselOptions(
              //   autoPlayAnimationDuration:Duration(
              //     milliseconds:200,
              //   ),
              //     autoPlay: true,
              //     viewportFraction:1,
              //     onPageChanged:(index, reason) {
              //       initialIndex=index;
              //       setState(() {
              //
              //       });
              //     },
              //   ),
              //   itemBuilder: (context, index, realIndex) {
              //       return Container(
              //         height: width*0.15,
              //         width: width*1,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(width*0.03),
              //           image:DecorationImage(image: AssetImage(image[index]),fit: BoxFit.fill),
              //         ),
              //       );
              //   },
              // ),


              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("images").snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData)
                      {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                      }
                    var data=snapshot.data?.docs;
                    return Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: data?.length,
                          itemBuilder: (BuildContext context, int index, int realIndex) {
                            return Container(
                              height: width*0.15,
                              width: width*1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width*0.03),
                                image:DecorationImage(image: CachedNetworkImageProvider(data?[index]["image"]),fit: BoxFit.fill),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            autoPlayAnimationDuration:Duration(
                              milliseconds: 200,
                            ),
                              autoPlay: true,
                            viewportFraction: 1,
                            onPageChanged:(index, reason) {
                                initialIndex=index;
                                setState(() {

                                });
                            },
                          ),

                        ),
                        SizedBox(
                          height: width*0.03,
                        ),
                        Center(
                          child: AnimatedSmoothIndicator(
                            activeIndex: initialIndex,
                            count: data!.length,
                            duration: Duration(
                              milliseconds: 300,
                            ),
                            effect: ExpandingDotsEffect(
                              activeDotColor:colorPage.primaryColor,
                              dotColor: Colors.grey,
                              dotHeight: width*0.02,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
              ),


              SizedBox(
                height: width*0.03,
              ),

              Text("Active request",
                style: TextStyle(
                  fontSize: width*0.06,
                  fontWeight: FontWeight.w600,
                  color: colorPage.primaryColor,
                ),
              ),

              Container(
                height: width*0.35,
                width: width*1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(width*0.03),
                      height: width*0.3,
                      width: width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                      ),
                      child: Image.asset(imagesPage.car1,fit: BoxFit.fill,),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Prowash",
                          style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: width*0.04,
                          ),
                        ),
                        Text("Car-M5",
                          style: TextStyle(
                            color: colorPage.actreq,
                            fontSize: width*0.035,
                          ),
                        ),
                        Text("KL-53 SG 4357",
                          style: TextStyle(
                            color: colorPage.actreq,
                            fontSize: width*0.035,
                          ),
                        ),
                        Text("26/03/2022",
                          style: TextStyle(
                            color: colorPage.actreq,
                            fontSize: width*0.035,
                          ),
                        ),
                        Text("------> vehicle reached at center",
                          style: TextStyle(
                            color: colorPage.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),)
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: width*0.03,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Service theme",
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => quickWash(id: services[index].id,),));
                            },
                            child: Container(
                              height: width*0.3,
                              width: width*0.3,
                              decoration: BoxDecoration(
                                color: colorPage.backgroundColor,
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

            ],
          ),

        ),
      ),
    );
  }
}


showUploadMessage(BuildContext context,String text)
{
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: colorPage.secondaryColor,
          content: Text("Please fill $text"))
  );
}
