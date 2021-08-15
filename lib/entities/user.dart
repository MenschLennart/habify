class User {
  String? name;
  String? email;
  String? objectId;

  User();

  Map<dynamic, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "objectId": this.objectId,
    };
  }

  User.fromJSON(Map json) {
    this.name = json["name"];
    this.email = json["email"];
    this.objectId = json["objectId"];
  }
}
