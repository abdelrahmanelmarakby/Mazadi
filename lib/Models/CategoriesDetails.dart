class CatgoryDetails {
  List<Products> products;
  String categoryName;

  CatgoryDetails({this.products, this.categoryName});

  CatgoryDetails.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['category_name'] = this.categoryName;
    return data;
  }
}

class Products {
  String productId;
  String model;
  String categoryName;
  Null country;
  String customerId;
  String profileImage;
  String manufacturer;
  String zone;
  String manufacturerId;
  String parentManufacturer;
  String parentManufacturerId;
  String thumb;
  String name;
  String description;
  String price;
  String orderPrice;
  bool special;
  String tax;
  String customerName;
  int rating;
  String reviews;
  String viewed;
  String dateAdded;
  String dateModified;
  String location;
  String latAddress;
  String longAddress;
  String fixed;
  String hrefCountry;
  String hrefZone;
  String hrefCustomer;
  String hrefCategory;
  String href;

  Products(
      {this.productId,
      this.model,
      this.categoryName,
      this.country,
      this.customerId,
      this.profileImage,
      this.manufacturer,
      this.zone,
      this.manufacturerId,
      this.parentManufacturer,
      this.parentManufacturerId,
      this.thumb,
      this.name,
      this.description,
      this.price,
      this.orderPrice,
      this.special,
      this.tax,
      this.customerName,
      this.rating,
      this.reviews,
      this.viewed,
      this.dateAdded,
      this.dateModified,
      this.location,
      this.latAddress,
      this.longAddress,
      this.fixed,
      this.hrefCountry,
      this.hrefZone,
      this.hrefCustomer,
      this.hrefCategory,
      this.href});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    model = json['model'];
    categoryName = json['category_name'];
    country = json['country'];
    customerId = json['customer_id'];
    profileImage = json['profile_image'];
    manufacturer = json['manufacturer'];
    zone = json['zone'];
    manufacturerId = json['manufacturer_id'];
    parentManufacturer = json['parent_manufacturer'];
    parentManufacturerId = json['parent_manufacturer_id'];
    thumb = json['thumb'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    orderPrice = json['order_price'];
    special = json['special'];
    tax = json['tax'];
    customerName = json['customer_name'];
    rating = json['rating'];
    reviews = json['reviews'];
    viewed = json['viewed'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    location = json['location'];
    latAddress = json['lat_address'];
    longAddress = json['long_address'];
    fixed = json['fixed'];
    hrefCountry = json['href_country'];
    hrefZone = json['href_zone'];
    hrefCustomer = json['href_customer'];
    hrefCategory = json['href_category'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['model'] = this.model;
    data['category_name'] = this.categoryName;
    data['country'] = this.country;
    data['customer_id'] = this.customerId;
    data['profile_image'] = this.profileImage;
    data['manufacturer'] = this.manufacturer;
    data['zone'] = this.zone;
    data['manufacturer_id'] = this.manufacturerId;
    data['parent_manufacturer'] = this.parentManufacturer;
    data['parent_manufacturer_id'] = this.parentManufacturerId;
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['order_price'] = this.orderPrice;
    data['special'] = this.special;
    data['tax'] = this.tax;
    data['customer_name'] = this.customerName;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['viewed'] = this.viewed;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['location'] = this.location;
    data['lat_address'] = this.latAddress;
    data['long_address'] = this.longAddress;
    data['fixed'] = this.fixed;
    data['href_country'] = this.hrefCountry;
    data['href_zone'] = this.hrefZone;
    data['href_customer'] = this.hrefCustomer;
    data['href_category'] = this.hrefCategory;
    data['href'] = this.href;
    return data;
  }
}
