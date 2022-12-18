import 'dart:convert';

import 'in_restaurant_model.dart';

class PaymentsInfoModel {
  InRestaurantModel inRestaurant;

  PaymentsInfoModel({
    required this.inRestaurant,
  });

  Map<String, dynamic> toMap() {
    return {
      "inRestaurant": inRestaurant.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory PaymentsInfoModel.fromMap(Map<String, dynamic> map) {
    return PaymentsInfoModel(
      inRestaurant:
          InRestaurantModel.fromMap(map["inRestaurant"] ?? <String, dynamic>{}),
    );
  }

  factory PaymentsInfoModel.fromJson(String json) =>
      PaymentsInfoModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'PaymentsInfo(inRestaurant: $inRestaurant)';
}
