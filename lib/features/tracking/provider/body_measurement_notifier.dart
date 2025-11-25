import 'package:fitness_app/core/providers/database_provider.dart';
import 'package:fitness_app/core/services/local_databse_service.dart';
import 'package:fitness_app/models/body_measurement.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyMeasurementState {
  final List<BodyMeasurement> measurements;
  final BodyMeasurementGoal? goal;
  final bool isLoading;

  BodyMeasurementState({
    this.measurements = const [],
    this.goal,
    this.isLoading = false,
  });

  BodyMeasurementState copyWith({
    List<BodyMeasurement>? measurements,
    BodyMeasurementGoal? goal,
    bool? isLoading,
  }) {
    return BodyMeasurementState(
      measurements: measurements ?? this.measurements,
      goal: goal ?? this.goal,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class BodyMeasurementNotifier extends StateNotifier<BodyMeasurementState> {
  final DatabaseService dbService;

  BodyMeasurementNotifier(this.dbService) : super(BodyMeasurementState()) {
    loadMeasurements();
  }

  Future<void> loadMeasurements() async {
    state = state.copyWith(isLoading: true);
    final measurements = await dbService.getAllBodyMeasurements();
    measurements.sort((a, b) => (b.tarih).compareTo(a.tarih));
    state = state.copyWith(measurements: measurements, isLoading: false);
  }

  Future<void> addMeasurement(BodyMeasurement measurement) async {
    await dbService.addBodyMeasurement(measurement);
    await loadMeasurements();
  }

  Future<void> deleteMeasurement(int id) async {
    await dbService.deleteBodyMeasurement(id);
    await loadMeasurements();
  }

  Future<void> updateMesaurment(BodyMeasurement measurement) async {
    await dbService.updateBodyMeasurement(measurement);
    await loadMeasurements();
  }

  Future<void> loadGoal(int kullaniciId) async {
    final goals = await dbService.getGoals(kullaniciId);
    state = state.copyWith(goal: goals.isNotEmpty ? goals.first : null);
  }

  Future<void> updateGoal(BodyMeasurementGoal goal) async {
    await dbService.addOrUpdateGoal(goal);
    await loadGoal(goal.kullaniciId);
  }

  Future<void> deleteGoal(int kullaniciId, int goalId) async {
    await dbService.deleteGoal(goalId);
    await loadGoal(kullaniciId);
  }
}

final bodyMeasurementProvider =
    StateNotifierProvider<BodyMeasurementNotifier, BodyMeasurementState>((ref) {
      final dbService = ref.watch(databaseServiceProvider);
      return BodyMeasurementNotifier(dbService);
    });
