import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mazadi/Models/HomeAds.dart';

Future<HomeAds> getHomeAds() async {
  final response = await http.get(
    'https://mazadyy.com/index.php?route=api/home',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var res = utf8.decode(response.bodyBytes);
  if (response.statusCode == 200) {
    final parsed = jsonDecode(res);

    return HomeAds.fromJson(parsed);
    //return parsed.map<HomeAds>((i) => HomeAds.fromJson(i)).toList();
  } else {
    throw Exception('asd');
  }
}
