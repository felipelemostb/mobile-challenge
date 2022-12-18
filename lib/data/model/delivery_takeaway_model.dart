import 'dart:convert';

class DeliveryTakeawayModel {
  bool autoAcceptOrder;
  List<dynamic> siteOptions;

  DeliveryTakeawayModel({
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

  factory DeliveryTakeawayModel.fromMap(Map<String, dynamic> map) {
    return DeliveryTakeawayModel(
      autoAcceptOrder: map["autoAcceptOrder"] ?? false,
      siteOptions: List<dynamic>.from(map["siteOptions"] ?? <dynamic>[]),
    );
  }

  factory DeliveryTakeawayModel.fromJson(String json) =>
      DeliveryTakeawayModel.fromMap(jsonDecode(json));
}
