import 'package:heureka/entity/secret.dart';

class ParseSecret implements BackendSecret {
  String? applicationId;
  String? androidAppSecret;
  String? iosAppSecret;
  String? jsAppSecret;
  String? customUrl;
  String? keyClientKey;
  String? keyParseServerUrl;

  ParseSecret();
}
