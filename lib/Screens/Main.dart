import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mazadi/Models/Categeoris.dart';
import 'package:mazadi/Models/HomeAds.dart';
import 'package:mazadi/Network/Categories.dart';
import 'package:mazadi/Network/HomeAds.dart';
import 'package:mazadi/Screens/AddAd.dart';
import 'package:mazadi/Screens/AfterPay.dart';
import 'package:mazadi/Screens/Product_Details.dart';
import 'package:mazadi/consts.dart';

import 'Category.dart';
import 'Login.dart';
import 'account.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var reload = false;

  @override
  Widget build(BuildContext context) {
    var wide = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: backcolor,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "ابحث قي مزادي",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: FutureBuilder<CateGories>(
                      future: getCategory(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          CateGories cateGories = snapshot.data;
                          return GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  new SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: MediaQuery.of(context)
                                              .size
                                              .width *
                                          2.5 /
                                          (MediaQuery.of(context).size.height /
                                              4),
                                      crossAxisCount: 2),
                              itemCount: cateGories.categories.length,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Category(
                                              text: cateGories
                                                  .categories[index].categoryId,
                                            ),
                                          ));
                                    },
                                    child: FadeIn(
                                      duration: Duration(seconds: 2),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Image.network(
                                              cateGories
                                                  .categories[index].image,
                                              width: wide / 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              cateGories.categories[index].name,
                                              softWrap: true,
                                              style: TextStyle(
                                                  color: accentcolor,
                                                  fontSize: wide / 40)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
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
              Divider(
                height: 1,
                thickness: 1,
                color: accentcolor,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<HomeAds>(
                  future: getHomeAds(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // ignore: non_constant_identifier_names
                      HomeAds Product = snapshot.data;
                      return Container(
                        // color: Colors.white,
                        decoration: BoxDecoration(
                            color: backcolor,
                            borderRadius: BorderRadius.circular(20)),
                        width: wide,
                        height: high / 1.9,
                        child: ListView.builder(
                            itemExtent: 120,
                            shrinkWrap: true,
                            itemCount: Product.products.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Product_Details(
                                                id: Product
                                                    .products[index].productId,
                                              )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Card(
                                    elevation: 0,
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
                                                Product.products[index].thumb
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
                                                    Product
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
                                                        Product.products[index]
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
                                                                  Product
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
                                                                  Product
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
                                                              Product
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
                                                        Product.products[index]
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
            ],
          )),
    );
  }
}
