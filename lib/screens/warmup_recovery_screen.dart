import 'package:flutter/material.dart';

class WarmupRecoveryScreen extends StatelessWidget {
  const WarmupRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Warm-Up & Recovery Guide'),
        backgroundColor: const Color(0xFF5D4FB7),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Warm-Up Section
              const Text(
                '🔥 Warm-Up Tips (Before Workout)',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/warm_up.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              _buildSection(
                'Start with Light Cardio (5–10 mins)',
                'Walking, jogging, jumping jacks, or cycling to increase heart rate and blood flow.',
              ),
              _buildSection(
                'Dynamic Stretching (5 mins)',
                'Arm circles, leg swings, hip openers, bodyweight squats.',
              ),
              _buildSection(
                'Warm-Up Sets',
                'Do 1-2 light sets of your first exercise to prepare muscles for heavier loads.',
              ),
              const SizedBox(height: 16),
              _buildInfoBox(
                '💡 Why Warm-Up?',
                'Warming up improves flexibility, activates muscles, and reduces injury risk.',
              ),

              const SizedBox(height: 32),

              // Recovery Section
              const Text(
                '🧘‍♂️ Recovery Tips (After Workout)',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/Recovery.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              _buildSection(
                'Cool Down (5–10 mins)',
                'Light jogging or walking followed by deep breathing to reduce heart rate gradually.',
              ),
              _buildSection(
                'Static Stretching (5–10 mins)',
                'Focus on major muscles used during the workout: hamstrings, quads, shoulders, back.',
              ),
              _buildSection(
                'Stay Hydrated & Eat Protein',
                'Drink water and consume a protein-rich snack within 30–60 minutes post-workout.',
              ),
              _buildSection(
                'Get Enough Sleep',
                'Sleep is critical for muscle repair and growth.',
              ),
              _buildSection(
                'Rest Days Matter',
                'Take 1–2 days a week to allow your body to fully recover.',
              ),
              const SizedBox(height: 16),
              _buildInfoBox(
                '💡 Why Recover?',
                'Proper recovery improves muscle repair, reduces soreness, and boosts long-term progress.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            content,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
