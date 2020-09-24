// To parse this JSON data, do
//
//     final dropDown = dropDownFromJson(jsonString);

import 'dart:convert';

DropDown dropDownFromJson(String str) => DropDown.fromJson(json.decode(str));

String dropDownToJson(DropDown data) => json.encode(data.toJson());

class DropDown {
  DropDown({
    this.categories,
  });

  List<Category> categories;

  factory DropDown.fromJson(Map<String, dynamic> json) => DropDown(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.categoryId,
    this.image,
    this.name,
    this.status,
    this.sortOrder,
  });

  String categoryId;
  String image;
  String name;
  String status;
  String sortOrder;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        image: json["image"],
        name: json["name"],
        status: json["status"],
        sortOrder: json["sort_order"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "image": image,
        "name": name,
        "status": status,
        "sort_order": sortOrder,
      };
}
