// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobile_challenge/data/model/docs_model.dart';
import 'package:http/http.dart' as http;

class RestaurantUseCase {
  RestaurantUseCase();

  Future<List<DocsModel>> fetchRestaurants(int offset) async {
    try {
      final fetchResponse = await http.get(
        Uri.parse(
          "https://api.dev.wdtek.xyz/restaurants?offset=$offset&limit=3",
        ),
      );
      final responseList = jsonDecode(fetchResponse.body);
      final data = List.from(responseList['docs']).map((e) {
        return DocsModel.fromMap(e);
      }).toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
