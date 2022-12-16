// ignore: depend_on_referenced_packages
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_challenge/core/utils/request_data_utils.dart';
import 'package:mobile_challenge/domain/interfaces/ilocal_data_base.dart';

class SecureStorageSource implements ILocalDataSource {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future deleteDataFromLocal(RequestDataUtils requestDataUtils) async {
    try {
      await _secureStorage.delete(key: requestDataUtils.key!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future fetchDataFromLocal(RequestDataUtils requestDataUtils) async {
    try {
      String? dataFromSecureStorage =
          await _secureStorage.read(key: (requestDataUtils.key ?? ""));
      return dataFromSecureStorage;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future sendDataToLocal(RequestDataUtils requestDataUtils) async {
    try {
      await _secureStorage.write(
        key: requestDataUtils.key!,
        value: requestDataUtils.data,
      );
    } catch (e) {
      rethrow;
    }
  }
}
