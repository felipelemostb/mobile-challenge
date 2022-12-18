import 'dart:convert';

class SubscriptionsModel {
  bool wefood;

  SubscriptionsModel({
    required this.wefood,
  });

  Map<String, dynamic> toMap() {
    return {
      "wefood": wefood,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory SubscriptionsModel.fromMap(Map<String, dynamic> map) {
    return SubscriptionsModel(
      wefood: map["wefood"] ?? false,
    );
  }

  factory SubscriptionsModel.fromJson(String json) =>
      SubscriptionsModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'Subscriptions(wefood: $wefood)';
}
