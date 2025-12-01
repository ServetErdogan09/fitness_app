import 'dart:async';
import 'package:fitness_app/features/tracking/provider/workout_sessions_notifier.dart';
import 'package:fitness_app/features/tracking/widgets/add_exercise_bottom_sheet.dart';
import 'package:fitness_app/features/tracking/widgets/points_breakdown_dialog.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:fitness_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ActiveWorkoutScreen extends ConsumerStatefulWidget {
  final WorkoutPlan plan;

  const ActiveWorkoutScreen({super.key, required this.plan});

  @override
  ConsumerState<ActiveWorkoutScreen> createState() =>
      _ActiveWorkoutScreenState();
}

class _ActiveWorkoutScreenState extends ConsumerState<ActiveWorkoutScreen> {
  final Map<String, List<SetData>> _exerciseSets = {};
  final Map<String, Map<int, bool>> _completedSets = {};
  final Map<String, Map<int, TextEditingController>> _weightControllers = {};
  final Map<String, Map<int, TextEditingController>> _repsControllers = {};
  bool _isReadOnly = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final today = DateTime.now();

      // eğer bugün tamamlanmış bir seans varsa read-only moda geç
      final completedSession = await ref
          .read(workoutProvider.notifier)
          .getCompletedSessionForToday(widget.plan.id, today);

      print('completedSession null mu: $completedSession');
      if (completedSession != null) {
        // READ-ONLY MODE
        await ref
            .read(workoutProvider.notifier)
            .restoreSession(
              completedSession,
              skipTimer: true, // eğer aynı gün ise zamanlayıcıyı başlatma
            );
        await _loadExercises();
        await _loadCompletedSets(completedSession.id);
        setState(() {
          _isReadOnly = true;
        });
        return;
      }

      // kontrol et eğer bugün başlamış ama tamamlanmamış bir seans varsa
      final incompleteSession = await ref
          .read(workoutProvider.notifier)
          .getIncompleteSessionForToday(widget.plan.id, today);

      if (incompleteSession != null) {
        // Başlamış ama tamamlanmamış seansı geri yükle
        await ref
            .read(workoutProvider.notifier)
            .restoreSession(incompleteSession);
        await _loadExercises();
        await _loadCompletedSets(incompleteSession.id);
      } else {
        // Yeni bir seans başlat
        await ref.read(workoutProvider.notifier).startWorkout(widget.plan);
        await _loadExercises();
      }
    });
  }

  Future<void> _loadExercises() async {
    await ref
        .read(workoutProvider.notifier)
        .loadExcercisesForPlan(widget.plan.id);
    final exercises = ref.read(workoutProvider).exercises;

    setState(() {
      for (var exercise in exercises) {
        // Eğer zaten yüklendiyse atla )
        if (_exerciseSets.containsKey(exercise.exerciseName)) {
          continue;
        }

        final setCount = int.tryParse(exercise.setCount) ?? 3;
        _exerciseSets[exercise.exerciseName] = List.generate(
          setCount,
          (index) => SetData(
            setNumber: index + 1,
            previousWeight: exercise.targetWeight ?? 0,
            previousReps: int.tryParse(exercise.repCount) ?? 0,
          ),
        );
        _completedSets[exercise.exerciseName] = {};

        // Initialize controllers for each set
        _weightControllers[exercise.exerciseName] = {};
        _repsControllers[exercise.exerciseName] = {};
        for (int i = 1; i <= setCount; i++) {
          _weightControllers[exercise.exerciseName]![i] =
              TextEditingController();
          _repsControllers[exercise.exerciseName]![i] = TextEditingController();
        }
      }
    });
  }

  Future<void> _loadCompletedSets(int sessionId) async {
    final logs = ref.read(workoutProvider).currentLogs;

    setState(() {
      for (var log in logs) {
        _completedSets[log.exerciseName] ??= {};
        _completedSets[log.exerciseName]![log.setNumber] = true;

        // Restore values to SetData and controllers
        final sets = _exerciseSets[log.exerciseName];
        if (sets != null) {
          final setIndex = sets.indexWhere((s) => s.setNumber == log.setNumber);
          if (setIndex != -1) {
            sets[setIndex].weight = log.weight;
            sets[setIndex].reps = log.reps;

            // Update controllers
            _weightControllers[log.exerciseName]?[log.setNumber]?.text = log
                .weight
                .toString();
            _repsControllers[log.exerciseName]?[log.setNumber]?.text = log.reps
                .toString();
          }
        }
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  void _addSet(String exerciseName) {
    setState(() {
      final currentSets = _exerciseSets[exerciseName] ?? [];
      final newSetNumber = currentSets.length + 1;
      _exerciseSets[exerciseName] = [
        ...currentSets,
        SetData(
          setNumber: newSetNumber,
          previousWeight: currentSets.isNotEmpty
              ? currentSets.last.previousWeight
              : 0,
          previousReps: currentSets.isNotEmpty
              ? currentSets.last.previousReps
              : 0,
        ),
      ];

      // Add controllers for the new set
      _weightControllers[exerciseName] ??= {};
      _repsControllers[exerciseName] ??= {};
      _weightControllers[exerciseName]![newSetNumber] = TextEditingController();
      _repsControllers[exerciseName]![newSetNumber] = TextEditingController();
    });
  }

  void _toggleSetCompletion(
    String exerciseName,
    int exerciseId,
    int setNumber,
    double weight,
    int reps,
  ) {
    final isCompleted = _completedSets[exerciseName]?[setNumber] ?? false;

    // Validation: Don't allow completing with empty values
    if (!isCompleted && (weight <= 0 || reps <= 0)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen ağırlık ve tekrar sayısını girin'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _completedSets[exerciseName] ??= {};
      _completedSets[exerciseName]![setNumber] = !isCompleted;
    });

    if (!isCompleted) {
      // Completing: Save to database
      final log = ExerciseLog()
        ..exerciseName = exerciseName
        ..exerciseId = exerciseId
        ..setNumber = setNumber
        ..weight = weight
        ..reps = reps
        ..completedAt = DateTime.now();

      ref.read(workoutProvider.notifier).saveSetLog(log);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Set $setNumber kaydedildi ✓'),
          backgroundColor: const Color(0xFF13ec49),
          duration: const Duration(milliseconds: 800),
        ),
      );
    } else {
      // Uncompleting: Delete from database
      ref
          .read(workoutProvider.notifier)
          .deleteSetLogByDetails(exerciseName, setNumber);
    }
  }

  void _showAddExerciseBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddExerciseBottomSheet(
        programId: widget.plan.id,
        onExerciseAdded: () {
          _loadExercises();
        },
      ),
    );
  }

  void _finishWorkout() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: const Text(
          'Antrenmanı Bitir',
          style: TextStyle(color: Colors.white, fontFamily: 'LexendExa'),
        ),
        content: const Text(
          'Antrenmanı bitirmek istediğinize emin misiniz?',
          style: TextStyle(color: Color(0xFFD1D5DB), fontFamily: 'Lexend'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'İptal',
              style: TextStyle(color: Color(0xFF9CA3AF), fontFamily: 'Lexend'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // Check if there are any exercise logs
              if (ref.read(workoutProvider).currentLogs.isEmpty) {
                Navigator.pop(dialogContext); // Close dialog first
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Antrenmanı bitirmek için en az bir egzersiz ve set eklemelisiniz!',
                      style: TextStyle(fontFamily: 'Lexend'),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 3),
                  ),
                );
                return;
              }

              Navigator.pop(dialogContext); // Close confirmation dialog

              // Finish workout and get points
              final calculation = await ref
                  .read(workoutProvider.notifier)
                  .finishWorkout();

              if (!mounted) return;

              if (calculation != null) {
                // Show points breakdown
                await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) =>
                      PointsBreakdownDialog(calculation: calculation),
                );
              }

              if (!mounted) return;
              context.go(AppRoutes.training);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF13ec49),
              foregroundColor: const Color(0xFF102215),
            ),
            child: const Text(
              'Bitir',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _cancelWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: const Text(
          'Antrenmanı İptal Et',
          style: TextStyle(color: Colors.white, fontFamily: 'LexendExa'),
        ),
        content: const Text(
          'Antrenmanı iptal etmek istediğinize emin misiniz? Tüm veriler kaybolacak.',
          style: TextStyle(color: Color(0xFFD1D5DB), fontFamily: 'Lexend'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Geri Dön',
              style: TextStyle(color: Color(0xFF9CA3AF), fontFamily: 'Lexend'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await ref.read(workoutProvider.notifier).cancelWorkout();
              if (!mounted) return;
              context.go(AppRoutes.training);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'İptal Et',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final workoutState = ref.watch(workoutProvider);
    final exercises = workoutState.exercises;

    return Scaffold(
      backgroundColor: const Color(0xFF102215),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF9CA3AF),
                    ),
                    onPressed: () {
                      context.go(AppRoutes.training);
                    },
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.plan.planName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            if (_isReadOnly)
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF13ec49),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'TAMAMLANDI',
                                  style: TextStyle(
                                    color: Color(0xFF102215),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Lexend',
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat(
                            'd MMMM yyyy',
                            'tr_TR',
                          ).format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                            fontFamily: 'Lexend',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _formatDuration(workoutState.elapsedDuration),
                    style: const TextStyle(
                      color: Color(0xFF13ec49),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
              ),
            ),

            // Exercise List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ...exercises.map((exercise) => _buildExerciseCard(exercise)),
                  const SizedBox(height: 16),

                  // Add Exercise Button
                  if (!_isReadOnly)
                    GestureDetector(
                      onTap: _showAddExerciseBottomSheet,
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle_outline,
                              color: Color(0xFF9CA3AF),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Egzersiz Ekle',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 100), // Space for bottom bar
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _isReadOnly
          ? null
          : Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF102215).withOpacity(0),
                    const Color(0xFF102215),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _cancelWorkout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'İptal Et',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lexend',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _finishWorkout,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF13ec49),
                        foregroundColor: const Color(0xFF102215),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Antrenmanı Bitir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lexend',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildExerciseCard(PlanExercise exercise) {
    final sets = _exerciseSets[exercise.exerciseName] ?? [];

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF000000).withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Column(
        children: [
          // Exercise Header
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF13ec49).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.fitness_center,
                    color: Color(0xFF13ec49),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    exercise.exerciseName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ),
                if (!_isReadOnly) ...[
                  IconButton(
                    icon: Icon(
                      Icons.notes,
                      color: Colors.white.withOpacity(0.7),
                      size: 20,
                    ),
                    onPressed: () {
                      // tıklanınca not ekleme ekranı açılacak
                    },
                  ),

                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red.withOpacity(0.8),
                      size: 20,
                    ),
                    onPressed: () {
                      ref
                          .read(workoutProvider.notifier)
                          .deletePlanExercise(exercise.id);
                      setState(() {
                        _exerciseSets.remove(exercise.exerciseName);
                        _completedSets.remove(exercise.exerciseName);
                      });
                    },
                  ),
                ],
              ],
            ),
          ),

          // Set List Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Text(
                    'SET',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'ÖNCEKİ',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    'KG',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Text(
                    'TEKRAR',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),

          // Set Rows
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Column(
              children: sets
                  .map(
                    (set) =>
                        _buildSetRow(exercise.exerciseName, exercise.id, set),
                  )
                  .toList(),
            ),
          ),

          // Add Set Button
          if (!_isReadOnly)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: ElevatedButton(
                onPressed: () => _addSet(exercise.exerciseName),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Set Ekle',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSetRow(String exerciseName, int exerciseId, SetData set) {
    // Get persistent controllers from state
    final weightController = _weightControllers[exerciseName]?[set.setNumber];
    final repsController = _repsControllers[exerciseName]?[set.setNumber];

    // If controllers don't exist, return empty widget
    if (weightController == null || repsController == null) {
      return const SizedBox.shrink();
    }

    final isCompleted = _completedSets[exerciseName]?[set.setNumber] ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          // Set Number
          SizedBox(
            width: 40,
            child: Text(
              '${set.setNumber}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
            ),
          ),

          // Previous
          Expanded(
            flex: 2,
            child: Text(
              '${set.previousWeight}kg x ${set.previousReps}',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
            ),
          ),

          // Weight Input
          SizedBox(
            width: 60,
            child: TextField(
              controller: weightController,
              enabled: !_isReadOnly,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF13ec49)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
              ),
              onChanged: (value) {
                set.weight = double.tryParse(value) ?? 0;
              },
            ),
          ),

          const SizedBox(width: 8),

          // Reps Input
          SizedBox(
            width: 60,
            child: TextField(
              controller: repsController,
              enabled: !_isReadOnly,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF13ec49)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
              ),
              onChanged: (value) {
                set.reps = int.tryParse(value) ?? 0;
              },
            ),
          ),

          const SizedBox(width: 8),

          // Complete Button
          GestureDetector(
            onTap: _isReadOnly
                ? null
                : () => _toggleSetCompletion(
                    exerciseName,
                    exerciseId,
                    set.setNumber,
                    set.weight,
                    set.reps,
                  ),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isCompleted
                    ? const Color(0xFF13ec49)
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCompleted
                      ? const Color(0xFF13ec49)
                      : Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, color: Color(0xFF102215), size: 20)
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose all controllers
    for (var exerciseControllers in _weightControllers.values) {
      for (var controller in exerciseControllers.values) {
        controller.dispose();
      }
    }
    for (var exerciseControllers in _repsControllers.values) {
      for (var controller in exerciseControllers.values) {
        controller.dispose();
      }
    }
    super.dispose();
  }
}

class SetData {
  final int setNumber;
  final double previousWeight;
  final int previousReps;
  double weight;
  int reps;

  SetData({
    required this.setNumber,
    required this.previousWeight,
    required this.previousReps,
    this.weight = 0,
    this.reps = 0,
  });
}
