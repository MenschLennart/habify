import 'package:habify/entities/user.dart';

abstract class BackendRepository {
  Future<Map?> insert(Map data, String tableName);

  Future<List<Map?>?> queryAll(String tableName);

  Future<Map?> queryById(int id, String tableName);

  Future<List<Map?>?> queryWhere(String whereClause, String tableName);

  User? getCurrentUser();
}
