import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:mazadi/Screens/QuickActions.dart';
import 'package:mazadi/consts.dart';

import '../BottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FlutterStatusbarcolor.setStatusBarColor(maincolor);
    FlutterStatusbarcolor.setNavigationBarColor(maincolor);

    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => QuickActionsManager(
                      child: NavBar(),
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/backsplash.png'),
                fit: BoxFit.cover)),
        child: Center(
            child: Image.asset(
          'assets/icons/logo.png',
          width: MediaQuery.of(context).size.width / 2,
        )),
      ),
    );
  }
}
