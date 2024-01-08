import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';

class quickWash extends StatefulWidget {
  final String id;
  const quickWash({super.key, required this.id});

  @override
  State<quickWash> createState() => _quickWashState();
}

class _quickWashState extends State<quickWash> {




  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection("services").doc(widget.id).snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        var services=snapshot.data;






        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorPage.backgroundColor,
            title: Text(services!["title"],
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
                        imagesPage.backarrow)
                )
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(width*0.03),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: width*0.7,
                    width: width*1,
                    child: Image(image: NetworkImage(services["image"])
                    ),
                  ),
                  Center(
                    child: Text(services["subtitle"],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: width*0.05,
                        color: colorPage.primaryColor),
                    ),
                  ),
                  SizedBox(height: width*0.02,),
                  Text(services["description"],
                  style: TextStyle(
                    color:colorPage.paragraph,
                    fontSize: width*0.038
                  ),
                  ),
                  SizedBox(height: width*0.02,),

                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: services?["services"].length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index2) {
                        return Text("-${services?["services"][index2]}",
                        style: TextStyle(
                          color: colorPage.textBox,
                          fontSize: width*0.04
                        ),);
                      },
                  ),
                  SizedBox(height: width*0.02,),

                  // CheckboxMenuButton(
                  //   value: checkbox,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       checkbox=value!;
                  //     });
                  //   },
                  //   child: Text("Interial towel cleaning"),
                  // ),
                  // CheckboxMenuButton(
                  //   value: checkbox2,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       checkbox2=value!;
                  //     });
                  //   },
                  //   child: Text("Towel hand dry"),
                  // ),
                  // CheckboxMenuButton(
                  //   value: checkbox3,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       checkbox3=value!;
                  //     });
                  //   },
                  //   child: Text("Hand waxing"),
                  // ),
                  // CheckboxMenuButton(
                  //   value: checkbox4,
                  //   onChanged: (value) {
                  //     setState(() {
                  //       checkbox4=value!;
                  //     });
                  //   },
                  //   child: Text("Under body cleaning"),
                  // ),
                  Container(
                    height: width*0.13,
                    width: width*1,
                    color: colorPage.backgroundColor,
                    child: Row(
                      children: [
                        Text("\$-${services["price"]}/-",
                          style: TextStyle(
                            color: colorPage.paragraph,
                            fontWeight: FontWeight.w700,
                            fontSize: width*0.07,
                          ),),
                        SizedBox(
                          width: width*0.03,
                        ),
                        Text("only",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: width*0.05
                        ),),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: width*0.03,
                  ),

                  Container(
                    height: width*0.15,
                    width: width*0.5,
                    decoration: BoxDecoration(
                      color: colorPage.primaryColor,
                      borderRadius: BorderRadius.circular(width*0.1),
                    ),
                    child: Center(
                      child: Text("Book",style: TextStyle(
                        color:colorPage.backgroundColor,
                        fontSize: width*0.065,
                        fontWeight: FontWeight.w600,
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
    );
  }
}


// class serviceList extends StatefulWidget {
//
//   final List services ;
//   final int index;
//
//   const serviceList({super.key, required this.services, required this.index});
//
//   @override
//   State<serviceList> createState() => _serviceListState();
// }
//
// // class _serviceListState extends State<serviceList> {
// //   bool checkbox = true;
// //
// //   List services =[];
// //   int index =0;
// //
// //   @override
// //   void initState() {
// //
// //     services = widget.services;
// //     index = widget.index;
// //
// //     // TODO: implement initState
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return  Row(
// //       children: [
// //         Checkbox(
// //           activeColor: colorPage.checkbox,
//           value: checkbox,
//           onChanged: (value) {
//             setState(() {
//               checkbox=value!;
//             });
//           },
//         ),
//         Text(services[index],
//           style: TextStyle(
//             color: colorPage.checkbox,
//           ),),
//       ],
//     );;
//   }
// }
