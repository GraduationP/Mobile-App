import 'package:flutter/material.dart';
import 'package:safe_route/routes/profile/profile.dart';

import '../../../car_information/car_information.dart';
import '../../../utils/app_colors.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //centerTitle: true,
        title: Text(
          "Setting",
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w300,
              fontSize: 30),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/dark2.png"), fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(
              flex: 50,
            ),
            Expanded(
                flex: 50,
                child: Column(
                  children: [



                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Profile.routeName);
                  },
                  child: Padding(
                  padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        Icon(Icons.person,color: AppColors.textColor),
                        SizedBox(width: 5,),
                        Text("Profile",style: TextStyle(color: AppColors.textColor,fontSize: 18,fontWeight: FontWeight.w500),),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,color: AppColors.textColor,size: 18),

                  ],
              ),
            ),
                ),
                        Divider(
                          height: 1,
                          thickness: 0.5,endIndent: 30,indent: 30,
                          color: AppColors.textColor,
                        ),

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CarInfo.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Icon(Icons.car_crash_outlined,color: AppColors.textColor),
                                SizedBox(width: 5,),
                                Text("Car Imformation",style: TextStyle(color: AppColors.textColor,fontSize: 18,fontWeight: FontWeight.w500),),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_outlined,color: AppColors.textColor,size: 18),

                          ],
                        ),
                      ),
                    ),

                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

}
