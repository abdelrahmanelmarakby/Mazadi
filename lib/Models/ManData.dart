class ManData {
  List<Manufacturers> manufacturers;

  ManData({this.manufacturers});

  ManData.fromJson(Map<String, dynamic> json) {
    if (json['manufacturers'] != null) {
      manufacturers = new List<Manufacturers>();
      json['manufacturers'].forEach((v) {
        manufacturers.add(new Manufacturers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.manufacturers != null) {
      data['manufacturers'] =
          this.manufacturers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manufacturers {
  String manufacturerId;
  String parentId;
  String categoryId;
  String name;
  String image;
  String sortOrder;

  Manufacturers(
      {this.manufacturerId,
      this.parentId,
      this.categoryId,
      this.name,
      this.image,
      this.sortOrder});

  Manufacturers.fromJson(Map<String, dynamic> json) {
    manufacturerId = json['manufacturer_id'];
    parentId = json['parent_id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    sortOrder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['manufacturer_id'] = this.manufacturerId;
    data['parent_id'] = this.parentId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    return data;
  }
}
