import 'package:fitness_app/models/body_measurement.dart';
import 'package:fitness_app/models/nutrition.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  late Isar isar;

  Future<void> initialize() async {
    final dir = await getApplicationSupportDirectory();

    isar = await Isar.open([
      BodyMeasurementSchema,
      BodyMeasurementGoalSchema,
      MealSchema,
      FoodEntrySchema,
      NutritionGoalSchema,
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
}
