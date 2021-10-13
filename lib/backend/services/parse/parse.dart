import 'package:heureka/backend/services/parse/secret.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:heureka/backend/backend.dart';
import 'package:heureka/backend/services/parse/repository.dart';

class ParseService implements BackendService {
  static final ParseService _singleton = new ParseService._internal();

  static ParseRepository _repository = ParseRepository();
  static ParseRepository get repository => _repository;
  static set setRepository(ParseRepository data) {
    _repository = data;
  }

  static ParseSecret _secret = ParseSecret();
  static ParseSecret get secret => _secret;
  static set setSecret(ParseSecret data) {
    _secret = data;
  }

  factory ParseService() {
    return _singleton;
  }
  ParseService._internal();

  @override
  ParseService.initialize({ParseSecret? backendSecret}) {
    ParseSecret dynamicSecret = backendSecret ?? secret;

    Parse().initialize(
      dynamicSecret.applicationId!,
      dynamicSecret.customUrl!,
      clientKey: dynamicSecret.keyClientKey,
      autoSendSessionId: true,
    );

    try {} catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
    }
  }
}
