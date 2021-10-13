class Customer {
  String? email;
  String? objectId;
  String? lastname;
  String? password;
  DateTime? created;
  String? firstname;
  String? picture;
  DateTime? updated;
  String? ownerId;

  Customer();

  Object toObject() => toMap();

  Map<dynamic, dynamic> toMap() => {
        "email": this.email,
        "objectId": this.objectId,
        "lastname": this.lastname,
        "password": this.password,
        "created": this.created,
        "firstname": this.firstname,
        "picture": this.picture,
        "updated": this.updated,
        "ownerId": this.ownerId,
      };

  Customer.fromJson(Map json) {
    this.email = json["email"];
    this.objectId = json["objectId"];
    this.lastname = json["lastname"];
    this.password = json["password"];
    this.created = DateTime.fromMillisecondsSinceEpoch(json["created"]);
    this.firstname = json["firstname"];
    this.picture = json["picture"];
    this.updated = json["updated"] != null
        ? DateTime.fromMillisecondsSinceEpoch(json["updated"])
        : null;
    this.ownerId = json["ownerId"];
  }
}
