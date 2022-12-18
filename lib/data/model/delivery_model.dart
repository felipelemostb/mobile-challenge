// provider: "internal",
// enabled: true,
// scheduleAheadMinutes: 4320,

import 'dart:convert';

import 'schedules_model.dart';
import 'zones_model.dart';

class DeliveryModel {
  String provider;
  bool enabled;
  int scheduleAheadMinutes;
  List<SchedulesModel> schedules;
  List<ZonesModel> zones;

  DeliveryModel({
    required this.provider,
    required this.enabled,
    required this.scheduleAheadMinutes,
    required this.schedules,
    required this.zones,
  });

  Map<String, dynamic> toMap() {
    return {
      "provider": provider,
      "enabled": enabled,
      "scheduleAheadMinutes": scheduleAheadMinutes,
      "schedules": schedules.map((schedules) => schedules.toMap()).toList(),
      "zones": zones.map((zones) => zones.toMap()).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory DeliveryModel.fromMap(Map<String, dynamic> map) {
    return DeliveryModel(
      provider: map["provider"] ?? "",
      enabled: map["enabled"] ?? false,
      scheduleAheadMinutes: map["scheduleAheadMinutes"] ?? 0,
      schedules: map["schedules"]
              ?.map<SchedulesModel>(
                  (schedules) => SchedulesModel.fromMap(schedules))
              .toList() ??
          <SchedulesModel>[],
      zones: map["zones"]
              ?.map<ZonesModel>((zones) => ZonesModel.fromMap(zones))
              .toList() ??
          <ZonesModel>[],
    );
  }

  factory DeliveryModel.fromJson(String json) =>
      DeliveryModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Delivery(provider: $provider, enabled: $enabled, scheduleAheadMinutes: $scheduleAheadMinutes, schedules: $schedules, zones: $zones)';
  }
}
