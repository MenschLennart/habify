import 'package:heureka/backend/services/parse/parse.dart';
import 'package:heureka/entity/user.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LoginRegisterModel {
  Future<bool> login(String email, String password) async {
    final ParseUser user = ParseUser(email, password, null);

    ParseResponse response = await user.login().onError(
        (error, stackTrace) => throw Exception('Exception on Login: $error'));

    if (response.success) {
      return true;
    }

    return false;
  }

  Future<bool> register(String email, String password) async {
    final ParseUser user = ParseUser(email, password, null);
    ParseResponse response = await user.save().onError((error, stackTrace) =>
        throw Exception('Exception on Register: $error'));

    if (response.success) {
      return true;
    }

    return false;
  }
}
