// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:mobile_challenge/data/model/name.dart';

class CuisinesModel {
  final String? id;
  final Name name;
  final String tag;
  CuisinesModel({
    required this.id,
    required this.name,
    required this.tag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name.toMap(),
      'tag': tag,
    };
  }

  factory CuisinesModel.fromMap(Map<String, dynamic> map) {
    return CuisinesModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: Name.fromMap(map['name'] as Map<String, dynamic>),
      tag: map['tag'] as String,
    );
  }

  factory CuisinesModel.fromJson(String source) =>
      CuisinesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
