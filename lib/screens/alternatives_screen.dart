import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AlternativesScreen extends StatefulWidget {
  const AlternativesScreen({super.key});

  @override
  State<AlternativesScreen> createState() => _AlternativesScreenState();
}

class _AlternativesScreenState extends State<AlternativesScreen> {
  VideoPlayerController? _controller;
  bool _isLoading = true;
  Map<String, dynamic>? _selectedExercise;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  final Map<String, Map<String, dynamic>> workoutVideos = {
    'Chest': {
      'description': 'Chest exercises for building strength and mass',
      'exercises': [
        {
          'name': 'Machine Chest Press',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Machine-machine-chest-press-front.mp4#t=0.1',
          'target': 'Chest, Front Deltoids, Triceps',
        },
        {
          'name': 'Smith Machine Bench Press',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Smithmachine-bench-press-side.mp4#t=0.1',
          'target': 'Chest, Front Deltoids, Triceps',
        },
        {
          'name': 'Bench Press',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Machine-machine-plate-loaded-low-incline-bench-press-front.mp4#t=0.1',
          'target': 'Upper Chest, Front Deltoids, Triceps',
        },
        {
          'name': 'Cable Fly',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-cable-pec-fly-side.mp4#t=0.1',
          'target': 'Chest, Front Deltoids',
        },
        {
          'name': 'Dumbbell Bench Press',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-dumbbell-bench-press-side_rqe1iTe.mp4#t=0.1',
          'target': 'Chest, Front Deltoids, Triceps',
        },
        {
          'name': 'Dumbbell Incline Bench Press',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-dumbbell-incline-bench-press-side_2HBfFN3.mp4#t=0.1',
          'target': 'Upper Chest, Front Deltoids, Triceps',
        },
        {
          'name': 'Lower Chest',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Machine-machine-plate-loaded-decline-chest-press-front.mp4#t=0.1',
          'target': 'Lower Pectorals',
        },
        {
          'name': 'Machine Pec Fly',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Machine-machine-pec-fly-side.mp4#t=0.1',
          'target': 'Chest, Front Deltoids',
        },
      ],
    },
    'Back': {
      'description': 'Back exercises for building a strong and wide back',
      'exercises': [
        {
          'name': 'Bar Pullover',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Cables-cable-pullover-front.mp4#t=0.1',
          'target': 'Lats, Serratus Anterior',
        },
        {
          'name': 'Machine Cable Row',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-machine-seated-cable-row-side.mp4#t=0.1',
          'target': 'Upper Back, Lats, Biceps',
        },
        {
          'name': 'Machine Pulldown',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-machine-pulldown-side.mp4#t=0.1',
          'target': 'Latissimus Dorsi, Biceps',
        },
        {
          'name': 'Trapes',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Dumbbells-dumbbell-shrug-side.mp4#t=0.1',
          'target': 'Trapezius',
        },
      ],
    },
    'Shoulders': {
      'description':
          'Shoulder exercises for building strong and defined deltoids',
      'exercises': [
        {
          'name': 'Face Pulls',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Machine-machine-face-pulls-side.mp4#t=0.1',
          'target': 'Rear Deltoids, Upper Traps, External Rotators',
        },
        {
          'name': 'Lateral Raise',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Dumbbells-dumbbell-lateral-raise-front.mp4#t=0.1',
          'target': 'Lateral Deltoids',
        },
        {
          'name': 'Overhead Press',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Machine-machine-neutral-overhead-press-front.mp4#t=0.1',
          'target': 'Shoulders, Upper Chest, Triceps',
        },
        {
          'name': 'Reverse Fly',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Machine-machine-reverse-fly-side.mp4#t=0.1',
          'target': 'Rear Deltoids, Upper Back',
        },
      ],
    },
    'Legs': {
      'description': 'Leg exercises for building strong and powerful legs',
      'exercises': [
        {
          'name': 'Bulgarian Squat',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Dumbbells-dumbbell-bulgarian-split-squat-side.mp4#t=0.1',
          'target': 'Quadriceps, Glutes, Hamstrings',
        },
        {
          'name': 'Leg Deadlifts',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-barbell-stiff-leg-deadlift-side.mp4#t=0.1',
          'target': 'Hamstrings, Lower Back, Glutes',
        },
        {
          'name': 'Calf Raises',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-machine-seated-calf-raise-side.mp4#t=0.1',
          'target': 'Gastrocnemius, Soleus',
        },
        {
          'name': 'Hamstring Curl',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-machine-hamstring-curl-side.mp4#t=0.1',
          'target': 'Hamstrings',
        },
        {
          'name': 'Leg Extension',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-machine-leg-extension-front.mp4#t=0.1',
          'target': 'Quadriceps',
        },
        {
          'name': 'Leg Press',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-machine-leg-press-front.mp4#t=0.1',
          'target': 'Quadriceps, Hamstrings, Glutes',
        },
      ],
    },
    'Core': {
      'description': 'Core exercises for building strong abs and obliques',
      'exercises': [
        {
          'name': 'Crunches',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-bodyweight-crunch-side.mp4#t=0.1',
          'target': 'Rectus Abdominis',
        },
        {
          'name': 'Russian Twist',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Dumbbells-dumbbell-russian-twist-side.mp4#t=0.1',
          'target': 'Obliques, Core',
        },
      ],
    },
    'Arms': {
      'description':
          'Arm exercises for building strong biceps, triceps and forearms',
      'exercises': [
        {
          'name': 'Cable Bayesian Curl',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Cables-cable-bilateral-bayesian-curl-side.mp4#t=0.1',
          'target': 'Biceps',
        },
        {
          'name': 'Cable Curl',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Cables-cable-bar-curl-side.mp4#t=0.1',
          'target': 'Biceps',
        },
        {
          'name': 'Cable Pushdown',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Cables-cable-push-down-front.mp4#t=0.1',
          'target': 'Triceps',
        },
        {
          'name': 'Cable Rope Overhead',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Cables-cable-overhead-tricep-extension-side.mp4#t=0.1',
          'target': 'Triceps',
        },
        {
          'name': 'Dumbbell Wrist Curl',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Dumbbells-dumbbell-wrist-curl-front.mp4#t=0.1',
          'target': 'Forearm Flexors',
        },
        {
          'name': 'Dumbbell Wrist Extension',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Dumbbells-dumbbell-wrist-extension-side.mp4#t=0.1',
          'target': 'Forearm Extensors',
        },
      ],
    },
  };

  String _getExerciseDescription(String exerciseName) {
    final descriptions = {
      'Bar Pullover':
          'Target: Lats, Serratus Anterior\nForm: Stand facing cable machine, grip bar with overhand grip, pull bar down and back in an arc motion\nSafety: Keep core engaged, maintain controlled movement, avoid arching back\nSets/Reps: 3 sets of 12-15 reps',
      'Bench Press':
          'Target: Upper Chest, Front Deltoids, Triceps\nForm: Lie on incline bench, grip handles at shoulder width, press weight up with control\nSafety: Keep back against pad, feet flat on floor, avoid bouncing at bottom\nSets/Reps: 4 sets of 8-12 reps',
      'Bulgarian Squat':
          'Target: Quadriceps, Glutes, Hamstrings\nForm: Place rear foot on bench, keep front foot forward, lower body until rear knee nearly touches ground\nSafety: Keep chest up, front knee aligned with toe, maintain balance\nSets/Reps: 3 sets of 10-12 reps per leg',
      'Cable Fly':
          'Target: Chest, Front Deltoids\nForm: Stand between cable machines, slight bend in elbows, bring hands together in arc motion\nSafety: Maintain slight bend in elbows, control the weight, keep chest up\nSets/Reps: 3 sets of 12-15 reps',
      'Crunches':
          'Target: Rectus Abdominis\nForm: Lie on back with knees bent, place hands behind head, curl shoulders off ground\nSafety: Keep lower back pressed against floor, avoid pulling neck, maintain controlled movement\nSets/Reps: 3 sets of 15-20 reps',
      'Dumbbell Bench Press':
          'Target: Chest, Front Deltoids, Triceps\nForm: Lie flat on bench, keep feet flat on ground, lower weights with control\nSafety: Keep shoulders retracted, maintain natural arch in lower back, avoid bouncing weights off chest\nSets/Reps: 4 sets of 8-12 reps',
      'Dumbbell Incline Bench Press':
          'Target: Upper Chest, Front Deltoids, Triceps\nForm: Lie on incline bench (15-30 degrees), keep back pressed against bench, lower dumbbells with control\nSafety: Keep wrists straight, control the descent, avoid arching back\nSets/Reps: 4 sets of 8-12 reps',
      'Lower Chest':
          'Target: Lower Pectorals\nForm: Lie on decline bench, grip handles firmly, press weight up\nSafety: Keep core tight, maintain control throughout, avoid locking elbows at top\nSets/Reps: 4 sets of 8-12 reps',
      'Machine Pec Fly':
          'Target: Chest, Front Deltoids\nForm: Sit with back against pad, keep slight bend in elbows, bring arms together\nSafety: Keep slight bend in elbows, avoid using momentum, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Leg Deadlifts':
          'Target: Hamstrings, Lower Back, Glutes\nForm: Keep legs straight but not locked, hinge at hips, maintain neutral spine\nSafety: Keep bar close to legs, avoid rounding back, control descent\nSets/Reps: 4 sets of 10-12 reps',
      'Machine Chest Press':
          'Target: Chest, Front Deltoids, Triceps\nForm: Sit with back against pad, grip handles at chest level, press forward with control\nSafety: Keep back against pad, avoid locking elbows, maintain controlled movement\nSets/Reps: 4 sets of 8-12 reps',
      'Smith Machine Bench Press':
          'Target: Chest, Front Deltoids, Triceps\nForm: Lie flat on bench, grip bar slightly wider than shoulders, lower bar to chest\nSafety: Keep wrists straight, maintain controlled movement, avoid bouncing bar\nSets/Reps: 4 sets of 8-12 reps',
      'Russian Twist':
          'Target: Obliques, Core\nForm: Sit with knees bent, lean back slightly, hold weight at chest\nSafety: Keep back straight, avoid rounding shoulders, maintain controlled movement\nSets/Reps: 3 sets of 20 reps (10 each side)',
      'Cable Bayesian Curl':
          'Target: Biceps\nForm: Stand between cable machines, keep elbows at sides, curl both arms simultaneously\nSafety: Keep elbows stationary, avoid swinging, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Cable Curl':
          'Target: Biceps\nForm: Stand facing cable machine, keep elbows at sides, curl with control\nSafety: Keep elbows stationary, avoid swinging, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Cable Pushdown':
          'Target: Triceps\nForm: Stand facing cable machine, keep elbows tucked at sides, push down with straight wrists\nSafety: Keep elbows close to body, avoid swinging, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Cable Rope Overhead':
          'Target: Triceps\nForm: Face away from cable machine, keep upper arms stationary, extend arms overhead\nSafety: Keep elbows close to head, avoid arching back, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Dumbbell Wrist Curl':
          'Target: Forearm Flexors\nForm: Rest forearms on bench, palms facing up, curl wrists up\nSafety: Keep forearms stationary, avoid using momentum, maintain controlled movement\nSets/Reps: 3 sets of 15-20 reps',
      'Dumbbell Wrist Extension':
          'Target: Forearm Extensors\nForm: Rest forearms on bench, palms facing down, extend wrists up\nSafety: Keep forearms stationary, avoid using momentum, maintain controlled movement\nSets/Reps: 3 sets of 15-20 reps',
    };

    return descriptions[exerciseName] ?? 'Description not available';
  }

  Widget _buildExerciseButton(Map<String, dynamic> exercise) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Material(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () async {
            setState(() {
              _selectedExercise = exercise;
              _isLoading = true;
            });

            _controller?.dispose();
            _controller = VideoPlayerController.network(exercise['url']);

            try {
              await _controller!.initialize();
              await _controller!.setLooping(true);
              await _controller!.play();
              setState(() {
                _isLoading = false;
              });
            } catch (e) {
              setState(() {
                _isLoading = false;
              });
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error loading video. Please try again.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(
                  Icons.play_circle_outline,
                  color: Colors.orange,
                  size: 24,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    exercise['name'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.orange,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Alternatives'),
        backgroundColor: const Color(0xFF5D4FB7),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_selectedExercise != null) ...[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_isLoading)
                    const CircularProgressIndicator(color: Colors.orange)
                  else if (_controller != null &&
                      _controller!.value.isInitialized)
                    VideoPlayer(_controller!),
                ],
              ),
            ),
            if (_controller != null && _controller!.value.isInitialized)
              VideoProgressIndicator(
                _controller!,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.orange,
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.white24,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _selectedExercise!['name'] as String,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.orange),
                        onPressed: () {
                          setState(() {
                            _selectedExercise = null;
                            _controller?.pause();
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Target: ${_selectedExercise!['target']}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Form:',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getExerciseDescription(
                        _selectedExercise!['name'] as String),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
          Expanded(
            child: ListView.builder(
              itemCount: workoutVideos.length,
              itemBuilder: (context, index) {
                final category = workoutVideos.keys.elementAt(index);
                final exercises = workoutVideos[category]!['exercises']
                    as List<Map<String, dynamic>>;
                final description =
                    workoutVideos[category]!['description'] as String;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...exercises
                        .map((exercise) => _buildExerciseButton(exercise))
                        .toList(),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
