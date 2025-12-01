import 'package:fitness_app/core/providers/database_provider.dart';
import 'package:fitness_app/core/services/points_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pointsServiceProvider = Provider<PointsService>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return PointsService(dbService);
});
