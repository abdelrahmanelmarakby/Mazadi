class UploadImage {
  List<String> images;

  UploadImage({this.images});

  factory UploadImage.fromJson(Map<String, dynamic> json) {
    return UploadImage(images: parseImage(json['images']));
  }

  static List<String> parseImage(json) {
    return new List<String>.from(json);
  }
}
