import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'mistakes_injuries_screen.dart';

class ProSplitScreen extends StatefulWidget {
  const ProSplitScreen({super.key});

  @override
  State<ProSplitScreen> createState() => _ProSplitScreenState();
}

class _ProSplitScreenState extends State<ProSplitScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  VideoPlayerController? _controller;
  bool _isLoading = true;
  Map<String, dynamic>? _selectedExercise;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _tabController.dispose();
    super.dispose();
  }

  final Map<String, Map<String, dynamic>> workoutVideos = {
    'Day 1': {
      'description':
          'Target: Chest, Front Deltoids, Triceps\nForm: Focus on compound movements, keep proper form, control the weight\nSets/Reps: 4 sets of 8-12 reps',
      'exercises': [
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
    'Day 2': {
      'description':
          'Target: Back, Biceps, Rear Deltoids\nForm: Maintain strict form, focus on muscle contraction, keep elbows stable\nSets/Reps: 3 sets of 12-15 reps',
      'exercises': [
        {
          'name': 'Lower Back',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-machine-back-extensions-side.mp4#t=0.1',
          'target': 'Erector Spinae',
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
    'Day 3': {
      'description':
          'Target: Shoulders, Upper Chest, Triceps\nForm: Keep proper form, control the weight, focus on muscle contraction\nSets/Reps: 3 sets of 12-15 reps',
      'exercises': [
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
    'Day 4': {
      'description':
          'Target: Quadriceps, Hamstrings, Glutes, Calves, Core\nForm: Keep back straight, feet shoulder-width apart, control the descent\nSets/Reps: 4 sets of 10-12 reps',
      'exercises': [
        {
          'name': 'Calf Raises',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-machine-seated-calf-raise-side.mp4#t=0.1',
          'target': 'Gastrocnemius, Soleus',
        },
        {
          'name': 'Crunches',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-bodyweight-crunch-side.mp4#t=0.1',
          'target': 'Rectus Abdominis',
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
        {
          'name': 'Russian Twist',
          'url':
              'https://media.musclewiki.com/media/uploads/videos/branded/male-Dumbbells-dumbbell-russian-twist-side.mp4#t=0.1',
          'target': 'Obliques, Core',
        },
      ],
    },
    'Day 5': {
      'description':
          'Target: Biceps, Triceps, Forearms\nForm: Keep elbows stable, control the weight, focus on muscle contraction\nSets/Reps: 3 sets of 12-15 reps',
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
      'Dumbbell Bench Press':
          'Target: Chest, Front Deltoids, Triceps\nForm: Lie flat on bench, keep feet flat on ground, lower weights with control\nSafety: Keep shoulders retracted, maintain natural arch in lower back, avoid bouncing weights off chest\nSets/Reps: 4 sets of 8-12 reps',
      'Dumbbell Incline Bench Press':
          'Target: Upper Chest, Front Deltoids, Triceps\nForm: Lie on incline bench (15-30 degrees), keep back pressed against bench, lower dumbbells with control\nSafety: Keep wrists straight, control the descent, avoid arching back\nSets/Reps: 4 sets of 8-12 reps',
      'Lower Chest':
          'Target: Lower Pectorals\nForm: Lie on decline bench, grip handles firmly, press weight up\nSafety: Keep core tight, maintain control throughout, avoid locking elbows at top\nSets/Reps: 4 sets of 8-12 reps',
      'Machine Pec Fly':
          'Target: Chest, Front Deltoids\nForm: Sit with back against pad, keep slight bend in elbows, bring arms together\nSafety: Keep slight bend in elbows, avoid using momentum, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Lower Back':
          'Target: Erector Spinae\nForm: Position hips on pad, keep feet secured, lower torso down\nSafety: Keep back straight, avoid hyperextension, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Machine Cable Row':
          'Target: Upper Back, Lats, Biceps\nForm: Sit with chest against pad, keep back straight, pull handles to waist\nSafety: Keep shoulders retracted, avoid rounding back, maintain controlled movement\nSets/Reps: 4 sets of 12-15 reps',
      'Machine Pulldown':
          'Target: Latissimus Dorsi, Biceps\nForm: Grip bar slightly wider than shoulders, pull to upper chest, keep core engaged\nSafety: Keep chest up, avoid leaning back, maintain controlled movement\nSets/Reps: 4 sets of 10-12 reps',
      'Trapes':
          'Target: Trapezius\nForm: Stand with dumbbells at sides, keep arms straight, shrug shoulders up\nSafety: Keep shoulders down and back, avoid rolling shoulders, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Lateral Raise':
          'Target: Lateral Deltoids\nForm: Stand straight with dumbbells at sides, slight bend in elbows, raise to shoulder level\nSafety: Keep slight bend in elbows, avoid swinging, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Overhead Press':
          'Target: Shoulders, Upper Chest, Triceps\nForm: Stand with feet shoulder-width apart, press weights overhead, keep core tight\nSafety: Keep wrists straight, avoid arching back, maintain neutral spine\nSets/Reps: 4 sets of 8-12 reps',
      'Reverse Fly':
          'Target: Rear Deltoids, Upper Back\nForm: Sit facing machine, keep chest against pad, pull arms back\nSafety: Keep slight bend in elbows, avoid using momentum, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Calf Raises':
          'Target: Gastrocnemius, Soleus\nForm: Place balls of feet on platform, lower heels below platform, raise up on toes\nSafety: Keep knees slightly bent, avoid bouncing, maintain controlled movement\nSets/Reps: 4 sets of 15-20 reps',
      'Crunches':
          'Target: Rectus Abdominis\nForm: Lie on back with knees bent, place hands behind head, curl shoulders off ground\nSafety: Keep lower back pressed against floor, avoid pulling neck, maintain controlled movement\nSets/Reps: 3 sets of 15-20 reps',
      'Hamstring Curl':
          'Target: Hamstrings\nForm: Lie face down on machine, align knees with pivot point, curl legs toward buttocks\nSafety: Keep hips down, avoid arching back, maintain controlled movement\nSets/Reps: 3 sets of 12-15 reps',
      'Leg Extension':
          'Target: Quadriceps\nForm: Sit with back against pad, align knees with pivot point, extend legs fully\nSafety: Avoid locking knees at top, maintain controlled movement, keep back against pad\nSets/Reps: 3 sets of 12-15 reps',
      'Leg Press':
          'Target: Quadriceps, Hamstrings, Glutes\nForm: Position feet shoulder-width apart, keep back against pad, lower weight with control\nSafety: Keep knees aligned with toes, avoid locking knees, maintain controlled movement\nSets/Reps: 4 sets of 10-12 reps',
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
                IconButton(
                  icon: const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MistakesInjuriesScreen(),
                      ),
                    );
                  },
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
        title: const Text('Pro Split'),
        backgroundColor: const Color(0xFF5D4FB7),
        bottom: TabBar(
          controller: _tabController,
          tabs: workoutVideos.keys.map((day) => Tab(text: day)).toList(),
          indicatorColor: Colors.orange,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: workoutVideos.entries.map((entry) {
          final exercises =
              entry.value['exercises'] as List<Map<String, dynamic>>;

          return Column(
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
                  itemCount: exercises.length,
                  itemBuilder: (context, index) =>
                      _buildExerciseButton(exercises[index]),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
