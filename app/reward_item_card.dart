import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'reward_item.dart';

class RewardItemCard extends StatelessWidget {
  final RewardItem item;
  final bool isWishlisted;
  final Function(int) onToggleWishlist;

  const RewardItemCard({
    Key? key,
    required this.item,
    required this.isWishlisted,
    required this.onToggleWishlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(item.name),
        subtitle: Text('${item.points} points'),
        trailing: IconButton(
          icon: Icon(
            Icons.favorite,
            color: isWishlisted ? Colors.red : Colors.grey,
          ),
          onPressed: () => onToggleWishlist(item.id),
        ),
      ),
    ).animate().fadeIn().scale();
  }
}