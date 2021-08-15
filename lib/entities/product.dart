class Product {
  String? ownerId;
  DateTime? created;
  DateTime? updated;
  String? title;
  double? price;
  String? priceUnit;
  String? description;
  String? objectId;

  Product();

  Map<dynamic, dynamic> toMap() => {
        "ownerId": this.ownerId,
        "created": this.created,
        "updated": this.updated,
        "title": this.title,
        "price": this.price,
        "priceUnit": this.priceUnit,
        "description": this.description,
        "objectId": this.objectId,
      };

  Product.fromJson(Map json) {
    this.ownerId = json["ownerId"];
    this.created = DateTime.fromMillisecondsSinceEpoch(json["created"]);
    this.updated = json["updated"] != null
        ? DateTime.fromMillisecondsSinceEpoch(json["updated"])
        : null;
    this.title = json["title"];
    this.price = json["price"];
    this.priceUnit = json["priceUnit"];
    this.description = json["description"];
    this.objectId = json["objectId"];
  }
}
