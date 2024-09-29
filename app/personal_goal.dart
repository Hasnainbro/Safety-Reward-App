class PersonalGoal {
  final int id;
  final String name;
  bool completed;

  PersonalGoal({
    required this.id,
    required this.name,
    this.completed = false,
  });

  void toggleCompletion() {
    completed = !completed;
  }

  factory PersonalGoal.fromMap(Map<String, dynamic> map) {
    return PersonalGoal(
      id: map['id'] as int,
      name: map['name'] as String,
      completed: map['completed'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'completed': completed,
    };
  }
}