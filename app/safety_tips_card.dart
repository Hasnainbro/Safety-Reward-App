import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SafetyTipsCard extends StatelessWidget {
  final List<String> tips;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const SafetyTipsCard({
    Key? key,
    required this.tips,
    required this.currentIndex,
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daily Safety Tip',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: onPrevious,
                    ),
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: onNext,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Text(
                tips[currentIndex],
                key: ValueKey<int>(currentIndex),
                style: Theme.of(context).textTheme.bodyText2,
              ).animate().fadeIn().slideX(),
            ),
          ],
        ),
      ),
    );
  }
}