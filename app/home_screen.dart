// screens/challenges_screen.dart
import 'package:flutter/material.dart';
import 'package:safety_rewards/widgets/challenge_card.dart';
import 'package:safety_rewards/models/challenge.dart';
import 'package:safety_rewards/utils/constants.dart';

class ChallengesScreen extends StatefulWidget {
  @override
  _ChallengesScreenState createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  List<int> completedChallenges = [];
  int streak = 0;

  void completeChallenge(int id) {
    if (!completedChallenges.contains(id)) {
      setState(() {
        completedChallenges.add(id);
        streak++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Streak: $streak',
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                      ),
                      Icon(Icons.local_fire_department, color: Colors.white, size: 32),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: challenges.map((challenge) => ChallengeCard(
                  challenge: challenge,
                  isCompleted: completedChallenges.contains(challenge.id),
                  onComplete: () => completeChallenge(challenge.id),
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
