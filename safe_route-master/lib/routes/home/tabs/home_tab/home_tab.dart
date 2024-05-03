import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';
import 'dart:async';
import 'dart:convert';
import '../../../utils/app_colors.dart';
import 'package:http/http.dart' as http;

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Timer timer;
  var charge;
  var temp;
  var range;
  var speed;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => connect());
  }

  void connect() async {
      var response = await http.get(Uri.parse('http://10.0.0.1:4000/send_data'));
      if (response.statusCode == 200) {
        final jsonSendData = json.decode(response.body);
        charge = jsonSendData['charge'];
        temp = jsonSendData['temp'];
        range = jsonSendData['range'];
        speed = jsonSendData['speed'];
        print(jsonSendData);
      }
        // data transfer
      setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //centerTitle: true,
          title: Text(
            "Mercedes-Benz E350",
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w300,
                fontSize: 30),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/full_screen.png"), fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(
                flex: 45,
              ),
              Expanded(
                  flex: 20,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width:10,
                          ),
                          Text("Status",
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w200)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 14,),
                                  Icon(Icons.battery_saver_sharp,color: AppColors.textColor,size: 20),
                                  Text("Battery Charge",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100)),
                                ],
                              ),
                              SizedBox(height: 7,),
                              Text(charge.toString(),
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [

                                  Icon(Icons.location_on,color: AppColors.textColor,size: 20),
                                  Text("Range",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100)),
                                ],
                              ),
                              SizedBox(height: 7,),
                              Text("$range km",
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [

                                  Icon(Icons.heat_pump_rounded,color: AppColors.textColor,size: 20),
                                  Text("Temperature",
                                      style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100)),
                                ],
                              ),
                              SizedBox(height: 7,),
                              Text(temp.toString(),
                                  style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal)),
                            ],
                          )
                        ],
                      )
                    ],
                  )
              ),
              Expanded(flex:35,child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 210,
                      height: 210,
                      padding: EdgeInsets.all(10),
                      child: KdGaugeView(
                        minSpeed: 0,
                        maxSpeed: 20,
                        speed: double.parse(speed),
                        animate: true,
                        duration: Duration(seconds: 5),
                        alertSpeedArray: [15, 18, 19],
                        alertColorArray: [Colors.orange, Colors.indigo, Colors.red],
                        unitOfMeasurement: "Mbps",
                        gaugeWidth: 20,
                        fractionDigits: 1,
                        speedTextStyle: TextStyle(fontSize: 40,color: AppColors.textColor),
                        minMaxTextStyle: TextStyle(fontSize: 15,color:AppColors.textColor),
                        unitOfMeasurementTextStyle: TextStyle(fontSize: 12,color: AppColors.textColor),

                      ),
                    )
                  ],
                ),
              ),
              )
            ],
          ),
        ),
      );
  }
}
