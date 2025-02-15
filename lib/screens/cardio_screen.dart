import 'package:flutter/material.dart';

class CardioScreen extends StatelessWidget {
  const CardioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio Guide'),
        backgroundColor: const Color(0xFF5D4FB7),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCardioTypeSection(
              'Types of Cardio Training',
              [
                _buildCardioType(
                  'HIIT (High-Intensity Interval Training)',
                  'Alternating between intense bursts of activity and short rest periods',
                  '• Burns 400-600 calories/hour\n'
                      '• Improves metabolism\n'
                      '• Continues burning calories post-workout\n'
                      '• Best for: Fat loss and time efficiency',
                  Colors.red,
                ),
                _buildCardioType(
                  'LISS (Low-Intensity Steady State)',
                  'Continuous, steady-paced exercise at low intensity',
                  '• Burns 200-400 calories/hour\n'
                      '• Great for beginners\n'
                      '• Improves endurance\n'
                      '• Best for: Recovery and base fitness',
                  Colors.green,
                ),
                _buildCardioType(
                  'Tabata',
                  '20 seconds of maximum effort followed by 10 seconds rest',
                  '• Burns 300-400 calories/session\n'
                      '• Very time-efficient (4-minute rounds)\n'
                      '• Improves both aerobic and anaerobic fitness\n'
                      '• Best for: Quick, intense workouts',
                  Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildMachineComparisonSection(
              'Cardio Machine Comparison',
              [
                _buildMachineComparison(
                  'Treadmill',
                  '• Walking (3.5 mph): 280-400 calories/hour\n'
                      '• Running (5.0 mph): 500-800 calories/hour\n'
                      '• Sprinting (8.0 mph): 800-1,000+ calories/hour\n'
                      '\nPros:\n'
                      '• Natural movement\n'
                      '• Highly effective for calorie burn\n'
                      '• Versatile for all fitness levels\n'
                      '\nCons:\n'
                      '• High impact on joints\n'
                      '• May require technique adjustment',
                  Colors.blue,
                ),
                _buildMachineComparison(
                  'Elliptical',
                  '• Light effort: 300-400 calories/hour\n'
                      '• Moderate effort: 400-600 calories/hour\n'
                      '• Vigorous effort: 600-800 calories/hour\n'
                      '\nPros:\n'
                      '• Low impact on joints\n'
                      '• Full body workout option\n'
                      '• Suitable for rehabilitation\n'
                      '\nCons:\n'
                      '• Less intense than running\n'
                      '• Non-natural movement pattern',
                  Colors.purple,
                ),
                _buildMachineComparison(
                  'Spin Bike',
                  '• Light cycling: 350-450 calories/hour\n'
                      '• Moderate cycling: 450-600 calories/hour\n'
                      '• Intense cycling: 600-800 calories/hour\n'
                      '\nPros:\n'
                      '• Low impact on joints\n'
                      '• Great for HIIT workouts\n'
                      '• Builds leg strength\n'
                      '\nCons:\n'
                      '• Limited upper body workout\n'
                      '• Requires proper bike setup',
                  Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildWorkoutSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardioTypeSection(String title, List<Widget> types) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        ...types,
      ],
    );
  }

  Widget _buildCardioType(
    String title,
    String description,
    String benefits,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  benefits,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMachineComparisonSection(
      String title, List<Widget> comparisons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        ...comparisons,
      ],
    );
  }

  Widget _buildMachineComparison(
    String machine,
    String details,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: ExpansionTile(
        title: Text(
          machine,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              details,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepPurple.withOpacity(0.8),
            Colors.deepPurple.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Tips for Effective Cardio',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Text(
            '1. Start with a 5-10 minute warm-up\n'
            '2. Stay hydrated throughout your workout\n'
            '3. Monitor your heart rate\n'
            '4. Mix different types of cardio for best results\n'
            '5. Cool down properly\n'
            '6. Gradually increase intensity over time',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
