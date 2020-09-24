import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/Manufucturer.dart';
import 'package:mazadi/Screens/AddAd2.dart';

import '../consts.dart';
import 'AddAd.dart';
import 'AddAd3.dart';
import 'AfterPay.dart';
import 'Login.dart';
import 'account.dart';

List<String> categoryIDs = [""];
var parentID = "0";

class AddAd4 extends StatefulWidget {
  @override
  _AddAd4State createState() => _AddAd4State();
}

class _AddAd4State extends State<AddAd4> {
  TextEditingController AdTitle = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();
  var manufacturerID;
  DateTime model;
  void showProductDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: maincolor,
      transitionDuration: Duration(milliseconds: 200),
      context: context,
      pageBuilder: (_, __, ___) {
        return FutureBuilder<Manufacturer>(
            future: getManufucturer(categoryID, parentID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Manufacturer dropdown = snapshot.data;

                return Container(
                  height: 400,
                  width: 200,
                  child: ListView.builder(
                    itemCount: dropdown.manufacturers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: RaisedButton(
                            child: Text(
                              dropdown.manufacturers[index].name,
                              style: GoogleFonts.cairo(
                                  color: maincolor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () async {
//                                                categoryID = dropdown
//                                                    .categories[index]
//                                                    .categoryId;
                              //  categoryID="";
                              parentID =
                                  dropdown.manufacturers[index].manufacturerId;
                              manufacturerID = parentID;
                              print(parentID);

                              Manufacturer newDropDown =
                                  await getManufucturer(categoryID, parentID);

                              Navigator.pop(context);
                              Navigator.pop(context);
                            }),
                      );
                    },
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
            });
      },
      transitionBuilder: (_, anim, __, child) {
        return ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0).animate(anim),
          child: child,
        );
      },
    );
  }

/*  */
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
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
        body: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ListView(children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: AdTitle,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "عنوان الاعلان",
                      suffixIcon: Icon(Icons.note),
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
                  controller: phone,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),

                  //  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "طريقة التواصل",
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
                  controller: price,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: false, signed: false),
                  //  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "السعر",
                      suffixIcon: Icon(Icons.account_balance_wallet),
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
                  controller: description,
                  minLines: 4,
                  maxLines: 10,
                  //  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "الوصف",
                      suffixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            (categoryID == "1841"
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: RaisedButton(
                      color: maincolor,
                      child: Text(
                        "اختار التاريخ",
                        style: GoogleFonts.cairo(
                            color: accentcolor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        DateTime newDateTime = await showRoundedDatePicker(
                          context: context,
                          theme: ThemeData(
                              primaryColor: maincolor,
                              accentColor: accentcolor,
                              dialogBackgroundColor: Colors.black,
                              textTheme: TextTheme(
                                bodyText2:
                                    GoogleFonts.cairo(color: accentcolor),
                                caption: GoogleFonts.cairo(color: maincolor),
                              )),
                          initialDatePickerMode: DatePickerMode.year,
                          locale: Locale('en', 'US'),
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 100),
                          lastDate: DateTime(DateTime.now().year + 1),
                          borderRadius: 16,
                        );
                        if (newDateTime != null) {
                          setState(() => model = newDateTime);
                        }
                      },
                    ),
                  )
                : Container()),
            FutureBuilder<Manufacturer>(
                future: getManufucturer(categoryID, parentID),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Manufacturer dropdown = snapshot.data;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: RaisedButton(
                          color: maincolor,
                          child: Text(
                            "اختر الشركة",
                            style: GoogleFonts.cairo(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: accentcolor),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      content: StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Container(
                                          height: 400,
                                          width: 200,
                                          child: ListView.builder(
                                            itemCount:
                                                dropdown.manufacturers.length,
                                            itemBuilder: (context, index) {
                                              return RaisedButton(
                                                  child: Text(
                                                    dropdown
                                                        .manufacturers[index]
                                                        .name,
                                                    style: GoogleFonts.cairo(
                                                        color: maincolor,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  onPressed: () async {
//
                                                    parentID = dropdown
                                                        .manufacturers[index]
                                                        .manufacturerId;

                                                    Manufacturer newDropDown =
                                                        await getManufucturer(
                                                            categoryID,
                                                            parentID);

                                                    showProductDialog();
                                                  });
                                            },
                                          ),
                                        );
                                      }),
                                    ));
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
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Container(
                height: 60,
                child: RaisedButton(
                    elevation: 8,
                    onPressed: () async {
                      AddAD();
                      //   Phoenix.rebirth(context);
                    },
                    color: accentcolor,
                    child: Text(
                      "اضافة الاعلان",
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: maincolor),
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<Manufacturer> getManufucturer(String categoryID, String Parent) async {
    final response = await http.post(
        'https://mazadyy.com/index.php?route=api/customer_product/get_manufacturers',
        body: {'cat_id': "$categoryID", "parent_id": parentID});
    var res = utf8.decode(response.bodyBytes);
    //print(res);

    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);
      //  CateGories c = CateGories.fromJson(parsed);
      //  print(c.categories[1].name);
      var data = Manufacturer.fromJson(parsed);
      return data;
    } else {
      throw Exception('asd');
    }
  }

  Future AddAD() async {
    print("zoneID=$zoneID");
    print("zoneID=$location");
    print("zoneID=$manufacturerID");
    if (zoneID == null) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Center(
                child: Text(
                  "طلب غير مكتمل",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red[900]),
                ),
              ),
              content: Text(
                "الرجاء اختيار المدينة",
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
          );
        },
      );
    }
    if (AdTitle.text == null || AdTitle.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Center(
                child: Text(
                  "طلب غير مكتمل",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red[900]),
                ),
              ),
              content: Text(
                "الرجاء اضافة عنوان الاعلان",
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
          );
        },
      );
    }
    if (location == null || location.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Center(
                child: Text(
                  "طلب غير مكتمل",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red[900]),
                ),
              ),
              content: Text(
                "برجاء الرجوع والضغط علي زر حدد موقعك و فتح و تشغيل تحديد الموقع من الاعدادت اذا لم يكن مفعلا مع اضافة صلاحية استخدام الموقع",
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
          );
        },
      );
    }
    if (phone.text == null || phone.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Center(
                child: Text(
                  "طلب غير مكتمل",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red[900]),
                ),
              ),
              content: Text(
                "الرجاء اضافة طريقة التواصل",
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
          );
        },
      );
    }
    if (description.text == null || description.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Center(
                child: Text(
                  "طلب غير مكتمل",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red[900]),
                ),
              ),
              content: Text(
                "الرجاء اضافة وصف الاعلان",
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
          );
        },
      );
    }

    if (model == null || model.year.toString().isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: Center(
                child: Text(
                  "طلب غير مكتمل",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red[900]),
                ),
              ),
              content: Text(
                "الرجاء اختيار التاريخ",
                style: TextStyle(color: Colors.red[900]),
              ),
            ),
          );
        },
      );
    }

    if (manufacturerID == null || int.parse(manufacturerID) == 0) {
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
                "الرجاء اختيار الشركة",
                style: TextStyle(color: maincolor),
              ),
            ),
          );
        },
      );
    }
    void showFloatingFlushbar(
      BuildContext context,
      String title,
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
        title: title,
        message: message,
        borderColor: Colors.red,
        borderWidth: 6,
        //backgroundColor: Colors.red,
        icon: Icon(
          Icons.clear,
          color: Colors.red,
          size: 40,
        ),
        onTap: (flushbar) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        },
      )..show(context);
    }

    if (Logged != true) {
      showFloatingFlushbar(context, "الرجاء تسجيل الدخول", "طلب عير مكتمل");
    } else {
      final response = await http.post(
          'https://mazadyy.com/index.php?route=api/customer_product/add',
          body: {
            'zone_id': zoneID.toString(),
            'location': location.toString(),
            "product_name": AdTitle.text,
            "product_description": description.text,
            'contact': phone.text,
            "price": price.text,
            "manufacturer_id": parentID,
            "model": model.year.toString(),
            "product_category": categoryID.toString(),
            "images": images
                .toString()
                .replaceAll("[", "")
                .replaceAll("]", "")
                .replaceAll(" ", ""),
            "logged": Logged.toString(),
            "customer_id": CId.toString(),
          });
      var res = utf8.decode(response.bodyBytes);
      print(res);
      print(Logged.toString() + price.toString());

      if (response.statusCode == 200) {
        final parsed = jsonDecode(res);
        var data = Manufacturer.fromJson(parsed);
        return data;
      } else {
        throw Exception('asd');
      }
    }
  }
}
