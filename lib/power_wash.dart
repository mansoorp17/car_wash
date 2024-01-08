import 'package:car_wash/color_page.dart';
import 'package:car_wash/images_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class powerWash extends StatefulWidget {
  const powerWash({super.key});

  @override
  State<powerWash> createState() => _powerWashState();
}

class _powerWashState extends State<powerWash> {

  List services=[
    "Interior vaccuming",
    "Foam/steam washing",
    "Door pad polish",
    "Trunk vaccum",
    "Mat washing",
    "Tire dressing",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPage.backgroundColor,
        title: Text("Power wash",
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
              Text("Lorem ipsum dolor sit amet consectetur. Leo porttitor sit purus urna. Habitant volutpat massa a at eget dictum tellus ac eget. Pulvinar cursus curabitur non tincidunt diam sollicitudi",
              style: TextStyle(
                  color:colorPage.paragraph,
                  fontSize: width*0.038,
              ),
              ),

              ListView.builder(
                itemCount: services.length,
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                itemBuilder: (context, index) {
                  return serviceList(
                    index: index,
                    services: services,
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
                    Text("\$-480/-",
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
    // TODO: implement initState

    services=widget.services;
    index=widget.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: colorPage.checkbox,
            value: checkbox,
            onChanged: (value) {
              setState(() {
                checkbox=value!;
              });
            },

        ),
        Text(services[index],
          style: TextStyle(
            color: colorPage.checkbox,
          ),),
      ],
    );
  }
}

