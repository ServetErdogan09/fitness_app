import 'package:fitness_app/core/services/local_databse_service.dart';
import 'package:fitness_app/models/body_measurement.dart';
import 'package:flutter/material.dart';

class BodyMeasurementProvider extends ChangeNotifier {
  final DatabaseService dbService;

  BodyMeasurementProvider({required this.dbService});

  // state private yapıp burada encapsulation yapacağız
  List<BodyMeasurement> _measurements = [];
  BodyMeasurementGoal? _goal;

  // get yapıp böylelikle istediği zaman değiştiremeyecek
  List<BodyMeasurement> get measurements => _measurements;
  BodyMeasurementGoal? get goal => _goal;

  // buttun önceden yazılan ölçüleri çek
  Future<void> loadMeasurements() async {
    _measurements = await dbService.getAllBodyMeasurements();
    notifyListeners();
  }

  // ölçümleri ekleyeceği
  Future<void> addMeasurement(BodyMeasurement measurement) async {
    await dbService.addBodyMeasurement(measurement);
    await loadMeasurements();
  }

  // ölçekleri sileceğiz
  Future<void> deleteMasurment(int id) async {
    await dbService.deleteBodyMeasurement(id);
    await loadMeasurements();
  }

  // hedefleri çek
  Future<void> loadGoal(int kullaniciId) async {
    final goals = await dbService.getGoals(kullaniciId);
    _goal = goals.isNotEmpty ? goals.first : null;
    notifyListeners();
  }

  // hedef güncele
  Future<void> updateGoal(BodyMeasurementGoal goal) async {
    await dbService.addOrUpdateGoal(goal);
    await loadGoal(goal.kullaniciId);
  }

  // hedef sil
  Future<void> deleteGoal(int kullaniciId, int goalId) async {
    await dbService.deleteGoal(goalId);
    await loadGoal(kullaniciId);
  }
}
