class ProductDetail {
  Product product;

  ProductDetail({this.product});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  String productId;
  String name;
  String description;
  String zone;
  Null country;
  String customerId;
  String customerPhone;
  String customerName;
  String customerEmail;
  int reviews;
  int viewed;
  String dateAdded;
  String dateModified;
  String location;
  String hrefZone;
  String hrefCustomer;
  String productHref;
  String contact;
  String manufacturer;
  String price;
  String thumb;
  List<AttachedImages> attachedImages;
  List<CustomerReviews> customerReviews;

  Product(
      {this.productId,
      this.name,
      this.description,
      this.zone,
      this.country,
      this.customerId,
      this.customerPhone,
      this.customerName,
      this.customerEmail,
      this.reviews,
      this.viewed,
      this.dateAdded,
      this.dateModified,
      this.location,
      this.hrefZone,
      this.hrefCustomer,
      this.productHref,
      this.contact,
      this.manufacturer,
      this.price,
      this.thumb,
      this.attachedImages,
      this.customerReviews});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    description = json['description'];
    zone = json['zone'];
    country = json['country'];
    customerId = json['customer_id'];
    customerPhone = json['customer_phone'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    reviews = json['reviews'];
    viewed = json['viewed'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    location = json['location'];
    hrefZone = json['href_zone'];
    hrefCustomer = json['href_customer'];
    productHref = json['product_href'];
    contact = json['contact'];
    manufacturer = json['manufacturer'];
    price = json['price'];
    thumb = json['thumb'];
    if (json['attached_images'] != null) {
      attachedImages = new List<AttachedImages>();
      json['attached_images'].forEach((v) {
        attachedImages.add(new AttachedImages.fromJson(v));
      });
    }
    if (json['customer_reviews'] != null) {
      customerReviews = new List<CustomerReviews>();
      json['customer_reviews'].forEach((v) {
        customerReviews.add(new CustomerReviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['zone'] = this.zone;
    data['country'] = this.country;
    data['customer_id'] = this.customerId;
    data['customer_phone'] = this.customerPhone;
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['reviews'] = this.reviews;
    data['viewed'] = this.viewed;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['location'] = this.location;
    data['href_zone'] = this.hrefZone;
    data['href_customer'] = this.hrefCustomer;
    data['product_href'] = this.productHref;
    data['contact'] = this.contact;
    data['manufacturer'] = this.manufacturer;
    data['price'] = this.price;
    data['thumb'] = this.thumb;
    if (this.attachedImages != null) {
      data['attached_images'] =
          this.attachedImages.map((v) => v.toJson()).toList();
    }
    if (this.customerReviews != null) {
      data['customer_reviews'] =
          this.customerReviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttachedImages {
  String thumb;

  AttachedImages({this.thumb});

  AttachedImages.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    return data;
  }
}

class CustomerReviews {
  String reviewId;
  String customerId;
  String author;
  String text;
  int rating;
  String hrefCustomer;
  String dateAdded;

  CustomerReviews(
      {this.reviewId,
      this.customerId,
      this.author,
      this.text,
      this.rating,
      this.hrefCustomer,
      this.dateAdded});

  CustomerReviews.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    customerId = json['customer_id'];
    author = json['author'];
    text = json['text'];
    rating = json['rating'];
    hrefCustomer = json['href_customer'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['customer_id'] = this.customerId;
    data['author'] = this.author;
    data['text'] = this.text;
    data['rating'] = this.rating;
    data['href_customer'] = this.hrefCustomer;
    data['date_added'] = this.dateAdded;
    return data;
  }
}
