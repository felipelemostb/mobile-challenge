// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CuisinesModel {
  final String? id;
  final String name;
  final String tag;
  CuisinesModel({
    required this.id,
    required this.name,
    required this.tag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tag': tag,
    };
  }

  factory CuisinesModel.fromMap(Map<String, dynamic> map) {
    return CuisinesModel(
      id: map['_id'] as String,
      name: map['name']['en'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CuisinesModel.fromJson(String source) =>
      CuisinesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
