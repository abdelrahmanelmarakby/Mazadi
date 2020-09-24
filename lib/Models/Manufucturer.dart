import 'dart:convert';

Manufacturer manufacturerFromJson(String str) =>
    Manufacturer.fromJson(json.decode(str));

String manufacturerToJson(Manufacturer data) => json.encode(data.toJson());

class Manufacturer {
  Manufacturer({
    this.manufacturers,
  });

  List<ManufacturerElement> manufacturers;

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
        manufacturers: List<ManufacturerElement>.from(
            json["manufacturers"].map((x) => ManufacturerElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "manufacturers":
            List<dynamic>.from(manufacturers.map((x) => x.toJson())),
      };
}

class ManufacturerElement {
  ManufacturerElement({
    this.manufacturerId,
    this.parentId,
    this.categoryId,
    this.name,
    this.image,
    this.sortOrder,
  });

  String manufacturerId;
  String parentId;
  String categoryId;
  String name;
  String image;
  String sortOrder;

  factory ManufacturerElement.fromJson(Map<String, dynamic> json) =>
      ManufacturerElement(
        manufacturerId: json["manufacturer_id"],
        parentId: json["parent_id"],
        categoryId: json["category_id"],
        name: json["name"],
        image: json["image"],
        sortOrder: json["sort_order"],
      );

  Map<String, dynamic> toJson() => {
        "manufacturer_id": manufacturerId,
        "parent_id": parentId,
        "category_id": categoryId,
        "name": name,
        "image": image,
        "sort_order": sortOrder,
      };
}
