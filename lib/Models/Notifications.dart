class NotificationData {
  String accountPhoto;
  String deleteAllNotifications;
  List<Notifications> notifications;

  NotificationData(
      {this.accountPhoto, this.deleteAllNotifications, this.notifications});

  NotificationData.fromJson(Map<String, dynamic> json) {
    accountPhoto = json['account_photo'];
    deleteAllNotifications = json['delete_all_notifications'];
    if (json['notifications'] != null) {
      notifications = new List<Notifications>();
      json['notifications'].forEach((v) {
        notifications.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_photo'] = this.accountPhoto;
    data['delete_all_notifications'] = this.deleteAllNotifications;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String name;
  String text;
  String dateDiff;
  String photo;
  String customerHref;
  String href;

  Notifications(
      {this.name,
      this.text,
      this.dateDiff,
      this.photo,
      this.customerHref,
      this.href});

  Notifications.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    dateDiff = json['date_diff'];
    photo = json['photo'];
    customerHref = json['customer_href'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['text'] = this.text;
    data['date_diff'] = this.dateDiff;
    data['photo'] = this.photo;
    data['customer_href'] = this.customerHref;
    data['href'] = this.href;
    return data;
  }
}
