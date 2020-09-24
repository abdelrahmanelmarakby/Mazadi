import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Screens/account.dart';
import 'package:mazadi/Widgets/RegisterPageView.dart';

import '../consts.dart';
import 'AddAd.dart';
import 'AfterPay.dart';

int CId;
bool Logged = false;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController LoginMail = TextEditingController();
  TextEditingController LoginPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var wide = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;
    void showFloatingFlushbar(
      BuildContext context,
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
        message: "البريد الالكتروني او كلمة المرور غير صحيحة",
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

    Future login() async {
      final response = await http.post(
          'https://mazadyy.com/index.php?route=api/login',
          body: {'email': LoginMail.text, 'password': LoginPass.text});
      var loge = (json.decode(response.body));
      print(loge);
      print((loge['customer_id']));
      CId = int.parse(loge['customer_id']);
      Logged = loge['logged'];
      print(Logged.runtimeType);
      print(CId.runtimeType);
      if (response.body.contains("redirect")) {
        print(LoginMail.text);
        print(LoginPass.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Account()));
      } else if (response.body.contains("error")) {
        showFloatingFlushbar(context);
      }
      return loge;
    }

    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: Logged == true
              ? Directionality(
                  textDirection: TextDirection.rtl,
                  child: Drawer(
                    elevation: 8,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset(
                                    logo,
                                    width: wide / 3,
                                  ),
                                  Icon(Icons.menu)
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Account(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/person.png',
                                    height: wide / 6,
                                    width: wide / 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "مرحبا يا $USERNAME",
                                    style: TextStyle(
                                        //    fontSize: 12,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddAd1(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.person_add,
                                    color: accentcolor,
                                    size: wide / 12,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "اضافة اعلان جديد",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Account(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/creditcard.png',
                                    height: wide / 6,
                                    width: wide / 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "اعلاناتي",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AfterPay(),
                                    ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/creditcard.png',
                                    height: wide / 6,
                                    width: wide / 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "حساب عمولة مزادى",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'BadAD');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/stop.png',
                                    height: wide / 6,
                                    width: wide / 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "قائمة السلع و الاعلانات الممنوعة",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'Agreement');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/wallpaper.png',
                                    height: wide / 6,
                                    width: wide / 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "معاهدة استخدام الخدمة",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'Black');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/warning.png',
                                    height: wide / 6,
                                    width: wide / 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "القائمة السوداء ",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'ContactUs');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/phone.png',
                                    height: wide / 6,
                                    width: wide / 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "اتصل بنا",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Drawer(
                    elevation: 8,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image.asset(
                                    logo,
                                    width: wide / 3,
                                  ),
                                  Icon(Icons.menu)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: high / 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'Login');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/person.png',
                                    height: wide / 6,
                                    width: wide / 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "تسجيل الدخول",
                                    style: TextStyle(
                                        //    fontSize: 12,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'PageView');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.person_add,
                                    color: accentcolor,
                                    size: wide / 12,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "انشاء حساب جديد",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'AfterPay');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/creditcard.png',
                                    height: wide / 6,
                                    width: wide / 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "حساب عمولة مزادى",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'BadAD');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/stop.png',
                                    height: wide / 6,
                                    width: wide / 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "قائمة السلع و الاعلانات الممنوعة",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'Agreement');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/wallpaper.png',
                                    height: wide / 6,
                                    width: wide / 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "معاهدة استخدام الخدمة",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'Black');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/warning.png',
                                    height: wide / 6,
                                    width: wide / 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "القائمة السوداء ",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'ContactUs');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/phone.png',
                                    height: wide / 6,
                                    width: wide / 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "اتصل بنا",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: maincolor, size: 20),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'Search');
                  },
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
            elevation: 8,
            title: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'Nav');
              },
              child: Image.asset(
                logo,
                width: wide / 4,
              ),
            ),
          ),
          body: Container(
            color: Color(0xffF3F3F3),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: ListView(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  Divider(
                    color: accentcolor,
                    indent: wide / 3.5,
                    endIndent: wide / 3.5,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: high / 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
                        controller: LoginMail,
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
                        obscureText: true,
                        controller: LoginPass,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "كلمة السر",
                            suffixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 10),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.lock,
                              color: accentcolor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "هل نسيت الرقم السرى",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, bottom: 16, right: 20, left: 20),
                    child: RaisedButton(
                      onPressed: login,
                      color: accentcolor,
                      splashColor: maincolor,
                      child: Text(
                        "دخول",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: high / 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Pageview()));
                      },
                      color: maincolor,
                      splashColor: accentcolor,
                      child: Text(
                        "انشاء حساب جديد",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
