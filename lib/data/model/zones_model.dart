// _id: "5fce6783a119f0db0551778b",
// maxDistanceRadius: 39000,
// deliveryCost: 1,
// avgDeliveryTimeMinutes: 16

import 'dart:convert';

class ZonesModel {
  String id;
  int maxDistanceRadius;
  int deliveryCost;
  int avgDeliveryTimeMinutes;

  ZonesModel({
    required this.id,
    required this.maxDistanceRadius,
    required this.deliveryCost,
    required this.avgDeliveryTimeMinutes,
  });

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "maxDistanceRadius": maxDistanceRadius,
      "deliveryCost": deliveryCost,
      "avgDeliveryTimeMinutes": avgDeliveryTimeMinutes,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory ZonesModel.fromMap(Map<String, dynamic> map) {
    return ZonesModel(
      id: map["_id"] ?? "",
      maxDistanceRadius: map["maxDistanceRadius"] ?? 0,
      deliveryCost: map["deliveryCost"] ?? 0,
      avgDeliveryTimeMinutes: map["avgDeliveryTimeMinutes"] ?? 0,
    );
  }

  factory ZonesModel.fromJson(String json) =>
      ZonesModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Zones(id: $id, maxDistanceRadius: $maxDistanceRadius, deliveryCost: $deliveryCost, avgDeliveryTimeMinutes: $avgDeliveryTimeMinutes)';
  }
}
