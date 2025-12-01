import 'package:fitness_app/models/body_measurement.dart';
import 'package:fitness_app/models/nutrition.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:fitness_app/models/user_points.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  late Isar isar;

  Future<void> initialize() async {
    // Check if Isar instance already exists
    if (Isar.instanceNames.isNotEmpty) {
      isar = Isar.getInstance()!;
      return;
    }

    final dir = await getApplicationSupportDirectory();

    isar = await Isar.open([
      BodyMeasurementSchema,
      BodyMeasurementGoalSchema,
      MealSchema,
      FoodEntrySchema,
      NutritionGoalSchema,
      WorkoutSessionSchema,
      WorkoutPlanSchema,
      PlanExerciseSchema,
      ExerciseLogSchema,
      UserPointsSchema, // YENİ: Puan bilgileri
      PointsHistorySchema, // YENİ: Puan geçmişi
    ], directory: dir.path);
  }

  // Ölcüm ekleme
  Future<void> addBodyMeasurement(BodyMeasurement measurement) async {
    await isar.writeTxn(() async {
      await isar.bodyMeasurements.put(measurement);
    });
  }

  // tarihe göre buttun ölçümleri çek
  Future<List<BodyMeasurement>> getAllBodyMeasurements(int userId) async {
    return await isar.bodyMeasurements
        .filter()
        .kullaniciIdEqualTo(userId)
        .sortByTarihDesc()
        .findAll();
  }

  // Ölçüm silme
  Future<void> deleteBodyMeasurement(int id) async {
    await isar.writeTxn(() async {
      await isar.bodyMeasurements.delete(id);
    });
  }

  // ölçüm günceleme
  Future<void> updateBodyMeasurement(BodyMeasurement bodymeasurement) async {
    await isar.writeTxn(() async {
      await isar.bodyMeasurements.put(bodymeasurement);
    });
  }

  // hedef ekleme/günceleme
  Future<void> addOrUpdateGoal(BodyMeasurementGoal goal) async {
    await isar.writeTxn(() async {
      await isar.bodyMeasurementGoals.put(goal);
    });
  }

  // Hedef listeleme
  Future<List<BodyMeasurementGoal>> getGoals(int kullaniciId) async {
    return await isar.bodyMeasurementGoals
        .filter()
        .kullaniciIdEqualTo(kullaniciId)
        .findAll();
  }

  // Hedef silme
  Future<void> deleteGoal(int id) async {
    await isar.writeTxn(() async {
      await isar.bodyMeasurementGoals.delete(id);
    });
  }

  // --- BESLENME İŞLEMLERİ----------

  //. öğün ekleme
  Future<void> saveMeal(Meal meal) async {
    await isar.writeTxn(() async {
      await isar.meals.put(meal);
    });
  }

  // yiycek ekleme
  Future<void> saveFoodEntry(FoodEntry foodEntry) async {
    await isar.writeTxn(() async {
      await isar.foodEntrys.put(foodEntry);
    });
  }

  //  Belirli bir güne ait tüm öğünleri çekme
  Future<List<Meal>> getMealsForDay(int userId, DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return await isar.meals
        .filter()
        .kullaniciIdEqualTo(userId)
        .tarihBetween(startOfDay, endOfDay)
        .findAll();
  }

  // Bir öğüne ait tüm yiycekleri çek
  Future<List<FoodEntry>> getFoodEntriesByMealId(int mealId) async {
    return await isar.foodEntrys.filter().yemekIdEqualTo(mealId).findAll();
  }

  // --- BESLENME HEDEF İŞLEMLERİ ---

  Future<void> saveNutritionGoal(NutritionGoal goal) async {
    await isar.writeTxn(() async {
      await isar.nutritionGoals.put(goal);
    });
  }

  Future<NutritionGoal?> getNutritionGoal(int userId) async {
    return await isar.nutritionGoals
        .filter()
        .kullaniciIdEqualTo(userId)
        .sortByTarihDesc()
        .findFirst();
  }

  Future<NutritionGoal?> getNutritionGoalBefore(
    int userId,
    DateTime date,
  ) async {
    final endOfDay = DateTime(
      date.year,
      date.month,
      date.day,
      23,
      59,
      59,
      999,
      999,
    );

    return await isar.nutritionGoals
        .filter()
        .kullaniciIdEqualTo(userId)
        .tarihLessThan(endOfDay, include: true)
        .sortByTarihDesc()
        .findFirst();
  }

  Future<void> deleteMeal(int id) async {
    await isar.writeTxn(() async {
      await isar.meals.delete(id);
    });
  }

  Future<void> deleteFoodEntry(int id) async {
    await isar.writeTxn(() async {
      await isar.foodEntrys.delete(id);
    });
  }

  Future<void> deleteNutrition(int id) async {
    await isar.writeTxn(() async {
      await isar.nutritionGoals.delete(id);
    });
  }

  Future<void> updateFoodEntry(FoodEntry food) async {
    await isar.writeTxn(() async {
      await isar.foodEntrys.put(food);
    });
  }

  Future<NutritionGoal?> getNutritionGoalForDay(
    int UserId,
    DateTime date,
  ) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(
      date.year,
      date.month,
      date.day,
      23,
      59,
      59,
      999,
      999,
    );

    final goals = await isar.nutritionGoals
        .filter()
        .kullaniciIdEqualTo(UserId)
        .tarihBetween(startOfDay, endOfDay)
        .findAll();

    return goals.isNotEmpty ? goals.first : null;
  }

  //------------------ Antreman işlemleri burada----------------

  // kullanıcı ilk önce hangi antrmanı ve antreman planını seçtiyse onu kaydet
  Future<void> saveWorkoutPlan(WorkoutPlan plan) async {
    await isar.writeTxn(() async {
      await isar.workoutPlans.put(plan);
    });
  }

  // kullanıcnın planladığı antremanları çek
  Future<List<WorkoutPlan>> getWorkoutPlans(int userId) async {
    return await isar.workoutPlans.filter().userIdEqualTo(userId).findAll();
  }

  Future<WorkoutPlan?> getWorkoutPlan(int planId) async {
    return await isar.workoutPlans.get(planId);
  }

  Future<void> updateWorkoutPlan(WorkoutPlan plan) async {
    await isar.writeTxn(() async {
      await isar.workoutPlans.put(plan);
    });
  }

  Future<void> deleteWorkoutPlan(int id) async {
    await isar.writeTxn(() async {
      //  Bu plana ait tüm WorkoutSession'ları bul
      final sessions = await isar.workoutSessions
          .filter()
          .workoutPlanIdEqualTo(id)
          .findAll();

      //  Her session'a ait ExerciseLog'ları sil
      for (var session in sessions) {
        await isar.exerciseLogs
            .filter()
            .sessionIdEqualTo(session.id)
            .deleteAll();
      }

      //  Bu plana ait tüm WorkoutSession'ları sil
      await isar.workoutSessions.filter().workoutPlanIdEqualTo(id).deleteAll();

      //  Bu plana ait tüm PlanExercise'ları sil
      await isar.planExercises.filter().programIdEqualTo(id).deleteAll();

      //  Son olarak WorkoutPlan'ı sil
      await isar.workoutPlans.delete(id);
    });
  }

  // kullanıcı plan exercise ekleme
  Future<void> addPlanExercise(PlanExercise exercise) async {
    await isar.writeTxn(() async {
      await isar.planExercises.put(exercise);
    });
  }

  Future<List<PlanExercise>> getPlanExercises(int programId) async {
    return await isar.planExercises
        .filter()
        .programIdEqualTo(programId)
        .findAll();
  }

  Future<void> deletePlanExercise(int id) async {
    await isar.writeTxn(() async {
      await isar.planExercises.delete(id);
    });
  }

  // kullanıcı antreman seansını başlatma
  Future<int> startWorkoutSession(WorkoutSession session) async {
    return await isar.writeTxn<int>(() async {
      await isar.workoutSessions.put(session);
      return session.id;
    });
  }

  // kullanıcı antreman seansını bitirme
  Future<void> endWorkoutSession(WorkoutSession session) async {
    await isar.writeTxn(() async {
      await isar.workoutSessions.put(session);
    });
  }

  // kullanıcıya ait tüm antreman seanslarını çekme
  Future<List<WorkoutSession>> getWorkoutSessions(int userId) async {
    return await isar.workoutSessions
        .filter()
        .userIdEqualTo(userId)
        .sortByStartTimeDesc()
        .findAll();
  }

  Future<void> deleteWorkoutSession(int id) async {
    await isar.writeTxn(() async {
      await isar.workoutSessions.delete(id);
    });
  }

  Future<void> deleteExerciseLog(int id) async {
    await isar.writeTxn(() async {
      await isar.exerciseLogs.delete(id);
    });
  }

  Future<void> saveExerciseLog(ExerciseLog log) async {
    await isar.writeTxn(() async {
      await isar.exerciseLogs.put(log);
    });
  }

  Future<List<ExerciseLog>> getExerciseLogs(int sessionId) async {
    return await isar.exerciseLogs
        .filter()
        .sessionIdEqualTo(sessionId)
        .findAll();
  }

  Future<List<ExerciseLog>> getExerciseLogsForSessions(
    List<int> sessionIds,
  ) async {
    return await isar.exerciseLogs
        .filter()
        .anyOf(sessionIds, (q, id) => q.sessionIdEqualTo(id))
        .findAll();
  }

  //------------------ PUAN SİSTEMİ İŞLEMLERİ ------------------

  Future<void> saveUserPoints(UserPoints points) async {
    await isar.writeTxn(() async {
      await isar.userPoints.put(points);
    });
  }

  /// Kullanıcının puan bilgilerini getir
  /// NEDEN: Dashboard'da göstermek için
  Future<UserPoints?> getUserPoints(int userId) async {
    return await isar.userPoints.filter().userIdEqualTo(userId).findFirst();
  }

  /// Puan geçmişi kaydet
  /// NEDEN: Her antrenman için kazanılan puanları kaydetmek
  Future<void> savePointsHistory(PointsHistory history) async {
    await isar.writeTxn(() async {
      await isar.pointsHistorys.put(history);
    });
  }

  /// Kullanıcının puan geçmişini getir (tarih aralığı ile)
  /// NEDEN: Grafik çizmek için belirli tarih aralığındaki puanları çekmek
  Future<List<PointsHistory>> getPointsHistory(
    int userId, {
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    var query = isar.pointsHistorys.filter().userIdEqualTo(userId);

    if (startDate != null) {
      query = query.earnedAtGreaterThan(startDate);
    }

    if (endDate != null) {
      query = query.earnedAtLessThan(endDate);
    }

    return await query.sortByEarnedAtDesc().findAll();
  }

  /// Belirli bir egzersiz için önceki logu getir (ağırlık karşılaştırması için)
  /// NEDEN: Ağırlık artışı bonusu hesaplamak için önceki antrenmanı bilmemiz gerekiyor
  ///
  /// NASIL ÇALIŞIR:
  /// 1. Kullanıcının tüm session'larını getir
  /// 2. Bu session'lardaki tüm logları getir
  /// 3. Aynı egzersiz adına sahip logları filtrele
  /// 4. En son yapılan logu döndür
  Future<ExerciseLog?> getPreviousExerciseLog(
    int userId,
    String exerciseName,
  ) async {
    // 1. Kullanıcının tüm session'larını getir
    final sessions = await getWorkoutSessions(userId);
    if (sessions.isEmpty) return null;

    // 2. Session ID'lerini topla
    final sessionIds = sessions.map((s) => s.id).toList();

    // 3. Bu session'lardaki tüm logları getir
    final allLogs = await getExerciseLogsForSessions(sessionIds);

    // 4. Aynı egzersiz adına sahip logları filtrele ve tarihe göre sırala
    final exerciseLogs =
        allLogs.where((log) => log.exerciseName == exerciseName).toList()..sort((
          a,
          b,
        ) {
          // completedAt varsa ona göre, yoksa session'ın startTime'ına göre sırala
          final aTime = a.completedAt ?? DateTime.now();
          final bTime = b.completedAt ?? DateTime.now();
          return bTime.compareTo(aTime); // En yeni önce
        });

    // 5. En son logu döndür (varsa)
    return exerciseLogs.isNotEmpty ? exerciseLogs.first : null;
  }
}
