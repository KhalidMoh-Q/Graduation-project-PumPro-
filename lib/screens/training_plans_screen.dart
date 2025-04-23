import 'package:flutter/material.dart';
import 'arnold_split_screen.dart';
import 'full_body_screen.dart';
import 'push_pull_legs_screen.dart';
import 'pro_split_screen.dart';
import 'alternatives_screen.dart';

class TrainingPlansScreen extends StatelessWidget {
  const TrainingPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Plans'),
        backgroundColor: const Color(0xFF5D4FB7),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Your Plan',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildPlanButton(
              context,
              'Pro Split',
              'Train each muscle group individually',
              Colors.blue,
              Icons.fitness_center,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProSplitScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildPlanButton(
              context,
              'Full Body',
              'Complete full body workout routine',
              Colors.green,
              Icons.fitness_center,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FullBodyScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildPlanButton(
              context,
              'Arnold Split',
              'Famous 6-day training split',
              Colors.orange,
              Icons.sports_gymnastics,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ArnoldSplitScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildPlanButton(
              context,
              'Push Pull Legs',
              'Classic 3-day split focusing on movement patterns',
              Colors.purple,
              Icons.accessibility_new,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PushPullLegsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            _buildPlanButton(
              context,
              'Alternatives',
              'Custom and alternative training plans',
              Colors.red,
              Icons.shuffle,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlternativesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanButton(
    BuildContext context,
    String title,
    String subtitle,
    Color color,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.8),
            color.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white.withOpacity(0.8),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
