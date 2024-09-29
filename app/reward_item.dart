class RewardItem {
  final int id;
  final String name;
  final int points;
  final int popularity;

  RewardItem({
    required this.id,
    required this.name,
    required this.points,
    required this.popularity,
  });

  factory RewardItem.fromMap(Map<String, dynamic> map) {
    return RewardItem(
      id: map['id'] as int,
      name: map['name'] as String,
      points: map['points'] as int,
      popularity: map['popularity'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'points': points,
      'popularity': popularity,
    };
  }
}