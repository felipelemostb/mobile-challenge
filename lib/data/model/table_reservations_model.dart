// enabled: true

import 'dart:convert';

class TableReservationsModel {
  bool enabled;

  TableReservationsModel({
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return {
      "enabled": enabled,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory TableReservationsModel.fromMap(Map<String, dynamic> map) {
    return TableReservationsModel(
      enabled: map["enabled"] ?? false,
    );
  }

  factory TableReservationsModel.fromJson(String json) =>
      TableReservationsModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'TableReservations(enabled: $enabled)';
}
