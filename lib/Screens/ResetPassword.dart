import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../consts.dart';
import 'Login.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController password = new TextEditingController();
  TextEditingController confirm = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: maincolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: password,
                  //  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "كلمة المرور القديمة",
                      suffixIcon: Icon(Icons.person),
                      suffixStyle: TextStyle(color: Colors.black54),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: confirm,
                  //    obscureText: true,

                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "تأكيد كلمة المرور القديمة",
                      //  suffixStyle: la
                      //  suffixText: modify.firstname,
                      //   suffixStyle: TextStyle(color: Colors.black54),
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                onPressed: resetPassword,
                color: accentcolor,
                child: Text(
                  "تعديل",
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }

  void showFloatingFlushbar(
    BuildContext context,
    String message,
  ) {
    Flushbar(
      padding: EdgeInsets.all(20),
      barBlur: 20,

      borderRadius: 12,
      margin: EdgeInsets.all(20),
      backgroundGradient: LinearGradient(
        colors: [accentcolor, accentcolor],
        stops: [0.7, 1],
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(6, 6),
          blurRadius: 5,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: "خطأ",
      message: message,
      borderColor: Colors.red,
      borderWidth: 6,
      //backgroundColor: Colors.red,
      icon: Icon(
        Icons.clear,
        color: Colors.red,
        size: 40,
      ),
    )..show(context);
  }

  Future resetPassword() async {
    if (password.text != confirm.text) {
      showFloatingFlushbar(
          context, "كلمة المرور و تأكيد كلمة المرور غير متطابقان");
    } else if (password.text.length < 4 || confirm.text.length < 4) {
      showFloatingFlushbar(context, "كلمة المرور او تأكيد كلمة المرور قصيرتان");
    } else {
      final response = await http.post(
          'https://mazadyy.com/index.php?route=api/account/account_edit_password',
          body: {
            'logged': Logged.toString(),
            'customer_id': CId.toString(),
            'password': password.text,
            'confirm': confirm.text,
          });
      var loge = (utf8.decode(response.bodyBytes));
      print(loge);

      return loge;
    }
  }
}
