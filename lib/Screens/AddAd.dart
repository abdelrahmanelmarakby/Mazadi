import 'package:flutter/material.dart';
import 'package:mazadi/Models/Categeoris.dart';
import 'package:mazadi/Network/Categories.dart';
import 'package:mazadi/Screens/AddAd2.dart';

import '../consts.dart';
import 'AfterPay.dart';
import 'Login.dart';
import 'account.dart';

var categoryID;

class AddAd1 extends StatefulWidget {
  @override
  _AddAd1State createState() => _AddAd1State();
}

class _AddAd1State extends State<AddAd1> {
  @override
  Widget build(BuildContext context) {
    var wide = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;
    return Directionality(
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
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: FutureBuilder<CateGories>(
                future: getCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    CateGories cateGories = snapshot.data;
                    return ListView.builder(
                      itemCount: cateGories.categories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              categoryID =
                                  cateGories.categories[index].categoryId;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddAd2()));
                            },
                            child: Container(
                              height: high / 12,
                              child: Card(
                                elevation: 6,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: wide / 1.5,
                                      child: ListTile(
                                        hoverColor: maincolor,
                                        //focusColor: Colors.black,
                                        title: Text(
                                          cateGories.categories[index].name,
                                        ),
                                        leading: Image.network(
                                          cateGories.categories[index].image,
                                          width: wide / 10,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ));
                      },
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
          ),
        ),
      ),
    );
  }
}
