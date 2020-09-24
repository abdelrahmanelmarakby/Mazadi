import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mazadi/Models/Product_Detail.dart';

Future<ProductDetail> getProduct_Details(String productID) async {
  final response = await http.post(
      'https://mazadyy.com/index.php?route=api/product',
      body: {"product_id": productID});
  var res = utf8.decode(response.bodyBytes);
  if (response.statusCode == 200) {
    final parsed = jsonDecode(res);

    return ProductDetail.fromJson(parsed);
    //return parsed.map<HomeAds>((i) => HomeAds.fromJson(i)).toList();
  } else {
    throw Exception('asd');
  }
}
