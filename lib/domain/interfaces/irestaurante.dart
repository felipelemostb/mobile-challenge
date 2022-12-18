import 'package:mobile_challenge/core/utils/request_data_utils.dart';

abstract class IRestaurante {
  Future fetchRestaurants(RequestDataUtils requestDataUtils);
}
