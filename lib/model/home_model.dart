import 'package:heureka/backend/services/parse/parse.dart';
import 'package:heureka/entity/appointment.dart';

class HomeModel {
  Future<List<Appointment?>> fetchAppointments() async {
    String? userId = await getCurrentUserId();
    return await ParseService.repository
        .queryWhere("objectId = '$userId'", "Appointment") as List<Appointment>;
  }

  Future<List<Appointment?>> saveAppointment(Appointment appointment) async {
    return await ParseService.repository.save(appointment, 'Appointment')
        as List<Appointment>;
  }

  Future<String?> getCurrentUserId() async {
    return await ParseService.repository
        .getCurrentUser()
        .then((value) => value.first?.objectId);
  }
}
