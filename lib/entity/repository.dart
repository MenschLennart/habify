abstract class BackendRepository {
  Future<List<Object?>> save(Object data, String tableName);

  Future<List<Object?>> queryAll(String tableName);

  Future<Object?> queryById(int id, String tableName);

  Future<List<Object?>> queryWhere(String whereClause, String tableName);
}
