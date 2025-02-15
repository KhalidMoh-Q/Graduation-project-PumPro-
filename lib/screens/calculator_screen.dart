import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _formKey = GlobalKey<FormState>();

  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String _selectedGender = 'Male';
  String _selectedActivity = 'Sedentary';
  String _selectedGoal = 'Maintain';

  double? _calculatedCalories;
  Map<String, double>? _macros;

  final List<String> _activityLevels = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Extra Active'
  ];

  final List<String> _goals = ['Lose Weight', 'Maintain', 'Gain Weight'];

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  double _getActivityMultiplier(String activity) {
    switch (activity) {
      case 'Sedentary':
        return 1.2;
      case 'Lightly Active':
        return 1.375;
      case 'Moderately Active':
        return 1.55;
      case 'Very Active':
        return 1.725;
      case 'Extra Active':
        return 1.9;
      default:
        return 1.2;
    }
  }

  double _getGoalAdjustment(String goal) {
    switch (goal) {
      case 'Lose Weight':
        return -500;
      case 'Gain Weight':
        return 500;
      default:
        return 0;
    }
  }

  void _calculateCalories() {
    if (_formKey.currentState!.validate()) {
      final age = double.parse(_ageController.text);
      final height = double.parse(_heightController.text);
      final weight = double.parse(_weightController.text);

      double bmr;
      if (_selectedGender == 'Male') {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
      } else {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
      }

      final activityMultiplier = _getActivityMultiplier(_selectedActivity);
      final tdee = bmr * activityMultiplier;

      final goalAdjustment = _getGoalAdjustment(_selectedGoal);
      final totalCalories = tdee + goalAdjustment;

      final macros = {
        'Protein': (totalCalories * 0.30) / 4,
        'Carbs': (totalCalories * 0.40) / 4,
        'Fat': (totalCalories * 0.30) / 9,
      };

      setState(() {
        _calculatedCalories = totalCalories;
        _macros = macros;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: const Color(0xFF5D4FB7),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Calories & Macro\nCalculator',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: const InputDecoration(
                    hintText: 'Gender',
                  ),
                  items: ['Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    hintText: 'Height (cm)',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _weightController,
                  decoration: const InputDecoration(
                    hintText: 'Weight (kg)',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedActivity,
                  decoration: const InputDecoration(
                    hintText: 'Activity Level',
                  ),
                  items: _activityLevels.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedActivity = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedGoal,
                  decoration: const InputDecoration(
                    hintText: 'Goal',
                  ),
                  items: _goals.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGoal = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _calculateCalories,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                if (_calculatedCalories != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Your Daily Caloric Needs:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${_calculatedCalories!.toStringAsFixed(2)} kcal',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Your Daily Macronutrient Breakdown:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      if (_macros != null)
                        Column(
                          children: [
                            Text(
                              'Protein: ${_macros!['Protein']!.toStringAsFixed(2)} g',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Carbs: ${_macros!['Carbs']!.toStringAsFixed(2)} g',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Fat: ${_macros!['Fat']!.toStringAsFixed(2)} g',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

