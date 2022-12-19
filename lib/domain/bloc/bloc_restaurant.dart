import 'dart:async';

import 'package:mobile_challenge/data/model/docs_model.dart';
import 'package:mobile_challenge/domain/use_case/restaurant_use_case.dart';

class RestaurantController {
  late final RestaurantUseCase _restaurantUseCase;
  RestaurantController(this._restaurantUseCase);

  Future<List<DocsModel>> fetchDocs(int offset) async {
    try {
      final response = await _restaurantUseCase.fetchRestaurants(offset);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
