import 'dart:convert';

HomeAds homeAdsFromJson(String str) => HomeAds.fromJson(json.decode(str));

String homeAdsToJson(HomeAds data) => json.encode(data.toJson());

class HomeAds {
  HomeAds({
    this.products,
  });

  List<Product> products;

  factory HomeAds.fromJson(Map<String, dynamic> json) => HomeAds(
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
    this.model,
    this.categoryName,
    this.zone,
    this.country,
    this.customerId,
    this.manufacturer,
    this.manufacturerId,
    this.parentManufacturer,
    this.parentManufacturerId,
    this.thumb,
    this.name,
    this.description,
    this.price,
    this.special,
    this.tax,
    this.customerName,
    this.rating,
    this.reviews,
    this.viewed,
    this.dateAdded,
    this.dateModified,
    this.location,
    this.fixed,
    this.hrefCountry,
    this.hrefZone,
    this.hrefCustomer,
    this.hrefCategory,
    this.href,
  });

  String productId;
  String model;
  String categoryName;
  String zone;
  dynamic country;
  String customerId;
  String manufacturer;
  String manufacturerId;
  String parentManufacturer;
  String parentManufacturerId;
  dynamic thumb;
  String name;
  String description;
  String price;
  bool special;
  String tax;
  String customerName;
  int rating;
  String reviews;
  String viewed;
  String dateAdded;
  String dateModified;
  String location;
  String fixed;
  String hrefCountry;
  String hrefZone;
  String hrefCustomer;
  String hrefCategory;
  String href;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        model: json["model"],
        categoryName: json["category_name"],
        zone: json["zone"],
        country: json["country"],
        customerId: json["customer_id"],
        manufacturer: json["manufacturer"],
        manufacturerId: json["manufacturer_id"],
        parentManufacturer: json["parent_manufacturer"] == null
            ? null
            : json["parent_manufacturer"],
        parentManufacturerId: json["parent_manufacturer_id"],
        thumb: json["thumb"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        special: json["special"],
        tax: json["tax"],
        customerName: json["customer_name"],
        rating: json["rating"],
        reviews: json["reviews"],
        viewed: json["viewed"],
        dateAdded: json["date_added"],
        dateModified: json["date_modified"],
        location: json["location"],
        fixed: json["fixed"],
        hrefCountry: json["href_country"],
        hrefZone: json["href_zone"],
        hrefCustomer: json["href_customer"],
        hrefCategory: json["href_category"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "model": model,
        "category_name": categoryName,
        "zone": zone,
        "country": country,
        "customer_id": customerId,
        "manufacturer": manufacturer,
        "manufacturer_id": manufacturerId,
        "parent_manufacturer":
            parentManufacturer == null ? null : parentManufacturer,
        "parent_manufacturer_id": parentManufacturerId,
        "thumb": thumb,
        "name": name,
        "description": description,
        "price": price,
        "special": special,
        "tax": tax,
        "customer_name": customerName,
        "rating": rating,
        "reviews": reviews,
        "viewed": viewed,
        "date_added": dateAdded,
        "date_modified": dateModified,
        "location": location,
        "fixed": fixed,
        "href_country": hrefCountry,
        "href_zone": hrefZone,
        "href_customer": hrefCustomer,
        "href_category": hrefCategory,
        "href": href,
      };
}
