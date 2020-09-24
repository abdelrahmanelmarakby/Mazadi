import 'dart:convert';

Favourite favouriteFromJson(String str) => Favourite.fromJson(json.decode(str));

String favouriteToJson(Favourite data) => json.encode(data.toJson());

class Favourite {
  Favourite({
    this.products,
  });

  List<Product> products;

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.productId,
    this.customerId,
    this.customerPhone,
    this.customerProfile,
    this.activeStatus,
    this.thumb,
    this.name,
    this.model,
    this.price,
    this.zone,
    this.manufacturer,
    this.dateAdded,
    this.customerName,
    this.href,
    this.remove,
    this.hrefCustomer,
  });

  String productId;
  String customerId;
  String customerPhone;
  String customerProfile;
  String activeStatus;
  dynamic thumb;
  String name;
  String model;
  String price;
  String zone;
  String manufacturer;
  String dateAdded;
  String customerName;
  String href;
  String remove;
  String hrefCustomer;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        customerId: json["customer_id"],
        customerPhone: json["customer_phone"],
        customerProfile: json["customer_profile"],
        activeStatus: json["active_status"],
        thumb: json["thumb"],
        name: json["name"],
        model: json["model"],
        price: json["price"],
        zone: json["zone"],
        manufacturer: json["manufacturer"],
        dateAdded: json["date_added"],
        customerName: json["customer_name"],
        href: json["href"],
        remove: json["remove"],
        hrefCustomer: json["href_customer"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "customer_id": customerId,
        "customer_phone": customerPhone,
        "customer_profile": customerProfile,
        "active_status": activeStatus,
        "thumb": thumb,
        "name": name,
        "model": model,
        "price": price,
        "zone": zone,
        "manufacturer": manufacturer,
        "date_added": dateAdded,
        "customer_name": customerName,
        "href": href,
        "remove": remove,
        "href_customer": hrefCustomer,
      };
}
