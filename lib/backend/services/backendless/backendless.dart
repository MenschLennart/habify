import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:heureka/backend/backend.dart';
import 'package:heureka/backend/services/backendless/repository.dart';
import 'package:heureka/entity/secret.dart';

class BackendlessService implements BackendService {
  static final BackendlessService _singleton =
      new BackendlessService._internal();

  static BackendlessRepository _repository = BackendlessRepository();
  static BackendlessRepository get repository => _repository;
  static set setRepository(BackendlessRepository data) {
    _repository = data;
  }

  static BackendSecret _secret = BackendSecret();
  static BackendSecret get secret => _secret;
  static set setSecret(BackendSecret data) {
    _secret = data;
  }

  factory BackendlessService() {
    return _singleton;
  }
  BackendlessService._internal();

  @override
  BackendlessService.initialize({BackendSecret? backendSecret}) {
    BackendSecret dynamicSecret = backendSecret ?? secret;

    try {
      Backendless.setUrl(dynamicSecret.customUrl!);
      Backendless.initApp(
        applicationId: dynamicSecret.applicationId,
        androidApiKey: dynamicSecret.androidAppSecret,
        iosApiKey: dynamicSecret.iosAppSecret,
        jsApiKey: dynamicSecret.jsAppSecret,
      );
    } catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
    }
  }
}
