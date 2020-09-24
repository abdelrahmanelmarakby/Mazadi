import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Screens/Main.dart';
import 'package:mazadi/consts.dart';

import 'AddAd.dart';
import 'Login.dart';
import 'account.dart';

class AfterPay extends StatefulWidget {
  @override
  _AfterPayState createState() => _AfterPayState();
}

class _AfterPayState extends State<AfterPay> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController comission = new TextEditingController();
  TextEditingController transfer_name = new TextEditingController();
  TextEditingController transfer_Date = new TextEditingController();
  TextEditingController phone = new TextEditingController();

  TextEditingController notes = new TextEditingController();
  TextEditingController adNum = new TextEditingController();
  TextEditingController Bank = new TextEditingController();
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
        backgroundColor: backcolor,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "عمولة الموقع",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "العمولة أمانة في ذمة المعلن سواء تمت المبايعة عن طريق الموقع أو بسببه، وموضحة قيمتها بما يلي",
                        style: TextStyle(color: accentcolor),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "مصرف الراجحي",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "التفاصيل:",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: accentcolor),
                      ),
                      Text(
                        "ارقم الحساب 8765456456456456",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: accentcolor),
                      ),
                      Text(
                        "الايبان 8765456456456456",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: accentcolor),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "البنك الأهلى",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "التفاصيل:",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: accentcolor),
                      ),
                      Text(
                        "ارقم الحساب 8765456456456456",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: accentcolor),
                      ),
                      Text(
                        "الايبان 8765456456456456",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: accentcolor),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Text(
                          "بعد إرسال المبلغ،يجب مراسلتنا عبر النموذج التالي لأجل تسجيل العمولة باسم عضويتك ثم الحصول على مميزات الموقع الخاصة بالعملاء",
                          style: TextStyle(fontSize: 12, color: accentcolor),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Text(
                        "نموذج تحويل العمولة",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 16, color: maincolor),
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
                            controller: email,
                            //    obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "البريد الالكتروني",
                                suffixIcon: Icon(Icons.mail),
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
                            controller: comission,
                            //     obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "مبلغ العمولة",
                                suffixIcon: Icon(Icons.monetization_on),
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
                            controller: Bank,
                            //  obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "البنك المحول منه",
                                suffixIcon: Icon(Icons.account_balance),
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
                            controller: transfer_Date,
                            //    obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "متى تم التحويل؟",
                                suffixIcon: Icon(Icons.date_range),
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
                            controller: transfer_name,
                            //     obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "اسم المحول",
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
                            controller: phone,
                            //  obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "رقم الجوال المرتبط بعضويتك",
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
                            controller: adNum,
                            //    obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "رقم الإعلان",
                                suffixIcon:
                                    Icon(Icons.format_list_numbered_rtl),
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
                            minLines: 4,
                            maxLines: 8,
                            controller: adNum,
                            //    obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "ملاحظات",
                                suffixIcon:
                                    Icon(Icons.format_list_numbered_rtl),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, bottom: 16, right: 20, left: 20),
              child: RaisedButton(
                onPressed: () {},
                color: accentcolor,
                splashColor: maincolor,
                child: Text(
                  "ارسال",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future Register() async {
    final response = await http
        .post('https://mazadyy.com/index.php?route=api/register', body: {
      'username': username.text,
      'email': email.text,
      'bank': Bank.text,
      'commission_amount': comission.text,
      'telephone': phone.text,
      "transfer_duration": "",
      'transfer_name': transfer_name.text,
      'ad_number': adNum.text,
      'notes': '1'
    });
    var loge = (json.decode(response.body));
    print(loge);
    if (response.body.contains("redirect")) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
    return loge;
  }
}
