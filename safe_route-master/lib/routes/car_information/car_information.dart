import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CarInfo extends StatelessWidget {
static String routeName="car info";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        //centerTitle: true,
        title: Text(
          "Change Car",
          style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w300,
              fontSize: 30),
        ),
        ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/dark3.png"), fit: BoxFit.fill),
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

                getRowOption("Brand"),
                    Divider(
                      height: 1,
                      thickness: 0.5,endIndent: 30,indent: 30,
                      color: AppColors.textColor,
                    ),

                    getRowOption("Model"),
                    Divider(
                      height: 1,
                      thickness: 0.5,endIndent: 30,indent: 30,
                      color: AppColors.textColor,
                    ),

                    getRowOption("Color"),
                    Divider(
                      height: 1,
                      thickness: 0.5,endIndent: 30,indent: 30,
                      color: AppColors.textColor,
                    ),

                    getRowOption("Version"),
                    Divider(
                      height: 1,
                      thickness: 0.5,endIndent: 30,indent: 30,
                      color: AppColors.textColor,
                    ),

                    getRowOption("License Plates"),


                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

 Widget getRowOption(String selectedOption ){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [

              SizedBox(width: 5,),
              Text(selectedOption,style: TextStyle(color: AppColors.textColor,fontSize: 18,fontWeight: FontWeight.w500),),
            ],
          ),
          Icon(Icons.arrow_forward_ios_outlined,color: AppColors.textColor,size: 18),



        ],
      ),
    );
  }

