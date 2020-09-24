import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../consts.dart';
import 'account.dart';

TextEditingController username = TextEditingController();
TextEditingController FirstName = TextEditingController();
TextEditingController LastName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirm = TextEditingController();

class Registertwo extends StatefulWidget {
  @override
  _RegistertwoState createState() => _RegistertwoState();
}

class _RegistertwoState extends State<Registertwo> {
  @override
  Widget build(BuildContext context) {
    var high = MediaQuery.of(context).size.height;
    var wide = MediaQuery.of(context).size.width;
    Future Register() async {
      if (username.text.isEmpty ||
          FirstName.text.isEmpty ||
          LastName.text.isEmpty ||
          email.text.isEmpty ||
          phone.text.isEmpty ||
          password.text.isEmpty ||
          confirm.text.isEmpty) {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: AlertDialog(
                title: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.error,
                        color: accentcolor,
                        size: 60,
                      ),
                      Text(
                        "طلب غير مكتمل",
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: maincolor),
                      ),
                    ],
                  ),
                ),
                content: Text(
                  "الرجاء ملء جميع البيانات",
                  style: TextStyle(color: maincolor),
                ),
              ),
            );
          },
        );
      } else {
        final response = await http
            .post('https://mazadyy.com/index.php?route=api/register', body: {
          'username': username.text,
          'firstname': FirstName.text,
          'lastname': LastName.text,
          'email': email.text,
          'telephone': phone.text,
          'password': password.text,
          'confirm': confirm.text,
          'agree': '1'
        });
        var loge = (json.decode(response.body));
        print(loge);
        if (response.body.contains("redirect")) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Account()));
        }
        return loge;
      }
    }

    return Scaffold(
      backgroundColor: accentcolor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: maincolor, size: 20),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Icon(
                Icons.search,
                color: maincolor,
                size: wide / 12,
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          logo,
          width: wide / 4,
        ),
      ),
      body: Container(
        color: accentcolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "انشاء حساب",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Divider(
                color: maincolor,
                indent: wide / 3,
                endIndent: wide / 3,
                thickness: 2,
              ),
              SizedBox(
                height: high / 16,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    //    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "البريد الالكتروني",
                        suffixIcon: Icon(Icons.email),
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
                    keyboardType: TextInputType.numberWithOptions(),
                    controller: phone,
                    //   obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "الهاتف",
                        suffixIcon: Icon(Icons.phone),
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
                    keyboardType: TextInputType.text,
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "كلمة المرور",
                        suffixIcon: Icon(Icons.lock),
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
                    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "تأكيد كلمة المرور",
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              SizedBox(
                height: high / 20,
              ),
              RaisedButton(
                onPressed: () {
                  Register();
                },
                color: maincolor,
                child: Text(
                  "تسجيل",
                  style: GoogleFonts.cairo(
                    color: accentcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
