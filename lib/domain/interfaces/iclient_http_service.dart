import 'package:mobile_challenge/core/utils/request_data_utils.dart';

abstract class IClientHttp {
  Future<dynamic> get(RequestDataUtils requestDataUtils);
  Future<dynamic> post(RequestDataUtils requestDataUtils);
  Future<dynamic> put(RequestDataUtils requestDataUtils);
}
