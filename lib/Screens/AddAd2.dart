import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/Zone.dart';

import '../consts.dart';
import 'AddAd.dart';
import 'AddAd3.dart';
import 'AfterPay.dart';
import 'Login.dart';
import 'account.dart';

String zoneID;
String location;

class AddAd2 extends StatefulWidget {
  final String CategoryId;
  AddAd2({Key key, this.CategoryId}) : super(key: key);

  @override
  _AddAd2State createState() => _AddAd2State();
}

class _AddAd2State extends State<AddAd2> {
  @override
  void initState() {
    super.initState();
    getUserLocation();
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
        colors: [maincolor, maincolor],
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
      title: "تم تحديد الموقع",
      message: message,
      borderColor: Colors.green,
      borderWidth: 6,
      //backgroundColor: Colors.red,
      icon: Icon(
        Icons.check,
        color: Colors.green,
        size: 40,
      ),
    )..show(context);
  }

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
        body: ListView(
          children: [
            /*Padding(
              padding: const EdgeInsets.all(15.0),
              child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("موقعك : $first")),
            ),*/
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  height: high / 2.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('اتفاقية العمولة', style: TextStyle(fontSize: 18)),
                      Text(
                          'بسم الله الرحمن الرحيم قال الله تعالى:" وَأَوْفُواْ بِعَهْدِ اللهِ إِذَا عَاهَدتُّمْ وَلاَ',
                          style: TextStyle(fontSize: 12)),
                      Text(
                          'تَنقُضُواْ الأَيْمَانَ بَعْدَ تَوْكِيدِهَا وَقَدْ جَعَلْتُمُ اللهَ عَلَيْكُمْ كَفِيلاً " صدق الله العظيم',
                          style: TextStyle(fontSize: 12)),
                      Divider(
                        color: accentcolor,
                        thickness: 1,
                      ),
                      Text(
                        " اتعهد واقسم بالله أنا المعلن أن أدفع عمولة الموقع وهي 1% من قيمة البيع سواء تم البيع عن طريق الموقع أو بسببه كما أتعهد بدفع العمولة خلال 10 أيام من استلام كامل مبلغ المبايعة",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  getUserLocation();
                  showFloatingFlushbar(context, location);
                },
                color: maincolor,
                splashColor: accentcolor,
                child: Text(
                  "حدد موقعك",
                  style: GoogleFonts.cairo(
                      color: accentcolor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
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
                                            zoneID = zone.zones[index].zoneId;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: RaisedButton(
                  child: Text(
                    "التالى",
                    style: GoogleFonts.cairo(
                        fontSize: 14,
                        color: maincolor,
                        fontWeight: FontWeight.bold),
                  ),
                  color: accentcolor,
                  splashColor: maincolor,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAd3()))),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> getUserLocation() async {
    final latlon = await Geolocator().getCurrentPosition();
    final coordinates = new Coordinates(latlon.latitude, latlon.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
    location = first.featureName;
  }

  Future<Zone> getZone() async {
    final response = await http.get(
      'https://mazadyy.com/index.php?route=api/customer_product/get_zones',
    );
    var res = utf8.decode(response.bodyBytes);
    Zone data = Zone.fromJson(json.decode(res));
    // print(response.body);

    return data;
  }
}
