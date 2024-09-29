// screens/rewards_screen.dart
import 'package:flutter/material.dart';
import 'package:safety_rewards/widgets/reward_item_card.dart';
import 'package:safety_rewards/utils/constants.dart';

class RewardsScreen extends StatefulWidget {
  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  List<int> wishlist = [];

  void toggleWishlist(int id) {
    setState(() {
      if (wishlist.contains(id)) {
        wishlist.remove(id);
      } else {
        wishlist.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards Store'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Sort by Points'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Sort by Popularity'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rewardItems.length,
              itemBuilder: (context, index) {
                return RewardItemCard(
                  item: rewardItems[index],
                  isWishlisted: wishlist.contains(rewardItems[index].id),
                  onWishlistToggle: () => toggleWishlist(rewardItems[index].id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
