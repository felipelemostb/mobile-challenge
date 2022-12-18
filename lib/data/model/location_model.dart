import 'dart:convert';

class LocationModel {
  String type;
  List<double> coordinates;

  LocationModel({
    required this.type,
    required this.coordinates,
  });

  Map<String, dynamic> toMap() {
    return {
      "type": type,
      "coordinates": coordinates,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      type: map["type"] ?? "",
      coordinates: List<double>.from(map["coordinates"] ?? <double>[]),
    );
  }

  factory LocationModel.fromJson(String json) =>
      LocationModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'Location(type: $type, coordinates: $coordinates)';
}
