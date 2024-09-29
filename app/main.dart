// main.dart
import 'package:flutter/material.dart';
import 'package:safety_rewards/screens/home_screen.dart';
import 'package:safety_rewards/screens/challenges_screen.dart';
import 'package:safety_rewards/screens/leaderboard_screen.dart';
import 'package:safety_rewards/screens/report_screen.dart';
import 'package:safety_rewards/screens/rewards_screen.dart';
import 'package:safety_rewards/screens/profile_screen.dart';
import 'package:safety_rewards/utils/theme.dart';

void main() {
  runApp(SafetyRewardApp());
}

class SafetyRewardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safety Rewards',
      theme: AppTheme.defaultTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/challenges': (context) => ChallengesScreen(),
        '/leaderboard': (context) => LeaderboardScreen(),
        '/report': (context) => ReportScreen(),
        '/rewards': (context) => RewardsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
