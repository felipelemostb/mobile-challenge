import 'dart:async';

import 'package:mobile_challenge/core/utils/request_data_utils.dart';
import 'package:mobile_challenge/domain/use_case/restaurant_use_case.dart';

enum GetRestaurantsStatus { loading, failed, success }

class BlocRestaurantPage {
  late final RestaurantUseCase _restaurantUseCase;
  BlocRestaurantPage(this._restaurantUseCase);

  StreamController<GetRestaurantsStatus> getRestaurantsStreamController =
      StreamController<GetRestaurantsStatus>.broadcast();

  void fechLocations(RequestDataUtils requestDataUtils) async {
    try {
      getRestaurantsStreamController.add(GetRestaurantsStatus.loading);
      await _restaurantUseCase.fetchRestaurants(requestDataUtils);
      getRestaurantsStreamController.add(GetRestaurantsStatus.success);
    } catch (e) {
      getRestaurantsStreamController.add(GetRestaurantsStatus.failed);
      rethrow;
    }
  }
}
