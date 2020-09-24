import 'dart:convert';

AccountModification accountModificationFromJson(String str) =>
    AccountModification.fromJson(json.decode(str));

String accountModificationToJson(AccountModification data) =>
    json.encode(data.toJson());

class AccountModification {
  AccountModification({
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    this.fax,
    this.profileImage,
    this.customFields,
    this.accountCustomField,
  });

  String username;
  String firstname;
  String lastname;
  String email;
  String telephone;
  String fax;
  String profileImage;
  List<CustomField> customFields;
  bool accountCustomField;

  factory AccountModification.fromJson(Map<String, dynamic> json) =>
      AccountModification(
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        telephone: json["telephone"],
        fax: json["fax"],
        profileImage: json["profile_image"],
        customFields: List<CustomField>.from(
            json["custom_fields"].map((x) => CustomField.fromJson(x))),
        accountCustomField: json["account_custom_field"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "fax": fax,
        "profile_image": profileImage,
        "custom_fields":
            List<dynamic>.from(customFields.map((x) => x.toJson())),
        "account_custom_field": accountCustomField,
      };
}

class CustomField {
  CustomField({
    this.customFieldId,
    this.customFieldValue,
    this.name,
    this.type,
    this.value,
    this.location,
    this.required,
    this.sortOrder,
  });

  String customFieldId;
  List<dynamic> customFieldValue;
  String name;
  String type;
  String value;
  String location;
  bool required;
  String sortOrder;

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        customFieldId: json["custom_field_id"],
        customFieldValue:
            List<dynamic>.from(json["custom_field_value"].map((x) => x)),
        name: json["name"],
        type: json["type"],
        value: json["value"],
        location: json["location"],
        required: json["required"],
        sortOrder: json["sort_order"],
      );

  Map<String, dynamic> toJson() => {
        "custom_field_id": customFieldId,
        "custom_field_value":
            List<dynamic>.from(customFieldValue.map((x) => x)),
        "name": name,
        "type": type,
        "value": value,
        "location": location,
        "required": required,
        "sort_order": sortOrder,
      };
}
