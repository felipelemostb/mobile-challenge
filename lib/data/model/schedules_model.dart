import 'dart:convert';

// repeatsOn: [6,5,4,3]
// _id: "5fce6783a119f0a04a51778c",
// start: "11:00",
// end: "15:00",
// sizeMinutes: 30

class SchedulesModel {
  List<int> repeatsOn;
  String id;
  String start;
  String end;
  int sizeMinutes;

  SchedulesModel({
    required this.repeatsOn,
    required this.id,
    required this.start,
    required this.end,
    required this.sizeMinutes,
  });

  Map<String, dynamic> toMap() {
    return {
      "repeatsOn": repeatsOn,
      "_id": id,
      "start": start,
      "end": end,
      "sizeMinutes": sizeMinutes,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory SchedulesModel.fromMap(Map<String, dynamic> map) {
    return SchedulesModel(
      repeatsOn: List<int>.from(map["repeatsOn"] ?? <int>[]),
      id: map["_id"] ?? "",
      start: map["start"] ?? "",
      end: map["end"] ?? "",
      sizeMinutes: map["sizeMinutes"] ?? 0,
    );
  }

  factory SchedulesModel.fromJson(String json) =>
      SchedulesModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Schedules(repeatsOn: $repeatsOn, id: $id, start: $start, end: $end, sizeMinutes: $sizeMinutes)';
  }
}
