import 'dart:convert';

import 'cards_model.dart';

class InRestaurantModel {
  List<dynamic> accepted;
  CardsModel cards;

  InRestaurantModel({
    required this.accepted,
    required this.cards,
  });

  Map<String, dynamic> toMap() {
    return {
      "accepted": accepted,
      "cards": cards,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory InRestaurantModel.fromMap(Map<String, dynamic> map) {
    return InRestaurantModel(
      accepted: List<dynamic>.from(map["accepted"] ?? <dynamic>[]),
      cards: CardsModel.fromMap(map["cards"] ?? <String, dynamic>{}),
    );
  }

  factory InRestaurantModel.fromJson(String json) =>
      InRestaurantModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'InRestaurant(accepted: $accepted, cards: $cards)';
}
