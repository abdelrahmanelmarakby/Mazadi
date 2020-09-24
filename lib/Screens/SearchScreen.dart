import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/ManData.dart';
import 'package:mazadi/Models/Search.dart';
import 'package:mazadi/Models/Zone.dart';

import '../consts.dart';
import 'AddAd.dart';
import 'AfterPay.dart';
import 'Login.dart';
import 'account.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController text = new TextEditingController(text: "");
  var manId = "";
  var zoneID = "";
  @override
  Widget build(BuildContext context) {
    var high = MediaQuery.of(context).size.height;
    var wide = MediaQuery.of(context).size.width;

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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  controller: text,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "كلمة البحث",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            FutureBuilder<Zone>(
                future: getZone(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Zone zone = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 10),
                      child: RaisedButton(
                          color: maincolor,
                          child: Text(
                            "حدد مدينتك",
                            style: GoogleFonts.cairo(
                                color: accentcolor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 8,
                                  scrollable: true,
                                  title: Center(
                                      child: Text(
                                    "المدينة",
                                    style: GoogleFonts.cairo(
                                      fontSize: 20,
                                      color: maincolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                  content: Container(
                                    height: 400,
                                    width: 300,
                                    child: ListView.builder(
                                      itemCount: zone.zones.length,
                                      itemBuilder: (context, index) {
                                        return FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              zoneID = zone.zones[index].zoneId;
                                            });
                                            print(zoneID);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            zone.zones[index].name,
                                            style: GoogleFonts.cairo(
                                                color: maincolor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
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
            FutureBuilder<ManData>(
                future: getLogos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    ManData Logo = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 10),
                      child: RaisedButton(
                          color: maincolor,
                          child: Text(
                            "حدد الشركة",
                            style: GoogleFonts.cairo(
                                color: accentcolor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: backcolor,
                                  elevation: 8,
                                  scrollable: true,
                                  title: Center(
                                      child: Text(
                                    "الشركة",
                                    style: GoogleFonts.cairo(
                                      fontSize: 20,
                                      color: maincolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                  content: Container(
                                    //     color: backcolor,
                                    height: 400,
                                    width: 300,
                                    child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemCount: Logo.manufacturers.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            manId = Logo.manufacturers[index]
                                                .manufacturerId;
                                            print(manId);
                                            Navigator.pop(context);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(30))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.network(
                                                    Logo.manufacturers[index]
                                                        .image,
                                                    height: high / 25,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Text(
                                                    Logo.manufacturers[index]
                                                        .name,
                                                    style: GoogleFonts.cairo(
                                                        color: maincolor,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    getSearchResults();
                    (context as Element).reassemble();
                  },
                  color: maincolor,
                  child: Text(
                    "ابحث",
                    style: GoogleFonts.cairo(
                      color: accentcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      text.text = "";
                      manId = "";
                      zoneID = "";
                    });
                    getSearchResults();
                  },
                  color: maincolor,
                  child: Text(
                    "اعادة تعيين",
                    style: GoogleFonts.cairo(
                      color: accentcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            FutureBuilder<SearchData>(
                future: getSearchResults(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    SearchData results = snapshot.data;

                    return Container(
                        height: (high / 1.7),
                        width: wide,
                        child: ListView.builder(
                            itemExtent: 120,
                            shrinkWrap: true,
                            itemCount: results.products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          FadeInRight(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(12),
                                              ),
                                              child: Image.network(
                                                results.products[index].thumb
                                                    .toString(),
                                                fit: BoxFit.cover,
                                                width: 140,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: ElasticInLeft(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    results
                                                        .products[index].name,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.person),
                                                      Text(
                                                        results.products[index]
                                                            .customerName,
                                                      )
                                                    ],
                                                  ),
                                                  MediaQuery.of(context)
                                                              .size
                                                              .width
                                                              .toInt() >
                                                          1080
                                                      ? Row(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(Icons
                                                                    .location_on),
                                                                Text(
                                                                  results
                                                                      .products[
                                                                          index]
                                                                      .location,
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(Icons
                                                                    .alarm),
                                                                Text(
                                                                  results
                                                                      .products[
                                                                          index]
                                                                      .dateModified,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )
                                                      : Row(
                                                          children: [
                                                            Icon(Icons
                                                                .location_on),
                                                            Text(
                                                              results
                                                                  .products[
                                                                      index]
                                                                  .location,
                                                            ),
                                                          ],
                                                        ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.alarm),
                                                      Text(
                                                        results.products[index]
                                                            .dateModified,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }));
                    /* : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                              child: Text(
                                "لا توجد نتائج",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          );*/
                  } else {
                    return Center();
                  }
                }),
          ],
        ),
      ),
    );
  }

  Future<ManData> getLogos() async {
    final response = await http.get(
      'https://mazadyy.com/index.php?route=api/product/get_all_manufacturers',
    );

    var res = utf8.decode(response.bodyBytes);
    ManData data = ManData.fromJson(json.decode(res));

    return data;
  }

  Future<Zone> getZone() async {
    final response = await http.get(
      'https://mazadyy.com/index.php?route=api/customer_product/get_zones',
    );
    var res = utf8.decode(response.bodyBytes);
    Zone data = Zone.fromJson(json.decode(res));

    return data;
  }

  Future<SearchData> getSearchResults() async {
    final response = await http
        .post('https://mazadyy.com/index.php?route=api/product/search', body: {
      "search_txt": text.text,
      "zone_id": zoneID,
      "manufacturer_id": manId,
    });
    print(zoneID);
    print(manId);
    var res = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);
      print(parsed);
      return SearchData.fromJson(parsed);
    } else {
      throw Exception('asd');
    }
  }
}
