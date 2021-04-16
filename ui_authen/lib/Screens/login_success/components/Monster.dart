class Monster {
  final String name;
  final int level;
  final String type;
  final int hp;
  final int base;
  final int job;

  Monster(this.name, this.level, this.type, this.hp, this.base, this.job);

  Monster.fromJson(Map<String, Object> json)
      : name = json['name'],
        level = json['level'],
        type = json['type'],
        hp = json['HP'],
        base = json['base'],
        job = json['job'];

  Map toJson() {
    return {
      'name': name,
      'level': level,
      'type': type,
      'hp': hp,
      'base': base,
      'job': job,
    };
  }

  String toString() {
    return 'Name: $name\nlevel: $level\nJob EXP: $job';
  }
}
