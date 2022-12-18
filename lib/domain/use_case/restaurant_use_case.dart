// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobile_challenge/core/exception/http_exceptions.dart';
import 'package:mobile_challenge/core/utils/request_data_utils.dart';
import 'package:mobile_challenge/data/infra/client_http/url_api.dart';
import 'package:mobile_challenge/data/repository/repository.dart';
import 'package:mobile_challenge/domain/interfaces/iclient_http_service.dart';
import 'package:mobile_challenge/domain/interfaces/ilocal_data_base.dart';
import 'package:mobile_challenge/domain/interfaces/irestaurante.dart';

class RestaurantUseCase implements IRestaurante {
  late final IClientHttp _clientHttp;
  late final ILocalDataSource _localDataSource;
  RestaurantUseCase(
    this._clientHttp,
    this._localDataSource,
  );

  Repository get _repository => Repository.instance(
        _clientHttp,
        _localDataSource,
      );

  @override
  Future fetchRestaurants(RequestDataUtils requestDataUtils) async {
    try {
      RequestDataUtils requestDataUtils =
          RequestDataUtils(endPoint: UrlApi.getRestaurants, queryParameters: {
        "limit": 5,
        "offset": 2,
      });
      //TODO: Make correct response use.
      Map<String, dynamic> response = await _repository.get(requestDataUtils);
      return response;
    } on HttpExceptions {
      rethrow;
    }
  }
}
