class AccountData {
  String profileImage;
  String customerName;
  String approved;
  String accountCreated;
  String connected;
  String edit;
  String password;
  String wishlistUrl;
  String notification;
  String inbox;
  List<Products> products;

  AccountData(
      {this.profileImage,
      this.customerName,
      this.approved,
      this.accountCreated,
      this.connected,
      this.edit,
      this.password,
      this.wishlistUrl,
      this.notification,
      this.inbox,
      this.products});

  AccountData.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    customerName = json['customer_name'];
    approved = json['approved'];
    accountCreated = json['account_created'];
    connected = json['connected'];
    edit = json['edit'];
    password = json['password'];
    wishlistUrl = json['wishlist_url'];
    notification = json['notification'];
    inbox = json['inbox'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    data['customer_name'] = this.customerName;
    data['approved'] = this.approved;
    data['account_created'] = this.accountCreated;
    data['connected'] = this.connected;
    data['edit'] = this.edit;
    data['password'] = this.password;
    data['wishlist_url'] = this.wishlistUrl;
    data['notification'] = this.notification;
    data['inbox'] = this.inbox;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String productId;
  String image;
  String name;
  String model;
  String price;
  String zone;
  String manufacturer;
  String dateAdded;
  String dateModified;
  bool special;
  String quantity;
  String status;
  String statusType;
  String href;
  String edit;
  String delete;

  Products(
      {this.productId,
      this.image,
      this.name,
      this.model,
      this.price,
      this.zone,
      this.manufacturer,
      this.dateAdded,
      this.dateModified,
      this.special,
      this.quantity,
      this.status,
      this.statusType,
      this.href,
      this.edit,
      this.delete});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    image = json['image'];
    name = json['name'];
    model = json['model'];
    price = json['price'];
    zone = json['zone'];
    manufacturer = json['manufacturer'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    special = json['special'];
    quantity = json['quantity'];
    status = json['status'];
    statusType = json['status_type'];
    href = json['href'];
    edit = json['edit'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['model'] = this.model;
    data['price'] = this.price;
    data['zone'] = this.zone;
    data['manufacturer'] = this.manufacturer;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['special'] = this.special;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['status_type'] = this.statusType;
    data['href'] = this.href;
    data['edit'] = this.edit;
    data['delete'] = this.delete;
    return data;
  }
}
