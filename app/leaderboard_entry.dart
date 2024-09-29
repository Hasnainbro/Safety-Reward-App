import 'package:flutter/material.dart';

class LeaderboardEntry {
  final int id;
  final String name;
  final int points;
  final String avatar;

  LeaderboardEntry({
    required this.id,
    required this.name,
    required this.points,
    required this.avatar,
  });

  factory LeaderboardEntry.fromMap(Map<String, dynamic> map) {
    return LeaderboardEntry(
      id: map['id'] as int,
      name: map['name'] as String,
      points: map['points'] as int,
      avatar: map['avatar'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'points': points,
      'avatar': avatar,
    };
  }
}