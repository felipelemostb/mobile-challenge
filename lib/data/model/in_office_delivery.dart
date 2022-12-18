import 'dart:convert';

import 'delivery_in_office_model.dart';
import 'get_now_model.dart';
import 'delivery_takeaway_model.dart';

class InOfficeDelivery {
  GetNowModel getNow;
  DeliveryInOfficeModel delivery;
  DeliveryTakeawayModel takeaway;

  InOfficeDelivery({
    required this.getNow,
    required this.delivery,
    required this.takeaway,
  });

  Map<String, dynamic> toMap() {
    return {
      "getNow": getNow.toMap(),
      "delivery": delivery.toMap(),
      "takeaway": takeaway.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory InOfficeDelivery.fromMap(Map<String, dynamic> map) {
    return InOfficeDelivery(
      getNow: GetNowModel.fromMap(map["getNow"] ?? <String, dynamic>{}),
      delivery:
          DeliveryInOfficeModel.fromMap(map["delivery"] ?? <String, dynamic>{}),
      takeaway:
          DeliveryTakeawayModel.fromMap(map["takeaway"] ?? <String, dynamic>{}),
    );
  }

  factory InOfficeDelivery.fromJson(String json) =>
      InOfficeDelivery.fromMap(jsonDecode(json));

  @override
  String toString() => 'InOfficeDelivery(getNow: $getNow, delivery: $delivery)';
}
