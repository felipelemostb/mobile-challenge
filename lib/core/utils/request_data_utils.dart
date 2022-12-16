class RequestDataUtils {
  dynamic data;
  String? key;
  String? endPoint;
  bool? needsToken;
  String? databaseName;
  String? tableName;
  String? sqlCode;
  String? tableVariables;
  int? databaseVersion;
  Map<String, dynamic>? queryParameters;
  dynamic cancelToken;

  RequestDataUtils({
    this.data,
    this.key,
    this.endPoint,
    this.needsToken,
    this.databaseName,
    this.tableName,
    this.sqlCode,
    this.tableVariables,
    this.databaseVersion,
    this.queryParameters,
    this.cancelToken,
  });
}
