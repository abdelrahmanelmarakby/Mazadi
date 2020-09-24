class MessagesList {
  String fromCustomerHref;
  String toCustomerHref;
  String productHref;
  String senderName;
  List<AllMessagesArr> allMessagesArr;

  MessagesList(
      {this.fromCustomerHref,
      this.toCustomerHref,
      this.productHref,
      this.senderName,
      this.allMessagesArr});

  MessagesList.fromJson(Map<String, dynamic> json) {
    fromCustomerHref = json['from_customer_href'];
    toCustomerHref = json['to_customer_href'];
    productHref = json['product_href'];
    senderName = json['sender_name'];
    if (json['allMessagesArr'] != null) {
      allMessagesArr = new List<AllMessagesArr>();
      json['allMessagesArr'].forEach((v) {
        allMessagesArr.add(new AllMessagesArr.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_customer_href'] = this.fromCustomerHref;
    data['to_customer_href'] = this.toCustomerHref;
    data['product_href'] = this.productHref;
    data['sender_name'] = this.senderName;
    if (this.allMessagesArr != null) {
      data['allMessagesArr'] =
          this.allMessagesArr.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllMessagesArr {
  String reviewId;
  String productId;
  String customerId;
  String to;
  String fromName;
  String productName;
  String toName;
  String text;
  int type;
  String dateAdded;
  String timeAdded;
  String dateDiff;

  AllMessagesArr(
      {this.reviewId,
      this.productId,
      this.customerId,
      this.to,
      this.fromName,
      this.productName,
      this.toName,
      this.text,
      this.type,
      this.dateAdded,
      this.timeAdded,
      this.dateDiff});

  AllMessagesArr.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    to = json['to'];
    fromName = json['fromName'];
    productName = json['productName'];
    toName = json['toName'];
    text = json['text'];
    type = json['type'];
    dateAdded = json['date_added'];
    timeAdded = json['time_added'];
    dateDiff = json['date_diff'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['product_id'] = this.productId;
    data['customer_id'] = this.customerId;
    data['to'] = this.to;
    data['fromName'] = this.fromName;
    data['productName'] = this.productName;
    data['toName'] = this.toName;
    data['text'] = this.text;
    data['type'] = this.type;
    data['date_added'] = this.dateAdded;
    data['time_added'] = this.timeAdded;
    data['date_diff'] = this.dateDiff;
    return data;
  }
}
