import 'package:heureka/entity/repository.dart';
import 'package:heureka/entity/secret.dart';

abstract class BackendService {
  factory BackendService() => BackendService();
  static set secret(BackendSecret backendSecret) {}
  static set repository(BackendRepository backendRepository) {}
  BackendService.initialize();
}
