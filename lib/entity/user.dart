class User {
  String? name;
  String? email;
  String? password;
  String? objectId;

  User();

  Object toObject() => toMap();

  Map<dynamic, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "password": this.password,
      "objectId": this.objectId,
    };
  }

  User.fromJSON(Map json) {
    this.name = json["name"];
    this.email = json["email"];
    this.password = json["password"];
    this.objectId = json["objectId"];
  }
}
