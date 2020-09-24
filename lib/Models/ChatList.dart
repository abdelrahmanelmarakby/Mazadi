// To parse this JSON data, do
//
//     final chatList = chatListFromJson(jsonString);

import 'dart:convert';

ChatList chatListFromJson(String str) => ChatList.fromJson(json.decode(str));

String chatListToJson(ChatList data) => json.encode(data.toJson());

class ChatList {
  ChatList({
    this.messages,
  });

  List<Message> messages;

  factory ChatList.fromJson(Map<String, dynamic> json) => ChatList(
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    this.reviewId,
    this.productId,
    this.customerId,
    this.to,
    this.author,
    this.name,
    this.profileImage,
    this.text,
    this.dateAdded,
    this.dateDiff,
  });

  String reviewId;
  String productId;
  String customerId;
  String to;
  String author;
  String name;
  String profileImage;
  String text;
  String dateAdded;
  String dateDiff;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        reviewId: json["review_id"],
        productId: json["product_id"],
        customerId: json["customer_id"],
        to: json["to"],
        author: json["author"],
        name: json["name"],
        profileImage: json["profile_image"],
        text: json["text"],
        dateAdded: json["date_added"],
        dateDiff: json["date_diff"],
      );

  Map<String, dynamic> toJson() => {
        "review_id": reviewId,
        "product_id": productId,
        "customer_id": customerId,
        "to": to,
        "author": author,
        "name": name,
        "profile_image": profileImage,
        "text": text,
        "date_added": dateAdded,
        "date_diff": dateDiff,
      };
}
