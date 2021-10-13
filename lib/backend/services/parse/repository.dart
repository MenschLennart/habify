import 'package:heureka/entity/repository.dart';
import 'package:heureka/entity/user.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ParseRepository implements BackendRepository {
  @override
  Future<List<ParseObject?>> save(Object object, String tableName) async {
    final parseObject = object as ParseObject;
    final ParseResponse apiResponse = await parseObject.save();
    return handleApiResponse(apiResponse) as List<ParseObject>;
  }

  @override
  Future<List<ParseObject?>> queryAll(String tableName) async {
    QueryBuilder<ParseObject> queryAll =
        QueryBuilder<ParseObject>(ParseObject(tableName));
    final ParseResponse apiResponse = await queryAll.query();

    return handleApiResponse(apiResponse);
  }

  @override
  Future<List<ParseObject?>> queryById(int id, String tableName) async {
    QueryBuilder<ParseObject> queryById =
        QueryBuilder<ParseObject>(ParseObject(tableName));
    queryById.whereContains('objectId', id.toString());
    final ParseResponse apiResponse = await queryById.query();

    return handleApiResponse(apiResponse) as List<ParseObject>;
  }

  @override
  Future<List<ParseObject?>> queryWhere(String whereClause, String tableName,
      {int limit = 0}) async {
    QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject(tableName));
    parseQuery.whereEquals(whereClause);
    parseQuery.setLimit(limit);
    final ParseResponse apiResponse = await parseQuery.query();

    return handleApiResponse(apiResponse) as List<ParseObject>;
  }

  Future<List<User?>> getCurrentUser() async {
    QueryBuilder<ParseUser> queryUsers =
        QueryBuilder<ParseUser>(ParseUser.forQuery());
    final ParseResponse apiResponse = await queryUsers.query();

    return handleApiResponse(apiResponse) as List<User>;
  }

  List<ParseObject?> handleApiResponse(ParseResponse apiResponse) {
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    }

    return <ParseObject>[];
  }
}
