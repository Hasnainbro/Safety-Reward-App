import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'leaderboard_entry.dart';

class LeaderboardItem extends StatelessWidget {
  final LeaderboardEntry entry;
  final int index;

  const LeaderboardItem({Key? key, required this.entry, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = index < 3
        ? [Colors.yellow[100], Colors.grey[100], Colors.orange[100]][index]
        : Colors.white;

    return Card(
      color: backgroundColor,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(entry.avatar),
        ),
        title: Text(entry.name),
        subtitle: Text('${entry.points} points'),
        trailing: index < 3
            ? const Icon(Icons.emoji_events, color: Colors.yellow)
                .animate(onPlay: (controller) => controller.repeat())
                .scale(duration: Duration(seconds: 1.5), begin: Offset(1, 1), end: Offset(1.2, 1.2))
            : null,
      ),
    ).animate().fadeIn().slideX();
  }
}