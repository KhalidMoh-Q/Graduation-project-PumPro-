import 'package:flutter/material.dart';

class MistakesInjuriesScreen extends StatelessWidget {
  const MistakesInjuriesScreen({super.key});

  Widget _buildMistakeCard(String title, String why, String risk, String tip,
      {String? imagePath}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagePath != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              '⚠️ $title',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildDetailRow('Why it\'s bad:', why),
            _buildDetailRow('Risk:', risk),
            _buildDetailRow('Tip:', tip),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              content,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBonusTip() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purple.withOpacity(0.8),
            Colors.orange.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🧠 Bonus Tip: Listen to Your Body!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Fatigue, pain, or lack of motivation could be signs you need to rest. Train smart, not just hard.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Common Mistakes & Injuries'),
        backgroundColor: const Color(0xFF5D4FB7),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '❌ Common Workout Mistakes & Injuries to Avoid',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildMistakeCard(
              'Skipping the Warm-Up',
              'Cold muscles are more prone to injury.',
              'Muscle strains, poor performance.',
              'Always do 5–10 minutes of light cardio and dynamic stretches.',
            ),
            _buildMistakeCard(
              'Poor Form and Technique',
              'Increases stress on joints and muscles.',
              'Back pain, joint injuries, torn ligaments.',
              'Learn proper form first—start with light weights or bodyweight.',
              imagePath: 'assets/images/Mistakes.png',
            ),
            _buildMistakeCard(
              'Lifting Too Heavy Too Soon',
              'Puts pressure on muscles and tendons.',
              'Muscle tears, tendonitis, joint dislocations.',
              'Increase weight gradually and focus on control.',
            ),
            _buildMistakeCard(
              'Not Resting Between Sets',
              'Doesn\'t give muscles time to recover.',
              'Fatigue, poor performance, overtraining.',
              'Rest 30–90 seconds depending on workout intensity.',
            ),
            _buildMistakeCard(
              'Ignoring Pain',
              'Pain is a warning sign.',
              'Serious injury or chronic issues.',
              'Stop immediately and rest. Consult a doctor if needed.',
              imagePath: 'assets/images/Injuries.png',
            ),
            _buildMistakeCard(
              'No Cool Down or Stretching',
              'Keeps muscles tight and blood flow restricted.',
              'Cramping, soreness, poor recovery.',
              'Always finish with light movement and static stretches.',
            ),
            _buildMistakeCard(
              'Overtraining Without Recovery Days',
              'Body doesn\'t get time to rebuild.',
              'Burnout, hormonal imbalance, sleep issues.',
              'Take 1–2 rest days per week. Recovery is part of progress.',
            ),
            _buildBonusTip(),
          ],
        ),
      ),
    );
  }
}
