// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:mobile_challenge/core/exception/http_exceptions.dart';
import 'package:mobile_challenge/core/utils/request_data_utils.dart';
import 'package:mobile_challenge/domain/interfaces/iclient_http_service.dart';
import 'package:mobile_challenge/domain/interfaces/ilocal_data_base.dart';

class DioClient extends IClientHttp {
  DioClient(this._secureStorageService);
  final ILocalDataSource _secureStorageService;
  final Dio _dio = Dio();

  @override
  Future get(RequestDataUtils requestDataUtils) async {
    try {
      String? token = await _secureStorageService
          .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));

      Response response = await _dio.get(
        requestDataUtils.endPoint!,
        queryParameters: requestDataUtils.queryParameters,
        options: requestDataUtils.needsToken!
            ? Options(
                headers: {'Authorization': 'Bearer $token'},
              )
            : null,
      );
      return response.data;
    } on DioError catch (e) {
      throw HttpExceptions.triggerException(e.response?.statusCode);
    }
  }

  @override
  Future post(RequestDataUtils requestDataUtils) async {
    try {
      String? token = await _secureStorageService
          .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));

      Response response = await _dio.post(
        requestDataUtils.endPoint!,
        data: requestDataUtils.data,
        options: requestDataUtils.needsToken!
            ? Options(
                headers: {'Authorization': 'Bearer $token'},
              )
            : null,
      );
      return response.data;
    } on DioError catch (e) {
      throw HttpExceptions.triggerException(e.response?.statusCode);
    }
  }

  @override
  Future delete(RequestDataUtils requestDataUtils) async {
    try {
      String? token = await _secureStorageService
          .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));

      Response response = await _dio.delete(
        requestDataUtils.endPoint!,
        data: requestDataUtils.data,
        options: requestDataUtils.needsToken!
            ? Options(
                headers: {'Authorization': 'Bearer $token'},
              )
            : null,
      );
      return response.data;
    } on DioError catch (e) {
      throw HttpExceptions.triggerException(e.response?.statusCode);
    }
  }

  @override
  Future put(RequestDataUtils requestDataUtils) async {
    try {
      String? token = await _secureStorageService
          .fetchDataFromLocal(RequestDataUtils(key: requestDataUtils.key));

      Response response = await _dio.put(
        requestDataUtils.endPoint!,
        data: requestDataUtils.data,
        options: requestDataUtils.needsToken!
            ? Options(
                headers: {
                  "Content-type": "application/json",
                  'Authorization': 'Bearer $token'
                },
              )
            : null,
      );
      return response.data;
    } on DioError catch (e) {
      throw HttpExceptions.triggerException(e.response?.statusCode);
    }
  }

  @override
  Future patch(RequestDataUtils requestDataUtils) {
    throw UnimplementedError();
  }
}
