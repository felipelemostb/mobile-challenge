// ignore_for_file: depend_on_referenced_packages

import 'package:mobile_challenge/core/utils/request_data_utils.dart';
import 'package:mobile_challenge/domain/interfaces/ilocal_data_base.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteSource implements ILocalDataSource {
  @override
  Future deleteDataFromLocal(RequestDataUtils requestDataUtils) async {
    try {
      Database database = await _callDatabase(
        requestDataUtils.databaseName!,
        requestDataUtils.databaseVersion!,
      );
      final dataFromDb = await database.delete(requestDataUtils.tableName!);
      return dataFromDb;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future fetchDataFromLocal(RequestDataUtils requestDataUtils) async {
    try {
      Database database = await _callDatabase(
        requestDataUtils.databaseName!,
        requestDataUtils.databaseVersion!,
      );
      List<Map<String, Object?>> dataFromDb =
          await database.query(requestDataUtils.tableName!);
      return dataFromDb.first;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future sendDataToLocal(RequestDataUtils requestDataUtils) async {
    try {
      Database database = await _callDatabase(
        requestDataUtils.databaseName!,
        requestDataUtils.databaseVersion!,
        tableName: requestDataUtils.tableName!,
        tableVariables: requestDataUtils.tableVariables,
      );
      final dataFromDb = await database.insert(
        requestDataUtils.tableName!,
        requestDataUtils.data,
      );
      // ignore: unused_local_variable
      var data = dataFromDb;
    } catch (e) {
      rethrow;
    }
  }

  Future<Database> _callDatabase(
    String dbName,
    int dbVersion, {
    String? tableName,
    String? tableVariables,
  }) async {
    try {
      String databasePath =
          await getDatabasesPath().then((path) => "$path/$dbName");
      Database database = await openDatabase(databasePath, version: dbVersion,
          onCreate: (database, version) async {
        await database.execute("CREATE TABLE $tableName $tableVariables");
      });
      return database;
    } catch (e) {
      rethrow;
    }
  }
}
