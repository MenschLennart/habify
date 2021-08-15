import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:habify/entities/repository.dart';
import 'package:habify/entities/user.dart';

class BackendlessRepository implements BackendRepository {
  @override
  Future<Map?> insert(Map data, String tableName) {
    return Backendless.data.of(tableName).save(data);
  }

  @override
  Future<List<Map?>?> queryAll(String tableName) {
    return Backendless.data.of(tableName).find();
  }

  @override
  Future<Map?> queryById(int id, String tableName) {
    return Backendless.data.of(tableName).findById(id.toString());
  }

  @override
  Future<List<Map?>?> queryWhere(String whereClause, String tableName) {
    DataQueryBuilder query = DataQueryBuilder()..whereClause = whereClause;
    return Backendless.data.of(tableName).find(query);
  }

  User? getCurrentUser() {
    Backendless.userService.getCurrentUser().then((value) {
      User user = User();
      user.email = value?.email;
      user.name = value?.getProperty("name");

      return user;
    });
  }
}
