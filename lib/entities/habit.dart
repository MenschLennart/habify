class Habit {
  bool? pinned;
  String? description;
  Map? icon;
  String? title;
  DateTime? updated;
  DateTime? created;

  Habit();

  Map<dynamic, dynamic> toMap() {
    return {
      'pinned': pinned,
      'description': description,
      'icon': icon,
      'title': title,
      'updated': updated,
      'created': created,
    };
  }

  Habit.fromJSON(Map json) {
    this.created = DateTime.fromMillisecondsSinceEpoch(json["created"]);
    this.description = json["description"];
    this.icon = json["icon"];
    this.pinned = json["pinned"];
    this.title = json["title"];
    this.updated = json["updated"] != null
        ? DateTime.fromMillisecondsSinceEpoch(json["updated"])
        : null;
  }
}
