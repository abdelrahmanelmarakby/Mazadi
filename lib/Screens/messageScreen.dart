import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mazadi/Models/Messages.dart';

import '../consts.dart';
import 'Login.dart';

class Messages extends StatefulWidget {
  String productID;
  String to;
  Messages({this.productID, this.to});
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  var message = TextEditingController();
  Future<MessagesList> getMessages(String to, String product_id) async {
    print(CId.toString() + to + product_id);
    final response = await http.post(
        'https://mazadyy.com/index.php?route=api/account/peer_messages',
        body: {
          "from": CId.toString(),
          "to": to,
          "p_id": product_id,
          "customer_id": CId.toString(),
        });
    var res = utf8.decode(response.bodyBytes);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);
      //  print(parsed);
      return MessagesList.fromJson(parsed);
      //return parsed.map<HomeAds>((i) => HomeAds.fromJson(i)).toList();
    } else {
      throw Exception('asd');
    }
  }

  Future Send(String to, String productID) async {
    final response = await http.post(
        'https://mazadyy.com/index.php?route=api/account/send_message',
        body: {
          "p_id": productID,
          "from_id": CId.toString(),
          "to_id": to,
          "current_user_id": CId.toString(),
          "reply_txt": message.text,
        });
    var res = utf8.decode(response.bodyBytes);
    print(res);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(res);
    } else {
      throw Exception('asd');
    }
  }

  @override
  Widget build(BuildContext context) {
    var wide = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: high / 1.4,
            child: FutureBuilder<MessagesList>(
                future: getMessages(widget.to, widget.productID),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    MessagesList chat = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: chat.allMessagesArr.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.white,
                                  child: Card(
                                    color: chat.allMessagesArr[index].to ==
                                            CId.toString()
                                        ? Colors.white
                                        : accentcolor,
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        /*crossAxisAlignment:
                                            chat.allMessagesArr[index].customerId != CId
                                                ? CrossAxisAlignment.start
                                                : CrossAxisAlignment.end,*/
                                        children: [
                                          chat.allMessagesArr[index].to ==
                                                  CId.toString()
                                              ? Text(chat.allMessagesArr[index]
                                                  .fromName)
                                              : Text(
                                                  "انت",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                          Divider(
                                            thickness: 2,
                                          ),
                                          chat.allMessagesArr[index].to ==
                                                  CId.toString()
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12),
                                                  child: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0),
                                                          child: Text(
                                                            chat
                                                                .allMessagesArr[
                                                                    index]
                                                                .dateAdded,
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            chat
                                                                .allMessagesArr[
                                                                    index]
                                                                .text,
                                                            style: TextStyle(
                                                                color:
                                                                    accentcolor),
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12),
                                                  child: Expanded(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 8.0),
                                                          child: Text(
                                                            chat
                                                                .allMessagesArr[
                                                                    index]
                                                                .dateAdded,
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            chat
                                                                .allMessagesArr[
                                                                    index]
                                                                .text,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                }),
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                minLines: 2,
                maxLines: 2,
                controller: message,
                //    obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "اكتب رسالة",
                    suffixIcon: Icon(Icons.message),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(
                color: maincolor,
                child: Text(
                  "ارسال",
                  style: GoogleFonts.cairo(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12),
                ),
                onPressed: () async {
                  Send(widget.to, widget.productID);

                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      message.text = "";
                    });
                  });
                  (context as Element).reassemble();
                }),
          )
        ],
      ),
    );
  }
}
