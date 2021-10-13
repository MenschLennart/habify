class Category {
  String? title;
  String? description;
  bool? enabled;
  List<String>? tags;

  Category();

  Object toObject() => toMap();

  Map<dynamic, dynamic> toMap() {
    return {
      "title": this.title,
      "description": this.description,
      "enabled": this.enabled,
      "tags": this.tags,
    };
  }

  Category.fromJSON(Map json) {
    this.title = json["description"];
    this.description = json["enabled"];
    this.enabled = json["enabled"];
    this.tags = json["tags"];
  }
}
