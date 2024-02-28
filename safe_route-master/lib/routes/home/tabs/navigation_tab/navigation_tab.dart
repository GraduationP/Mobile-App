import 'package:flutter/material.dart';
import 'package:safe_route/routes/utils/app_colors.dart';

class TAnimation extends StatefulWidget {
  static String routeName="transform";

  @override
  State<TAnimation> createState() => _TAnimationState();
}

class _TAnimationState extends State<TAnimation> {
  double valrot=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: AppColors.accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 0.5,),
                Transform.rotate(angle: valrot,origin:const Offset(50, 0),child:Column(
                  children: [
                    Container(color: AppColors.primaryColor,height: 700,width: 15,),
                  ],
                ) ,),

                Transform.rotate(angle: valrot,origin:const Offset(50, 0),child:Column(
                  children: [
                    Container(color:AppColors.primaryColor,height: 700,width: 15,),
                  ],
                ) ,),
                const SizedBox(width: 0.5,),
              ],
            )



          ],
        ),
      ),
    );
  }
}
