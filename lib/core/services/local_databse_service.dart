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
}
