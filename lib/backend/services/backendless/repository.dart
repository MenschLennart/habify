import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:heureka/entity/repository.dart';

class BackendlessRepository implements BackendRepository {
  @override
  Future<List<Object?>> save(Object data, String tableName) async {
    // Backendless use Map instead of Object - cast
    Map? savedObject = await Backendless.data.of(tableName).save(data as Map);
    List<Object?> dataList = [];

    if (savedObject != null) {
      return dataList..add(savedObject);
    }

    return <Object>[];
  }

  @override
  Future<List<Map>> queryAll(String tableName) {
    return Backendless.data.of(tableName).find() as Future<List<Map>>;
  }

  @override
  Future<Object> queryById(int id, String tableName) {
    return Backendless.data.of(tableName).findById(id.toString())
        as Future<Object>;
  }

  @override
  Future<List<Object>> queryWhere(String whereClause, String tableName,
      {int pageSize = 0}) {
    DataQueryBuilder query = DataQueryBuilder()..whereClause = whereClause;

    // Limit if set
    if (pageSize > 0) query.pageSize = pageSize;

    return Backendless.data.of(tableName).find(query) as Future<List<Object>>;
  }

  Future<BackendlessUser?>? getCurrentUser() {
    return Backendless.userService.getCurrentUser();
  }
}
