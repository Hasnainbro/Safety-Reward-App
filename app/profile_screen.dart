// screens/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:safety_rewards/utils/theme.dart';
import 'package:safety_rewards/utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String currentTheme = 'default';

  void togglePersonalGoal(int id) {
    setState(() {
      var goal = personalGoals.firstWhere((goal) => goal.id == id);
      goal.completed = !goal.completed;
    });
  }

  void changeTheme(String newTheme) {
    setState(() {
      currentTheme = newTheme;
      // In a real app, you'd update the app's theme here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Safety Goals',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 16),
                      ...personalGoals.map((goal) => CheckboxListTile(
                        title: Text(goal.name),
                        value: goal.completed,
                        onChanged: (_) => togglePersonalGoal(goal.id),
                      )).toList(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Theme Settings',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => changeTheme('default'),
                            child: Text('Default Theme'),
                          ),
                          ElevatedButton(
                            onPressed: () => changeTheme('dark'),
                            child: Text('Dark Theme'),
                          ),
                          ElevatedButton(
                            onPressed: () => changeTheme('light'),
                            child: Text('Light Theme'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account Information',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(height: 16),
                      // Add account info here
                      Text('Email: user@example.com'),
                      Text('Points: 100'), // Example point balance
                      Text('Joined: January 1, 2023'), // Example join date
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
