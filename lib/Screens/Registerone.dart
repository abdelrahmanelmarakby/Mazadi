import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mazadi/Screens/Login.dart';
import 'package:mazadi/Widgets/RegisterPageView.dart';

import '../consts.dart';
import 'AddAd.dart';
import 'AfterPay.dart';
import 'Registertwo.dart';
import 'account.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var high = MediaQuery.of(context).size.height;
    var wide = MediaQuery.of(context).size.width;

    return Scaffold(
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
        color: maincolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: ListView(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "انشاء حساب",
                    style: TextStyle(fontSize: 18, color: accentcolor),
                  ),
                ),
              ),
              Divider(
                color: accentcolor,
                indent: wide / 3,
                endIndent: wide / 3,
                thickness: 2,
              ),
              SizedBox(
                height: high / 12,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: username,
                    //  obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "اسم المستخدم",
                        suffixIcon: Icon(Icons.person),
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
                    controller: FirstName,
                    //    obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "الاسم الاول",
                        suffixIcon: Icon(Icons.person),
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
                    controller: LastName,
                    //     obscureText: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "الاسم الاخير",
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 16, right: 20, left: 20),
                child: RaisedButton(
                  onPressed: () {
                    Controller.jumpToPage(page: 1);
                  },
                  color: accentcolor,
                  splashColor: maincolor,
                  child: Text(
                    "التالي",
                    style: GoogleFonts.cairo(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  color: accentcolor,
                  splashColor: maincolor,
                  child: Text(
                    "لديك حساب",
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
