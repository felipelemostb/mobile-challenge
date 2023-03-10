import 'dart:convert';

class ImageModel {
  String? file;
  String? url;

  ImageModel({
    required this.file,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      "file": file,
      "url": url,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      file: map["file"] ?? "",
      url: map["url"] ??
          "https://www.linguahouse.com/linguafiles/md5/d01dfa8621f83289155a3be0970fb0cb",
    );
  }

  factory ImageModel.fromJson(String json) =>
      ImageModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'Image(file: $file, url: $url)';
}
