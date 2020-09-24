import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mazadi/Models/Categeoris.dart';

Future<CateGories> getCategory() async {
  final response = await http.get(
    'https://mazadyy.com/index.php?route=api/header_category',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var res = utf8.decode(response.bodyBytes);

  if (response.statusCode == 200) {
    final parsed = jsonDecode(res);
    //  CateGories c = CateGories.fromJson(parsed);
    //  print(c.categories[1].name);
    return CateGories.fromJson(parsed);
  } else {
    throw Exception('asd');
  }
}
