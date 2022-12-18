// siteOptions: [ ]

import 'dart:convert';

class ScangoModel {
  List<dynamic> siteOptions;

  ScangoModel({
    required this.siteOptions,
  });

  Map<String, dynamic> toMap() {
    return {
      "siteOptions": siteOptions,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory ScangoModel.fromMap(Map<String, dynamic> map) {
    return ScangoModel(
      siteOptions: List<dynamic>.from(map["siteOptions"] ?? <dynamic>[]),
    );
  }

  factory ScangoModel.fromJson(String json) =>
      ScangoModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'Scango(siteOptions: $siteOptions)';
}
