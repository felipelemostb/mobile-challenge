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
          "https://img.freepik.com/fotos-gratis/variedade-plana-com-deliciosa-comida-brasileira_23-2148739179.jpg?w=2000",
    );
  }

  factory ImageModel.fromJson(String json) =>
      ImageModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'Image(file: $file, url: $url)';
}
