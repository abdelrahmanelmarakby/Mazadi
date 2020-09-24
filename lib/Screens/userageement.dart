import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/UserAgreement.dart';

import '../consts.dart';

class UserAgreement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var high = MediaQuery.of(context).size.height;
    return Scaffold(
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
