import 'dart:convert';
import 'package:fitness_app/core/services/local_databse_service.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:fitness_app/models/user_points.dart';

class PointsService {
  final DatabaseService db;

  PointsService(this.db);

  Future<PointCalculation> calculateWorkoutPoints({
    required WorkoutSession session,
    required List<ExerciseLog> logs,
    required WorkoutPlan? plan,
  }) async {
    final basePoints = _calculateBasePoints(session, plan);

    //  Set/Reps bonusu
    final setRepsBonus = await _calculateSetRepsBonus(logs, plan);

    //  Ağırlık artışı bonusu
    final weightBonus = await _calculateWeightBonus(logs, session.userId);

    //  Tutarlılık bonusu
    final consistencyBonus = await _calculateConsistencyBonus(session.userId);

    return PointCalculation(
      basePoints: basePoints,
      setRepsBonus: setRepsBonus,
      weightBonus: weightBonus,
      consistencyBonus: consistencyBonus,
      totalPoints: basePoints + setRepsBonus + weightBonus + consistencyBonus,
    );
  }

  int _calculateBasePoints(WorkoutSession session, WorkoutPlan? plan) {
    if (plan == null) {
      // Serbest çalışma
      return 50;
    }

    final sessionDate = session.startTime;
    final dayOfWeek = sessionDate.weekday; // 1=Monday, 7=Sunday

    final dayNames = ['', 'Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
    final sessionDayName = dayNames[dayOfWeek];

    final isPlannedDay = plan.days.any((day) => day.name == sessionDayName);

    return isPlannedDay ? 100 : 50;
  }

  Future<int> _calculateSetRepsBonus(
    List<ExerciseLog> logs,
    WorkoutPlan? plan,
  ) async {
    if (plan == null) return 0;

    // Plan egzersizlerini getir
    final planExercises = await db.getPlanExercises(plan.id);
    if (planExercises.isEmpty) return 0;

    int totalBonus = 0;

    for (final planEx in planExercises) {
      final exerciseLogs = logs
          .where((l) => l.exerciseName == planEx.exerciseName)
          .toList();

      // HİÇ YAPILMAMIŞSA (Untouched)
      if (exerciseLogs.isEmpty) {
        totalBonus -= 20; // Ceza
        continue;
      }

      // Planlanan set sayısı
      final plannedSets = int.tryParse(planEx.setCount) ?? 0;
      if (plannedSets == 0) continue;

      // Yapılan set sayısı
      final completedSets = exerciseLogs.map((l) => l.setNumber).toSet().length;

      if (completedSets >= plannedSets) {
        // TAMAMLANMIŞ (Complete)
        totalBonus += 10;
      } else {
        // EKSİK YAPILMIŞ (Incomplete)
        totalBonus -= 10; // Ceza
      }
    }

    return totalBonus;
  }

  Future<int> _calculateWeightBonus(List<ExerciseLog> logs, int userId) async {
    if (logs.isEmpty) return 0;

    int totalBonus = 0;
    final processedExercises = <String>{};

    for (final log in logs) {
      // Her egzersiz için sadece bir kez hesapla
      if (processedExercises.contains(log.exerciseName)) continue;
      processedExercises.add(log.exerciseName);

      // Önceki logu getir
      final previousLog = await db.getPreviousExerciseLog(
        userId,
        log.exerciseName,
      );

      if (previousLog == null) continue;

      // Ağırlık artışını hesapla
      final currentWeight = log.weight;
      final previousWeight = previousLog.weight;

      if (previousWeight == 0) continue;

      final weightIncrease = (currentWeight - previousWeight) / previousWeight;

      if (weightIncrease > 0) {
        // Bonus hesapla (x2 çarpıyoruz, max 100)
        final bonus = (weightIncrease * 100 * 2).round().clamp(0, 100);
        totalBonus += bonus;
      }
    }

    return totalBonus;
  }

  Future<int> _calculateConsistencyBonus(int userId) async {
    final now = DateTime.now();
    final sevenDaysAgo = now.subtract(const Duration(days: 7));

    final allSessions = await db.getWorkoutSessions(userId);
    final recentSessions = allSessions
        .where(
          (s) => s.startTime.isAfter(sevenDaysAgo) && s.endTime != null,
        ) // Tamamlanmış
        .toList();

    final workoutCount = recentSessions.length;

    if (workoutCount >= 5) {
      return 50;
    } else if (workoutCount >= 3) {
      return 20;
    }

    return 0;
  }

  Future<void> updateUserPoints(
    int userId,
    PointCalculation calculation,
  ) async {
    var userPoints = await db.getUserPoints(userId);

    final now = DateTime.now();

    if (userPoints == null) {
      userPoints = UserPoints()
        ..userId = userId
        ..totalPoints = calculation.totalPoints
        ..weeklyPoints = calculation.totalPoints
        ..monthlyPoints = calculation.totalPoints
        ..lastUpdated = now
        ..weekStartDate = _getWeekStart(now)
        ..monthStartDate = _getMonthStart(now);
    } else {
      if (_shouldResetWeekly(userPoints.weekStartDate, now)) {
        userPoints.weeklyPoints = 0;
        userPoints.weekStartDate = _getWeekStart(now);
      }

      if (_shouldResetMonthly(userPoints.monthStartDate, now)) {
        userPoints.monthlyPoints = 0;
        userPoints.monthStartDate = _getMonthStart(now);
      }

      userPoints.totalPoints += calculation.totalPoints;
      userPoints.weeklyPoints += calculation.totalPoints;
      userPoints.monthlyPoints += calculation.totalPoints;
      userPoints.lastUpdated = now;
    }

    // Seviye ve rozet güncelle
    userPoints.currentLevel = _calculateLevel(userPoints.totalPoints);
    userPoints.currentBadge = _getBadge(userPoints.currentLevel ?? 1);

    // Kaydet
    await db.saveUserPoints(userPoints);
  }

  int _calculateLevel(int totalPoints) {
    return (totalPoints / 100).floor() + 1;
  }

  String _getBadge(int level) {
    if (level >= 50) return "Elite 🏆";
    if (level >= 30) return "Advanced 💪";
    if (level >= 15) return "Intermediate ⭐";
    return "Beginner 🌱";
  }

  DateTime _getWeekStart(DateTime date) {
    final weekday = date.weekday; // 1=Monday
    return DateTime(date.year, date.month, date.day - (weekday - 1));
  }

  DateTime _getMonthStart(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }

  bool _shouldResetWeekly(DateTime? weekStart, DateTime now) {
    if (weekStart == null) return true;
    final currentWeekStart = _getWeekStart(now);
    return currentWeekStart.isAfter(weekStart);
  }

  bool _shouldResetMonthly(DateTime? monthStart, DateTime now) {
    if (monthStart == null) return true;
    final currentMonthStart = _getMonthStart(now);
    return currentMonthStart.isAfter(monthStart);
  }
}
