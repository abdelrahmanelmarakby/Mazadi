

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazadi/Screens/AddAd.dart';
import 'package:mazadi/Screens/ChatScreen.dart';
import 'package:mazadi/Screens/Favourites.dart';
import 'package:mazadi/Screens/Main.dart';
import 'package:mazadi/Screens/Notifications.dart';
import 'package:mazadi/consts.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    Home(),
    FavouritesScreen(),
    AddAd1(),
    NotificationScreen(),
    Chats(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('مزادى'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('مفضلة'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                //size: 40,
                //color: maincolor,
              ),
              title: Text('اضافة اعلان'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('التنبيهات'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email),
              title: Text('الرسائل'),
            ),
          ],
          currentIndex: _selectedIndex,
          elevation: 8,
          unselectedItemColor: accentcolor,
          selectedItemColor: maincolor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
