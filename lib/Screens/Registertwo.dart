import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../consts.dart';
import 'AddAd.dart';
import 'AfterPay.dart';
import 'Login.dart';
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
