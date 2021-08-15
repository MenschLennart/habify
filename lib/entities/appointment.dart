import 'package:habify/entities/customer.dart';
import 'package:habify/entities/product.dart';

class Appointment {
  DateTime? updated;
  DateTime? created;
  String? title;
  DateTime? time;
  String? objectId;
  String? ownerId;
  String? description;
  int? peopleCount;
  List<dynamic>? category;
  Customer? customer;
  Product? product;

  Map<dynamic, dynamic> toMap() => {
        "updated": this.updated,
        "created": this.created,
        "title": this.title,
        "time": this.time,
        "objectId": this.objectId,
        "ownerId": this.ownerId,
        "description": this.description,
        "peopleCount": this.peopleCount,
        "category": this.category,
        "customer": this.customer,
        "product": this.product,
      };

  Appointment.fromJson(Map json) {
    this.updated = json["updated"] != null
        ? DateTime.fromMillisecondsSinceEpoch(json["updated"])
        : null;
    this.created = DateTime.fromMillisecondsSinceEpoch(json["created"]);
    this.title = json["title"];
    this.time = json["time"];
    this.objectId = json["objectId"];
    this.ownerId = json["ownerId"];
    this.description = json["description"];
    this.peopleCount = json["peopleCount"];
    this.category = json["category"];
    this.customer = json["customer"];
    this.product = json["product"];
  }
}
