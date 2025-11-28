import 'package:isar/isar.dart';

part 'workout_session.g.dart';

@collection
class ExerciseLog {
  Id id = Isar.autoIncrement;

  late int sessionId;
  late int exerciseId;
  late String exerciseName;
  late int setNumber;
  late double weight;
  late int reps;
  String? notes;
  DateTime? completedAt;

  int? orderIndex;
}

@embedded
class WorkoutDay {
  late String name;
}

@collection
class WorkoutSession {
  Id id = Isar.autoIncrement;
  String? sessionName;
  late int userId;
  late DateTime startTime;
  DateTime? endTime;
  double? caloriesBurned;
  int? workoutPlanId;
  int? duration;
}

@collection
class WorkoutPlan {
  Id id = Isar.autoIncrement;
  String? description;
  bool? isActive;
  late int userId;
  late String planName;
  String? goal;
  String? difficulty; // "Başlangıç", "Orta", "İleri"
  int? estimatedDuration; // dakika cinsinden
  late List<WorkoutDay> days;
  late DateTime creationDate;
}

@collection
class PlanExercise {
  Id id = Isar.autoIncrement;
  late int programId; // refers to WorkoutPlan id
  late String exerciseName;
  late String setCount;
  late String repCount;
  int? restTime; // saniye
  double? targetWeight; // kg
  String? notes; // talimatlar
}
