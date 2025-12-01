import 'package:fitness_app/models/body_measurement.dart';
import 'package:fitness_app/models/nutrition.dart';
import 'package:fitness_app/models/workout_session.dart';
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
    ], directory: dir.path);
  }

  // Ölcüm ekleme
  Future<void> addBodyMeasurement(BodyMeasurement measurement) async {
    await isar.writeTxn(() async {
      await isar.bodyMeasurements.put(measurement);
    });
  }

  // tarihe göre buttun ölçümleri çek
  Future<List<BodyMeasurement>> getAllBodyMeasurements() async {
    return await isar.bodyMeasurements.where().sortByTarihDesc().findAll();
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
      // eğer plan siliniyorsa ona ait egzersizlerde silinsin
      await isar.planExercises.filter().programIdEqualTo(id).deleteAll();
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
}
