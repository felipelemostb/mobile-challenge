// enabled: true

import 'dart:convert';

class CustomersQueueModel {
  bool enabled;

  CustomersQueueModel({
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return {
      "enabled": enabled,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory CustomersQueueModel.fromMap(Map<String, dynamic> map) {
    return CustomersQueueModel(
      enabled: map["enabled"] ?? false,
    );
  }

  factory CustomersQueueModel.fromJson(String json) =>
      CustomersQueueModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'CustomersQueue(enabled: $enabled)';
}
