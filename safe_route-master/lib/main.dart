import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safe_route/routes/car_information/car_information.dart';
import 'package:safe_route/routes/home/home.dart';
import 'package:safe_route/routes/login/login.dart';
import 'package:safe_route/routes/profile/profile.dart';
import 'package:safe_route/routes/register/register.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      routes:{
        Home.routeName :(_) => Home(),
        CarInfo.routeName:(_)=>CarInfo(),
        Profile.routeName:(_) =>Profile(),
        Login.routeName:(_)=>Login(),
        Register.routeName:(_)=>Register(),
      },
      initialRoute: Login.routeName,
      );
  }
}
//Get