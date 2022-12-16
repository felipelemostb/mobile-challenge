import 'package:mobile_challenge/core/utils/request_data_utils.dart';

abstract class ILocalDataSource {
  Future fetchDataFromLocal(RequestDataUtils requestDataUtils);
  Future sendDataToLocal(RequestDataUtils requestDataUtils);
  Future deleteDataFromLocal(RequestDataUtils requestDataUtils);
}
