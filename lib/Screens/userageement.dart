import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/UserAgreement.dart';

import '../consts.dart';
import 'AddAd.dart';
import 'AfterPay.dart';
import 'Login.dart';
import 'account.dart';

class UserAgreement extends StatelessWidget {
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
      backgroundColor: backcolor,
      body: FutureBuilder(
          future: getInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserAgree data = snapshot.data;
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(child: Text(data.title)),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.description
                                .replaceAll("</p>", "")
                                .replaceAll("<p>", "")
                                .replaceAll("<br>", ""),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      )),
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 12,
                  backgroundColor: maincolor,
                ),
              );
            }
          }),
    );
  }

  Future<UserAgree> getInfo() async {
    final response = await http.post(
        'https://mazadyy.com/index.php?route=api/information',
        body: {"information_id": "28"});
    var res = utf8.decode(response.bodyBytes);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);
      //  CateGories c = CateGories.fromJson(parsed);
      //  print(c.categories[1].name);
      return UserAgree.fromJson(parsed);
    } else {
      throw Exception('asd');
    }
  }
}
