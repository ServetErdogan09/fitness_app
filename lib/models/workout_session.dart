import 'package:isar/isar.dart';

part 'workout_session.g.dart';

@embedded
class ExerciseLog {
  late int exerciseId;
  late String exerciseName;
  late int setCount;
  late int repCount;
  late double weight;
}

@embedded
class WorkoutDay {
  late String name;
}

@collection
class WorkoutSession {
  Id id = Isar.autoIncrement;
  late int userId;
  late DateTime startTime;
  DateTime? endTime;
  double? caloriesBurned;
}

@collection
class WorkoutPlan {
  Id id = Isar.autoIncrement;

  late int userId;
  late String planName;
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
  int? restTime;
}
