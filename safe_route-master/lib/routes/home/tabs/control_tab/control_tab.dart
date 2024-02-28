import 'package:flutter/material.dart';
import 'package:safe_route/routes/utils/app_colors.dart';

class ControlTab extends StatelessWidget {
  const ControlTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //clipper: MyClipper(),
      child: Container(
        width: double.infinity,
        height: 300,
        color: AppColors.primaryColor,
      ),
    );
  }
}

/*class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip
}*/
