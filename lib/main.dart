import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazadi/BottomNavBar.dart';
import 'package:mazadi/Screens/AfterPay.dart';
import 'package:mazadi/Screens/BlackList.dart';
import 'package:mazadi/Screens/Category.dart';
import 'package:mazadi/Screens/HowTo.dart';
import 'package:mazadi/Screens/Login.dart';
import 'package:mazadi/Screens/Main.dart';
import 'package:mazadi/Screens/SearchScreen.dart';
import 'package:mazadi/Screens/SplashScreen.dart';
import 'package:mazadi/Screens/userageement.dart';
import 'package:mazadi/Widgets/RegisterPageView.dart';
import 'package:mazadi/consts.dart';

import 'Screens/ContactUs.dart';

void main() {
  runApp(Phoenix(child: MyApp()));
}

ThemeData theme = ThemeData(
    iconTheme: IconThemeData(color: maincolor),
    accentColor: accentcolor,
    primaryColor: maincolor,
    textTheme: TextTheme(
        bodyText1: GoogleFonts.cairo(
            color: maincolor, fontWeight: FontWeight.bold, fontSize: 12),
        headline2: GoogleFonts.cairo(
            color: maincolor, fontWeight: FontWeight.bold, fontSize: 12),
        headline1: GoogleFonts.cairo(
            color: maincolor, fontWeight: FontWeight.bold, fontSize: 12),
        bodyText2: GoogleFonts.cairo(
            color: maincolor, fontWeight: FontWeight.bold, fontSize: 12),
        caption: GoogleFonts.cairo(
            color: maincolor, fontWeight: FontWeight.bold, fontSize: 12),
        subtitle1: GoogleFonts.cairo(
            color: maincolor, fontWeight: FontWeight.bold, fontSize: 12)));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        //'Splash': (BuildContext context) => Splash(),
        'Login': (BuildContext context) => LoginScreen(),
        'Agreement': (BuildContext context) => UserAgreement(),
        'Category': (BuildContext context) => Category(),
        'PageView': (BuildContext context) => Pageview(),
        'AfterPay': (BuildContext context) => AfterPay(),
        'Banned': (BuildContext context) => Howto(),
        'Black': (BuildContext context) => BlackList(),
        'ContactUs': (BuildContext context) => Contact(),
        'Search': (BuildContext context) => Search(),
        'Home': (BuildContext context) => Home(),
        'Nav': (BuildContext context) => NavBar(),
        "BadAD": (BuildContext context) => Howto()
      },
    );
  }
}
