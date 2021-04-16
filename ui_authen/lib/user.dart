class User {
  final String name;
  final String type;
  final int job;

  User(this.name, this.type, this.job);

  User.fromJson(Map<String, Object> json)
      : name = json['name'],
        type = json['type'],
        job = json['job'];

  Map toJson() {
    return {
      'name': name,
      'type': type,
      'job': job,
    };
  }

  String toString() {
    return 'Name: $name\nClass: $type\nJob Level: $job';
  }
}
