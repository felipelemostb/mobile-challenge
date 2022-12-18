import 'dart:convert';

class DeliveryInOfficeModel {
  bool autoAcceptOrder;
  List<dynamic> siteOptions;

  DeliveryInOfficeModel({
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

  factory DeliveryInOfficeModel.fromMap(Map<String, dynamic> map) {
    return DeliveryInOfficeModel(
      autoAcceptOrder: map["autoAcceptOrder"] ?? false,
      siteOptions: List<dynamic>.from(map["siteOptions"] ?? <dynamic>[]),
    );
  }

  factory DeliveryInOfficeModel.fromJson(String json) =>
      DeliveryInOfficeModel.fromMap(jsonDecode(json));

  @override
  String toString() =>
      'DeliveryInOfficeDelivery(autoAcceptOrder: $autoAcceptOrder, siteOptions: $siteOptions)';
}
