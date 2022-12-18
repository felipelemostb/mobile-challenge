// enabled: true,
// scheduleAheadMinutes: 2880,

import 'dart:convert';

import 'schedules_model.dart';

class TakeawayModel {
  bool enabled;
  int scheduleAheadMinutes;
  List<SchedulesModel> schedules;

  TakeawayModel({
    required this.enabled,
    required this.scheduleAheadMinutes,
    required this.schedules,
  });

  Map<String, dynamic> toMap() {
    return {
      "enabled": enabled,
      "scheduleAheadMinutes": scheduleAheadMinutes,
      "schedules": schedules.map((schedules) => schedules.toMap()).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory TakeawayModel.fromMap(Map<String, dynamic> map) {
    return TakeawayModel(
      enabled: map["enabled"] ?? false,
      scheduleAheadMinutes: map["scheduleAheadMinutes"] ?? 0,
      schedules: map["schedules"]
              ?.map<SchedulesModel>(
                  (schedules) => SchedulesModel.fromMap(schedules))
              .toList() ??
          <SchedulesModel>[],
    );
  }

  factory TakeawayModel.fromJson(String json) =>
      TakeawayModel.fromMap(jsonDecode(json));

  @override
  String toString() =>
      'Takeaway(enabled: $enabled, scheduleAheadMinutes: $scheduleAheadMinutes, schedules: $schedules)';
}
