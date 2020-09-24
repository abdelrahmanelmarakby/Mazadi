import 'dart:async';
import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/Product_Detail.dart';
import 'package:mazadi/Network/Product_Detail.dart';
import 'package:mazadi/Screens/ContactUs.dart';

import '../consts.dart';
import 'Login.dart';

var Pid;

class Product_Details extends StatefulWidget {
  String id;
  Product_Details({this.id});

  @override
  _Product_DetailsState createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  TextEditingController message = TextEditingController();
  TextEditingController messagesent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var wide = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: maincolor, size: 20),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
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
          title: Image.asset(
            logo,
            width: wide / 4,
          ),
        ),
        body: Container(
          color: backcolor,
          child: FutureBuilder<ProductDetail>(
              future: getProduct_Details(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ProductDetail productDetails = snapshot.data;

                  return ListView(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productDetails.product.name,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/person.png',
                                            width: wide / 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(productDetails
                                                .product.location),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/person.png',
                                            width: wide / 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(productDetails
                                                .product.dateModified),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/person.png',
                                            width: wide / 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(productDetails
                                                .product.customerName),
                                          ),
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: accentcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.image,
                                    size: 20, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "صور الاعلان",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 150,
                          width: wide,
                          child: Carousel(
                            dotIncreaseSize: 2,
                            dotIncreasedColor: maincolor,
                            dotPosition: DotPosition.bottomCenter,
                            boxFit: BoxFit.cover,
                            images: List.generate(
                                productDetails.product.attachedImages.length,
                                (index) => ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        productDetails.product
                                            .attachedImages[index].thumb,
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                            dotSize: 6.0,
                            dotSpacing: 15.0,
                            dotColor: accentcolor,
                            animationDuration: Duration(milliseconds: 800),
                            indicatorBgPadding: 5.0,
                            autoplayDuration: Duration(seconds: 10),
                            dotBgColor: Colors.transparent,
                            borderRadius: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: accentcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.asset(
                                    'assets/icons/wallpaper.png',
                                    color: Colors.white,
                                    width: 20,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "تفاصيل الاعلان",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(Icons.image,
                                    size: 20, color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  productDetails.product.description,
                                  style:
                                      TextStyle(fontSize: 14, color: maincolor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: accentcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Image.asset(
                                    'assets/icons/phone.png',
                                    color: Colors.white,
                                    width: 20,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "التواصل",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  productDetails.product.contact,
                                  style:
                                      TextStyle(fontSize: 14, color: maincolor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                              child: CIcon(
                                IconMoon.icon_heart2,
                                color: maincolor,
                              ),
                              splashColor: Colors.red,
                              color: accentcolor,
                              onPressed: () async {
                                if (CId == null || Logged == false) {
                                  showFloatingFlushbar(
                                      context,
                                      'الرجاء تسجيل الدخول اولا',
                                      'انقر هنا لتسجيل الدخول',
                                      Icons.error_outline,
                                      Colors.red);
                                } else {
                                  addWishList(productDetails.product.productId);
                                  showFloatingFlushbar(
                                      context,
                                      'تمت الاضافة الي المفضلة',
                                      'اضغط للتوجه الي المفضلة',
                                      Icons.check,
                                      Colors.green);
                                }
                              }),
                          RaisedButton(
                              child: CIcon(
                                IconMoon.icon_chat_3,
                                color: maincolor,
                              ),
                              splashColor: Colors.white,
                              color: accentcolor,
                              onPressed: () async {
                                //chat
                                //chat
                                Logged == true
                                    ? showCupertinoDialog(
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
                                                        "ارسال الرسالة",
                                                        style:
                                                            GoogleFonts.cairo(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20,
                                                                color:
                                                                    maincolor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                content: Column(
                                                  children: [
                                                    Directionality(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(15.0),
                                                        child: TextFormField(
                                                          minLines: 2,
                                                          maxLines: 2,
                                                          controller:
                                                              messagesent,
                                                          //    obscureText: true,
                                                          decoration: InputDecoration(
                                                              filled: true,
                                                              fillColor:
                                                                  Colors.white,
                                                              labelText:
                                                                  "اكتب رسالة",
                                                              suffixIcon: Icon(
                                                                  Icons
                                                                      .message),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20))),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20),
                                                      child: RaisedButton(
                                                          color: maincolor,
                                                          child: Text(
                                                            "ارسال",
                                                            style: GoogleFonts.cairo(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
                                                          ),
                                                          onPressed: () async {
                                                            Send(
                                                                productDetails
                                                                    .product
                                                                    .productId,
                                                                productDetails
                                                                    .product
                                                                    .customerName);

                                                            Timer(
                                                                Duration(
                                                                    seconds: 2),
                                                                () {
                                                              setState(() {
                                                                messagesent
                                                                    .text = "";
                                                              });
                                                            });
                                                            (context as Element)
                                                                .reassemble();
                                                          }),
                                                    )
                                                  ],
                                                ),
                                              ));
                                        },
                                      )
                                    : showFloatingFlushbar(
                                        context,
                                        "خطأ",
                                        "الرجاء تسجيل الدخول",
                                        Icons.error,
                                        maincolor);

                                //chat
                                //chat
                                //chat
                                //chat
                              }),
                          RaisedButton(
                              child: CIcon(
                                IconMoon.icon_warning,
                                color: maincolor,
                              ),
                              splashColor: Colors.red,
                              color: accentcolor,
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Contact(),
                                    ));
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                              child: CIcon(
                                IconMoon.icon_phone,
                                color: maincolor,
                              ),
                              splashColor: Colors.greenAccent.shade400,
                              color: accentcolor,
                              onPressed: () async {
                                FlutterPhoneState.startPhoneCall(
                                    productDetails.product.contact);
                              }),
                          RaisedButton(
                              splashColor: Colors.greenAccent.shade400,
                              color: accentcolor,
                              child: CIcon(
                                IconMoon.icon_whatsapp,
                                color: maincolor,
                              ),
                              onPressed: () async {
                                var response1 =
                                    await FlutterShareMe().shareToWhatsApp(
                                  msg: productDetails.product.name +
                                      "" +
                                      productDetails.product.productHref,
                                );
                                print(response1);
                                if (response1 == 'success') {
                                  print('navigate success');
                                }
                                var response =
                                    await FlutterShareMe().shareToWhatsApp4Biz(
                                  msg: productDetails.product.name +
                                      "" +
                                      productDetails.product.productHref,
                                );
                                print(response);
                                if (response == 'success') {
                                  print('navigate success');
                                }
                              }),
                          RaisedButton(
                              child: CIcon(
                                IconMoon.icon_twitter,
                                color: maincolor,
                              ),
                              splashColor: Colors.blue,
                              color: accentcolor,
                              onPressed: () async {
                                var response = await FlutterShareMe()
                                    .shareToTwitter(
                                        url:
                                            productDetails.product.hrefCustomer,
                                        msg: productDetails.product.name);
                                if (response == 'success') {
                                  print('navigate success');
                                }
                              }),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 4, right: 4, top: 20, bottom: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: accentcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: CIcon(
                                    IconMoon.icon_comment,
                                    color: Colors.white,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "التعليقات",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: high / 2.6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: accentcolor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: Center(
                                  child: Text(
                                    "اضافة تعليق",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  obscureText: false,
                                  minLines: 4,
                                  maxLines: 8,
                                  controller: message = TextEditingController(),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: "اكتب تعليقك",
                                      suffixIcon: Icon(Icons.message),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                              RaisedButton(
                                  color: accentcolor,
                                  child: Icon(
                                    Icons.send,
                                    color: maincolor,
                                  ),
                                  onPressed: () {
                                    addComment(
                                        productDetails.product.productId);
                                  })
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        child: ListView.builder(
                          itemCount:
                              productDetails.product.customerReviews.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              productDetails
                                                  .product
                                                  .customerReviews[index]
                                                  .dateAdded,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              productDetails
                                                  .product
                                                  .customerReviews[index]
                                                  .author,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: accentcolor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                      Container(
                                        child: Center(
                                          child: Text(productDetails.product
                                              .customerReviews[index].text),
                                        ),
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                      ),
                                    ],
                                  )),
                            );
                          },
                        ),
                      ),
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
        ),
      ),
    );
  }

  Future<ProductDetail> addComment(String productId) async {
    final response = await http
        .post('https://mazadyy.com/index.php?route=api/product/review', body: {
      'customer_id': CId.toString(),
      'logged': Logged.toString(),
      'text': message.text,
      'product_id': productId,
    });
    print(Logged.toString() + message.text + productId.toString());
    print(CId.toString());
    var res = utf8.decode(response.bodyBytes);
    ProductDetail data = ProductDetail.fromJson(json.decode(res));
    print(res);

    return data;
  }

  Future<ProductDetail> addWishList(String productId) async {
    final response = await http.post(
        'https://mazadyy.com/index.php?route=api/product/add_wishlist',
        body: {
          'customer_id': CId.toString(),
          'logged': Logged.toString(),
          'product_id': productId,
        });
    print(Logged.toString() + message.text + productId.toString());
    print(CId.toString());
    var res = utf8.decode(response.bodyBytes);
    ProductDetail data = ProductDetail.fromJson(json.decode(res));
    print(res);

    return data;
  }

  Future Send(String productID, String name) async {
    final response = await http.post(
        'https://mazadyy.com/index.php?route=api/product/send_message',
        body: {
          "logged": Logged.toString(),
          "product_id": productID,
          "name": name,
          "customer_id": CId.toString(),
          "text": messagesent.text,
        });
    print(name);
    var res = utf8.decode(response.bodyBytes);
    print(res);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);
    } else {
      throw Exception('asd');
    }
  }

  void showFloatingFlushbar(BuildContext context, String title, String message,
      IconData icon, Color iconColor) {
    Flushbar(
      padding: EdgeInsets.all(20),
      barBlur: 20,
      flushbarPosition: FlushbarPosition.BOTTOM,
      borderRadius: 12,
      margin: EdgeInsets.all(20),
      backgroundGradient: LinearGradient(
        colors: [accentcolor, accentcolor],
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
      borderColor: iconColor,
      borderWidth: 6,
      //backgroundColor: Colors.red,
      icon: Icon(
        icon,
        color: iconColor,
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
}
