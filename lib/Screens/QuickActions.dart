import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mazadi/Screens/AddAd.dart';
import 'package:mazadi/Screens/ChatScreen.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsManager extends StatefulWidget {
  final Widget child;
  QuickActionsManager({Key key, this.child}) : super(key: key);

  _QuickActionsManagerState createState() => _QuickActionsManagerState();
}

class _QuickActionsManagerState extends State<QuickActionsManager> {
  final QuickActions quickActions = QuickActions();
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState() {
    super.initState();
    _setupQuickActions();
    _handleQuickActions();
  }

  void _setupQuickActions() {
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
          type: 'action_main',
          localizedTitle: "اضافة اعلان",
          icon: Platform.isAndroid ? 'add' : 'QuickBox'),
      ShortcutItem(
          type: 'action_help',
          localizedTitle: 'الرسائل',
          icon: Platform.isAndroid ? "message" : 'QuickHeart')
    ]);
  }

  void _handleQuickActions() {
    quickActions.initialize((shortcutType) {
      if (shortcutType == 'action_main') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddAd1()));
      } else if (shortcutType == 'action_help') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Chats()));
      }
    });
  }
}
/*


*/

/* _setupQuickActions();
    _handleQuickActions();*/
/*
void _setupQuickActions() {
  quickActions.setShortcutItems(<ShortcutItem>[
    ShortcutItem(
        type: 'action_main',
        localizedTitle: 'اضافة اعلان',
        icon: Platform.isAndroid ? 'quick_box' : 'QuickBox'),
    ShortcutItem(
        type: 'action_help',
        localizedTitle: 'الرسائل',
        icon: Platform.isAndroid ? 'quick_heart' : 'QuickHeart')
  ]);
}*/ /*
void _handleQuickActions() {
  quickActions.initialize((shortcutType) {
    if (shortcutType == 'action_main') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddAd1()));
    } else if (shortcutType == 'action_help') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Chats()));
    }
  });
}*/
