class LoginCred {
  int customerId;
  bool logged;
  String redirect;
  String errorWarning;
  String success;

  LoginCred(
      {this.customerId,
      this.logged,
      this.redirect,
      this.errorWarning,
      this.success});

  LoginCred.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    logged = json['logged'];
    redirect = json['redirect'];
    errorWarning = json['error_warning'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['logged'] = this.logged;
    data['redirect'] = this.redirect;
    data['error_warning'] = this.errorWarning;
    data['success'] = this.success;
    return data;
  }
}
