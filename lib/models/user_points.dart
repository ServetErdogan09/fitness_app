import 'package:isar/isar.dart';

part 'user_points.g.dart';

@collection
class UserPoints {
  Id id = Isar.autoIncrement;

  late int userId;

  late int totalPoints;

  late int weeklyPoints;

  late int monthlyPoints;

  late DateTime lastUpdated;

  String? currentBadge;

  int? currentLevel;

  DateTime? weekStartDate;

  DateTime? monthStartDate;
}

@collection
class PointsHistory {
  Id id = Isar.autoIncrement;

  late int userId;

  late int sessionId;

  late int pointsEarned;

  late DateTime earnedAt;

  late String reason;

  String? details;

  @Index(composite: [CompositeIndex('earnedAt')])
  int get userIdIndex => userId;
}

class PointCalculation {
  final int basePoints; // Taban puan (planlanmış/serbest)
  final int setRepsBonus; // Set/Reps uyum bonusu
  final int weightBonus; // Ağırlık artışı bonusu
  final int consistencyBonus; // Tutarlılık bonusu
  final int totalPoints; // Toplam puan

  PointCalculation({
    required this.basePoints,
    required this.setRepsBonus,
    required this.weightBonus,
    required this.consistencyBonus,
    required this.totalPoints,
  });

  Map<String, dynamic> toJson() {
    return {
      'basePoints': basePoints,
      'setRepsBonus': setRepsBonus,
      'weightBonus': weightBonus,
      'consistencyBonus': consistencyBonus,
      'totalPoints': totalPoints,
    };
  }

  factory PointCalculation.fromJson(Map<String, dynamic> json) {
    return PointCalculation(
      basePoints: json['basePoints'] ?? 0,
      setRepsBonus: json['setRepsBonus'] ?? 0,
      weightBonus: json['weightBonus'] ?? 0,
      consistencyBonus: json['consistencyBonus'] ?? 0,
      totalPoints: json['totalPoints'] ?? 0,
    );
  }

  String get description {
    final parts = <String>[];
    if (basePoints > 0) parts.add('Taban: $basePoints');
    if (setRepsBonus > 0) parts.add('Set/Reps: +$setRepsBonus');
    if (weightBonus > 0) parts.add('Ağırlık: +$weightBonus');
    if (consistencyBonus > 0) parts.add('Tutarlılık: +$consistencyBonus');
    return parts.join(', ');
  }
}
