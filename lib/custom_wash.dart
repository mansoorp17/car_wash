import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'main.dart';

class customWash extends StatefulWidget {
  const customWash({super.key});

  @override
  State<customWash> createState() => _customWashState();
}

class _customWashState extends State<customWash> {

  List services=[
    "Interial towel cleaning",
    "Towel hand dry",
    "Hand waxing",
    "Under body cleaning",
    "Foam/steam washing",
    "Door pad polish",
    "Trunk vaccum",
    "Mat washing",
    "Mat washing",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.backgroundColor,
        title: Text("Custom wash",
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
              child: SvgPicture.asset(imagesPage.backarrow))
          ),
        ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(width*0.03),
          child: Column(
            children: [
              Container(
                height: width*0.7,
                width: width*1,
                child: Image.asset(imagesPage.qw),
              ),
              Center(
                child: Text("Let'us clean simply",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: width*0.05,
                      color: colorPage.primaryColor),
                ),
              ),
              Text("Lorem ipsum dolor sit amet consectetur. Leo porttitor sit purus urna. Habitant volutpat m",
              style: TextStyle(
                color:colorPage.paragraph,
                fontSize: width*0.04,
              ),),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: services.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return serviceList(
                    services: services,
                    index: index,
                  );
                },
              ),
              SizedBox(
                height: width*0.03,
              ),
              Container(
                height: width*0.13,
                width: width*1,
                color: colorPage.backgroundColor,
                child: Row(
                  children: [
                    Text("\$-470/-",
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
                height: width*0.1,
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
}
class serviceList extends StatefulWidget {
  final services;
  final index;
  const serviceList({super.key, this.services, this.index});

  @override
  State<serviceList> createState() => _serviceListState();
}

class _serviceListState extends State<serviceList> {
  bool checkbox=true;

  List services=[];
  int index=0;
  @override
  void initState() {
    services=widget.services;
    index=widget.index;
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: colorPage.primaryColor,
          value: checkbox,
          onChanged: (value) {
            setState(() {
              checkbox=value!;
            });
          },
        ),
        Text(services[index],
          style: TextStyle(
            color: colorPage.primaryColor,
          ),),
      ],
    );;
  }
}

