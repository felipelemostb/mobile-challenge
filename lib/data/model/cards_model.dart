import 'dart:convert';

class CardsModel {
  List<dynamic> method;
  List<dynamic> authorizers;

  CardsModel({
    required this.method,
    required this.authorizers,
  });

  Map<String, dynamic> toMap() {
    return {
      "method": method,
      "authorizers": authorizers,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CardsModel.fromMap(Map<String, dynamic> map) {
    return CardsModel(
      method: List<dynamic>.from(map["method"] ?? <dynamic>[]),
      authorizers: List<dynamic>.from(map["authorizers"] ?? <dynamic>[]),
    );
  }

  factory CardsModel.fromJson(String json) =>
      CardsModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'Cards(method: $method, authorizers: $authorizers)';
}
