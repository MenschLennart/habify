import 'package:heureka/entity/product.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Appointment extends ParseObject {
  String? objectId;
  String? title;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? description;
  int? peopleCount;
  List<Object?>? category;
  Product? product;
  Object? user;

  Appointment(
      {this.objectId,
      this.title,
      this.createdAt,
      this.category,
      this.product,
      this.user,
      this.peopleCount})
      : super("Appointment");

  Object toObject() => toMap();

  Map<dynamic, dynamic> toMap() => {
        "title": this.title,
        "updatedAt": this.updatedAt,
        "createdAt": this.createdAt,
        "objectId": this.objectId,
        "description": this.description,
        "peopleCount": this.peopleCount,
        "category": this.category,
        "product": this.product,
        "user": this.user,
      };
}
