import 'dart:convert';

class GetNowModel {
  bool autoAcceptOrder;
  List<dynamic> siteOptions;

  GetNowModel({
    required this.autoAcceptOrder,
    required this.siteOptions,
  });

  Map<String, dynamic> toMap() {
    return {
      "autoAcceptOrder": autoAcceptOrder,
      "siteOptions": siteOptions,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory GetNowModel.fromMap(Map<String, dynamic> map) {
    return GetNowModel(
      autoAcceptOrder: map["autoAcceptOrder"] ?? false,
      siteOptions: List<dynamic>.from(map["siteOptions"] ?? <dynamic>[]),
    );
  }

  factory GetNowModel.fromJson(String json) =>
      GetNowModel.fromMap(jsonDecode(json));

  @override
  String toString() =>
      'GetNow(autoAcceptOrder: $autoAcceptOrder, siteOptions: $siteOptions)';
}
