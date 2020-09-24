import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/Account.dart';
import 'package:mazadi/Screens/Account%20Modification.dart';
import 'package:mazadi/Screens/Favourites.dart';
import 'package:mazadi/Screens/Notifications.dart';
import 'package:mazadi/Screens/ResetPassword.dart';

import '../consts.dart';
import 'AddAd.dart';
import 'AfterPay.dart';
import 'ChatScreen.dart';
import 'Login.dart';
import 'Product_Details.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

// ignore: non_constant_identifier_names
String USERNAME;

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Future<AccountData> logged() async {
      final response = await http.post(
          'https://mazadyy.com/index.php?route=api/account',
          body: {'customer_id': CId.toString(), 'logged': Logged.toString()});
      var res = utf8.decode(response.bodyBytes);
      AccountData data = AccountData.fromJson(json.decode(res));

      return data;
    }

    @override
    void initState() {
      super.initState();
      logged();
    }

    var wide = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: Logged == true
            ? Drawer(
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
                          height: high / 50,
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
              )
            : Drawer(
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
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 20),
                child: Text(
                  "بيانات العضوية",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              FutureBuilder<AccountData>(
                  future: logged(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      AccountData profile = snapshot.data;
                      USERNAME = profile.customerName;
                      return Container(
                        height: 1000,
                        color: backcolor,
                        child: Column(
                          //scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: FadeIn(
                                duration: Duration(seconds: 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: maincolor, width: .5),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 12.0, top: 20.0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              child: Icon(
                                                Icons.person,
                                                size: 35,
                                                color: accentcolor,
                                              ),
                                              // maxRadius: 20,
                                              radius: 25,
                                              backgroundColor:
                                                  Color(0xfff1f1f1),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "الاسم : ${profile.customerName}",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Text(
                                                    "متصل الان",
                                                    style: TextStyle(
                                                        color: Colors.green),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 12.0, top: 10.0, bottom: 20),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              child: Icon(
                                                Icons.calendar_today,
                                                size: 25,
                                                color: accentcolor,
                                              ),
                                              maxRadius: 25,
                                              backgroundColor:
                                                  Color(0xfff1f1f1),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "${profile.accountCreated}",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              color: accentcolor,
                              thickness: 1.5,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, right: 12, left: 12),
                              child: FadeIn(
                                duration: Duration(seconds: 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: maincolor, width: .5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  height: high / 5.5,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, right: 18),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AccountModificationScreen(),
                                                    ));
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.person,
                                                    color: accentcolor,
                                                    size: 25,
                                                  ),
                                                  Text("تحرير معلومات حسابك"),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            right: 18),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PasswordReset(),
                                                            ));
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.lock_open,
                                                            color: accentcolor,
                                                            size: 25,
                                                          ),
                                                          Text(
                                                              "تغيير الرقم السري"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, right: 18),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          FavouritesScreen(),
                                                    ));
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.favorite,
                                                    color: accentcolor,
                                                    size: 25,
                                                  ),
                                                  Text(" تعديل قائمة رغباتي"),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, right: 18),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NotificationScreen(),
                                                      ));
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.lock_open,
                                                      color: accentcolor,
                                                      size: 25,
                                                    ),
                                                    Text(" الاشعارات"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, right: 18),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Chats(),
                                                ));
                                          },
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.message,
                                                color: accentcolor,
                                                size: 25,
                                              ),
                                              Text("الرسائل"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 12),
                              child: Container(
                                height: high / 1.5,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  border:
                                      Border.all(color: maincolor, width: .5),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "اعلاناتي",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Divider(
                                      color: maincolor,
                                      thickness: .5,
                                    ),
                                    Container(
                                      height: high / 2,
                                      color: Colors.white,
                                      child: ListView.builder(
                                        itemCount: profile.products.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Product_Details(
                                                            id: profile
                                                                .products[index]
                                                                .productId,
                                                          )));
                                            },
                                            child: FadeInUp(
                                              duration: Duration(
                                                  milliseconds: index * 1300),
                                              child: Container(
                                                height: high / 5,
                                                child: Card(
                                                  semanticContainer: true,
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 12.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          child: Image.network(
                                                            profile
                                                                .products[index]
                                                                .image,
                                                            width: wide / 3,
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(profile
                                                              .products[index]
                                                              .name),
                                                          Row(
                                                            children: [
                                                              Icon(Icons.alarm),
                                                              Text(profile
                                                                  .products[
                                                                      index]
                                                                  .dateModified)
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .new_releases),
                                                              Text(profile
                                                                  .products[
                                                                      index]
                                                                  .price)
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(Icons
                                                                  .location_on),
                                                              Text(profile
                                                                  .products[
                                                                      index]
                                                                  .zone)
                                                            ],
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
