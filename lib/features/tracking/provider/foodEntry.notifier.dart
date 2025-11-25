import 'package:fitness_app/core/providers/database_provider.dart';
import 'package:fitness_app/core/services/local_databse_service.dart';
import 'package:fitness_app/models/nutrition.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodEntryState {
  final List<FoodEntry> foodEntry;
  final bool? isLoading;

  FoodEntryState({this.foodEntry = const [], this.isLoading});

  FoodEntryState copyWith({List<FoodEntry>? foodEntry, bool? isLoading}) {
    return FoodEntryState(
      foodEntry: foodEntry ?? this.foodEntry,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class FoodEntryNoifier extends StateNotifier<FoodEntryState> {
  final DatabaseService db;

  FoodEntryNoifier({required this.db}) : super(FoodEntryState());

  Future<void> getFoodEntry(int mealId) async {
    state = state.copyWith(isLoading: true);

    try {
      final FoodEntryList = await db.getFoodEntriesByMealId(mealId);
      state = state.copyWith(foodEntry: FoodEntryList, isLoading: false);
    } catch (e) {
      print('Local DB\'den yiyecekler çekilirken hata oluştu: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteFoodEntry(int id, int mealId) async {
    await db.deleteFoodEntry(id);
    await getFoodEntry(mealId);
  }
}

final foodEntryProvider =
    StateNotifierProvider.family<FoodEntryNoifier, FoodEntryState, int>((
      ref,
      mealId,
    ) {
      final db = ref.watch(databaseServiceProvider);

      final notifier = FoodEntryNoifier(db: db);

      notifier.getFoodEntry(mealId);

      return notifier;
    });
