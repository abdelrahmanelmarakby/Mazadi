import 'package:flutter/cupertino.dart';

class Registerstate extends ChangeNotifier {
  String phone;
  String email;
  String password;
  String username;
  String firstname;
  String lastname;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
