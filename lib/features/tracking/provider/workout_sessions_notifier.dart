import 'dart:async';

import 'package:fitness_app/core/providers/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fitness_app/core/services/local_databse_service.dart';
import 'package:fitness_app/models/workout_session.dart';

class WorkoutState {
  final List<WorkoutPlan> activePlans;
  final List<WorkoutSession> history;
  final WorkoutSession? currentSession;
  final List<ExerciseLog> currentLogs;
  final bool isTracking;
  final Duration elapsedDuration;
  final List<PlanExercise> exercises;
  final bool isPaused;
  bool isLoading;

  WorkoutState({
    required this.activePlans,
    required this.history,
    this.currentSession,
    required this.currentLogs,
    required this.isTracking,
    required this.elapsedDuration,
    required this.exercises,
    required this.isPaused,
    required this.isLoading,
  });

  WorkoutState copyWith({
    List<WorkoutPlan>? activePlans,
    List<WorkoutSession>? history,
    WorkoutSession? currentSession,
    List<ExerciseLog>? currentLogs,
    bool? isTracking,
    Duration? elapsedDuration,
    List<PlanExercise>? exercises,
    bool? isPaused,
    bool? isLoading,
  }) {
    return WorkoutState(
      activePlans: activePlans ?? this.activePlans,
      history: history ?? this.history,
      currentSession: currentSession ?? this.currentSession,
      currentLogs: currentLogs ?? this.currentLogs,
      isTracking: isTracking ?? this.isTracking,
      elapsedDuration: elapsedDuration ?? this.elapsedDuration,
      exercises: exercises ?? this.exercises,
      isPaused: isPaused ?? this.isPaused,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class WorkoutSessionsNotifier extends StateNotifier<WorkoutState> {
  final DatabaseService db;
  final int _userId = 1;
  final Ref ref;
  Timer? _timer;

  WorkoutSessionsNotifier(this.db, this.ref)
    : super(
        WorkoutState(
          activePlans: [],
          history: [],
          currentSession: null,
          currentLogs: [],
          isTracking: false,
          elapsedDuration: Duration.zero,
          exercises: [],
          isPaused: false,
          isLoading: false,
        ),
      ) {
    _loadHistory();
    loadActivePlans();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!state.isPaused) {
        state = state.copyWith(
          elapsedDuration: state.elapsedDuration + const Duration(seconds: 1),
        );
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void pauseWorkout() {
    state = state.copyWith(isPaused: true);
    _timer?.cancel();
  }

  void resumeWorkout() {
    state = state.copyWith(isPaused: false);
    _startTimer();
  }

  Future<void> _loadHistory() async {
    state = state.copyWith(isLoading: true);
    final history = await db.getWorkoutSessions(_userId);
    state = state.copyWith(history: history, isLoading: false);
  }

  Future<void> startWorkout([WorkoutPlan? plan]) async {
    if (state.isTracking && state.currentSession != null) {
      await finishWorkout();
    }

    var newSession = WorkoutSession()
      ..userId = _userId
      ..startTime = DateTime.now()
      ..workoutPlanId = plan?.id;

    if (plan != null) {
      newSession.sessionName = plan.planName;
    }

    final sessionId = await db.startWorkoutSession(newSession);
    newSession.id = sessionId;

    state = state.copyWith(
      currentSession: newSession,
      isTracking: true,
      currentLogs: [],
      elapsedDuration: Duration.zero,
      exercises: [], // Clear previous exercises first
      isPaused: false,
    );

    if (plan != null) {
      await loadExcercisesForPlan(plan.id);
    }

    _startTimer(); // zamanlayıcıyı başlat
  }

  Future<void> finishWorkout() async {
    if (state.currentSession == null) return;

    _stopTimer();

    final finishedSession = state.currentSession!
      ..endTime = DateTime.now()
      ..duration = state.elapsedDuration.inMinutes;

    await db.endWorkoutSession(finishedSession);

    state = state.copyWith(
      currentSession: null,
      isTracking: false,
      elapsedDuration: Duration.zero,
      currentLogs: [],
      exercises: [],
    );

    await _loadHistory();
  }

  Future<void> cancelWorkout() async {
    if (state.currentSession == null) return;

    _stopTimer();

    final sessionId = state.currentSession!.id;

    // Delete all exercise logs for this session
    final logs = await db.getExerciseLogs(sessionId);
    for (var log in logs) {
      await db.deleteExerciseLog(log.id);
    }

    // Delete the session itself
    await db.deleteWorkoutSession(sessionId);

    state = state.copyWith(
      currentSession: null,
      isTracking: false,
      elapsedDuration: Duration.zero,
      currentLogs: [],
      exercises: [],
    );

    await _loadHistory();
  }

  Future<void> saveSetLog(ExerciseLog log) async {
    log.sessionId = state.currentSession!.id;
    await db.saveExerciseLog(log);

    final updatedLogs = [...state.currentLogs, log];
    state = state.copyWith(currentLogs: updatedLogs);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // belirli bir antrenman planına ait
  Future<void> loadExcercisesForPlan(int programId) async {
    state = state.copyWith(isLoading: true);
    final exercises = await db.getPlanExercises(programId);
    state = state.copyWith(exercises: exercises, isLoading: false);
  }

  Future<void> deleteWorkoutSession(int sessionId) async {
    await db.deleteWorkoutSession(sessionId);
    await _loadHistory();
  }

  Future<void> deletePlanExercise(int exerciseId) async {
    await db.deletePlanExercise(exerciseId);
    if (state.currentSession?.workoutPlanId != null) {
      await loadExcercisesForPlan(state.currentSession!.workoutPlanId!);
    }
  }

  Future<void> deleteWorkoutPlan(int planId) async {
    await db.deleteWorkoutPlan(planId);
    final updatedPlans = state.activePlans
        .where((plan) => plan.id != planId)
        .toList();
    state = state.copyWith(activePlans: updatedPlans);
  }

  Future<void> saveWorkoutPlan(WorkoutPlan plan) async {
    await db.saveWorkoutPlan(plan);
    final updatedPlans = [...state.activePlans, plan];
    state = state.copyWith(activePlans: updatedPlans);
  }

  Future<void> loadActivePlans() async {
    state = state.copyWith(isLoading: true);
    final allPlans = await db.getWorkoutPlans(_userId);
    final activePlans = allPlans
        .where((plan) => plan.isActive == true)
        .toList();
    state = state.copyWith(activePlans: activePlans, isLoading: false);
  }

  Future<void> loadExerciseLogs(int sessionId) async {
    state = state.copyWith(isLoading: true);
    final logs = await db.getExerciseLogs(sessionId);
    state = state.copyWith(currentLogs: logs, isLoading: false);
  }

  Future<void> deleteExerciseLog(int logId) async {
    await db.deleteExerciseLog(logId);
    // Reload current logs
    if (state.currentSession != null) {
      final logs = await db.getExerciseLogs(state.currentSession!.id);
      state = state.copyWith(currentLogs: logs);
    }
  }

  Future<void> deleteSetLogByDetails(String exerciseName, int setNumber) async {
    if (state.currentSession == null) return;

    // Find the log to delete
    final logToDelete = state.currentLogs.firstWhere(
      (log) => log.exerciseName == exerciseName && log.setNumber == setNumber,
      orElse: () => ExerciseLog(),
    );

    if (logToDelete.id != 0) {
      await db.deleteExerciseLog(logToDelete.id);
      final updatedLogs = state.currentLogs
          .where((log) => log.id != logToDelete.id)
          .toList();
      state = state.copyWith(currentLogs: updatedLogs);
    }
  }

  Future<WorkoutSession?> getIncompleteSessionForToday(
    int planId,
    DateTime date,
  ) async {
    final sessions = await db.getWorkoutSessions(_userId);

    try {
      return sessions.firstWhere(
        (session) =>
            session.workoutPlanId == planId &&
            session.endTime == null &&
            _isSameDay(session.startTime, date),
      );
    } catch (e) {
      return null;
    }
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Future<void> restoreSession(WorkoutSession session) async {
    state = state.copyWith(
      currentSession: session,
      isTracking: true,
      elapsedDuration: Duration.zero,
      isPaused: false,
    );

    // Load logs for this session
    final logs = await db.getExerciseLogs(session.id);
    state = state.copyWith(currentLogs: logs);

    _startTimer();
  }
}

final workoutProvider =
    StateNotifierProvider<WorkoutSessionsNotifier, WorkoutState>((ref) {
      final dbService = ref.watch(databaseServiceProvider);
      return WorkoutSessionsNotifier(dbService, ref);
    });
