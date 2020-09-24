import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/AccountModification.dart';

import '../consts.dart';
import 'Login.dart';

class AccountModificationScreen extends StatefulWidget {
  @override
  _AccountModificationScreenState createState() =>
      _AccountModificationScreenState();
}

class _AccountModificationScreenState extends State<AccountModificationScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: FutureBuilder<AccountModification>(
          future: Accountinfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              AccountModification modify = snapshot.data;
              return ListView(
                children: [
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
                            suffixText: modify.username,
                            suffixIcon: Icon(Icons.person),
                            suffixStyle: TextStyle(color: Colors.black54),
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
                            suffixText: modify.firstname,
                            suffixStyle: TextStyle(color: Colors.black54),
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
                            suffixText: modify.lastname,
                            suffixStyle: TextStyle(color: Colors.black54),
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
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        //    obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            suffixText: modify.email,
                            suffixStyle: TextStyle(color: Colors.black54),
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
                            suffixText: modify.telephone,
                            suffixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RaisedButton(
                      onPressed: accountModification,
                      color: accentcolor,
                      child: Text(
                        "تعديل",
                        style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
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

  Future<AccountModification> Accountinfo() async {
    final response = await http.post(
        'https://mazadyy.com/index.php?route=api/account/account_info',
        body: {"customer_id": CId.toString()});
    var res = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);
      print(parsed);
      return AccountModification.fromJson(parsed);
      //return parsed.map<HomeAds>((i) => HomeAds.fromJson(i)).toList();
    } else {
      throw Exception('asd');
    }
  }

  Future accountModification() async {
    final response = await http.post(
        'https://mazadyy.com/index.php?route=api/account/account_edit',
        body: {
          'logged': Logged.toString(),
          'customer_id': CId.toString(),
          'username': username.text,
          'firstname': FirstName.text,
          'lastname': LastName.text,
          'email': email.text,
          'telephone': phone.text,
        });
    var loge = (utf8.decode(response.bodyBytes));
    print(loge);

    return loge;
  }
}
