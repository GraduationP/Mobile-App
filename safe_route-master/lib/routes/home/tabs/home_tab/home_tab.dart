import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

import '../../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
                            Text("68%",
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
                            Text("01 km",
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
                            Text("28 C",
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
                      speed: 10,
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
