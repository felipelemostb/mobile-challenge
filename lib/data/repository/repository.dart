import 'package:mobile_challenge/core/exception/http_exceptions.dart';
import 'package:mobile_challenge/core/utils/request_data_utils.dart';
import 'package:mobile_challenge/domain/interfaces/ilocal_data_base.dart';
import 'package:mobile_challenge/domain/interfaces/iclient_http_service.dart';

class Repository extends IClientHttp with ILocalDataSource {
  final ILocalDataSource _localDataSource;
  final IClientHttp _clientHttp;

  Repository(
    this._clientHttp,
    this._localDataSource,
  );

  factory Repository.instance(
    IClientHttp _clientHttp,
    ILocalDataSource _localDataSource,
  ) =>
      Repository(
        _clientHttp,
        _localDataSource,
      );

  @override
  Future delete(RequestDataUtils requestDataUtils) async {
    try {
      return await _clientHttp.delete(requestDataUtils);
    } on HttpExceptions catch (e) {
      if (e.statusCode == 401) {
        try {
          final response = await _clientHttp.delete(requestDataUtils);
          return response;
        } catch (e) {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  @override
  Future get(RequestDataUtils requestDataUtils) async {
    try {
      return await _clientHttp.get(requestDataUtils);
    } on HttpExceptions catch (e) {
      if (e.statusCode == 401) {
        try {
          final response = await _clientHttp.get(requestDataUtils);
          return response;
        } catch (e) {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  @override
  Future patch(RequestDataUtils requestDataUtils) async {
    try {
      return await _clientHttp.patch(requestDataUtils);
    } on HttpExceptions catch (e) {
      if (e.statusCode == 401) {
        try {
          final response = await _clientHttp.patch(requestDataUtils);
          return response;
        } catch (e) {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  @override
  Future post(RequestDataUtils requestDataUtils) async {
    try {
      return await _clientHttp.post(requestDataUtils);
    } on HttpExceptions catch (e) {
      if (e.statusCode == 401) {
        try {
          final response = await _clientHttp.post(requestDataUtils);
          return response;
        } catch (e) {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  @override
  Future put(RequestDataUtils requestDataUtils) async {
    try {
      return await _clientHttp.put(requestDataUtils);
    } on HttpExceptions catch (e) {
      if (e.statusCode == 401) {
        try {
          final response = await _clientHttp.put(requestDataUtils);
          return response;
        } catch (e) {
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  @override
  Future sendDataToLocal(RequestDataUtils requestDataUtils) async {
    try {
      await _localDataSource.sendDataToLocal(requestDataUtils);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteDataFromLocal(RequestDataUtils requestDataUtils) async {
    try {
      await _localDataSource.deleteDataFromLocal(requestDataUtils);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future fetchDataFromLocal(RequestDataUtils requestDataUtils) async {
    try {
      return await _localDataSource.fetchDataFromLocal(requestDataUtils);
    } catch (e) {
      rethrow;
    }
  }
}
