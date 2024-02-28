import 'package:flutter/material.dart';
import 'package:safe_route/routes/home/tabs/control_tab/control_tab.dart';
import 'package:safe_route/routes/home/tabs/home_tab/home_tab.dart';
import 'package:safe_route/routes/home/tabs/maps_tab/maps_tab.dart';
import 'package:safe_route/routes/home/tabs/navigation_tab/navigation_tab.dart';


import 'package:safe_route/routes/home/tabs/settings_tab/settings_tab.dart';

import '../utils/app_colors.dart';

class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTap = 0;
  List<Widget> tabs = [
    HomeTab(),
    ControlTab(),
    TAnimation(),
    MapsTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: tabs[currentTap],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: AppColors.accentColor),
          child: BottomNavigationBar(
            currentIndex: currentTap,
            onTap: (tappedTap) {
              currentTap = tappedTap;
              setState(() {});
            },
            showUnselectedLabels: true,
            selectedFontSize: 12,
            iconSize: 26,
            selectedItemColor: AppColors.primaryColor,
            items: const [
              BottomNavigationBarItem(
                  label: "Home", icon: Icon(Icons.home_filled)),
              BottomNavigationBarItem(
                  label: "Control", icon: Icon(Icons.control_point_rounded)),
              BottomNavigationBarItem(
                  label: "Navigation", icon: Icon(Icons.assistant_navigation)),
              BottomNavigationBarItem(
                  label: "Maps", icon: Icon(Icons.map_outlined)),
              BottomNavigationBarItem(
                  label: "Settings", icon: Icon(Icons.settings))
            ],
          ),
        ),
      ),
    );
  }
}
