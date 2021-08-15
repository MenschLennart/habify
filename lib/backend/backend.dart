import 'package:habify/entities/repository.dart';
import 'package:habify/entities/secret.dart';

abstract class BackendService {
  factory BackendService() => BackendService();
  static set secret(BackendSecret backendSecret) {}
  static set repository(BackendRepository backendRepository) {}
  BackendService.initialize();
}
