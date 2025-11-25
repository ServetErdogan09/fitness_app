import 'package:fitness_app/core/providers/database_provider.dart';
import 'package:fitness_app/core/services/local_databse_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/nutrition.dart';

class NutritionState {
  final List<Meal> meals;
  final NutritionGoal? goal;

  final double totalCalories;
  final double totalProtein;
  final double totalCarbs;
  final double totalFat;

  final bool isLoading;
  final DateTime selectedDate;

  NutritionState({
    this.meals = const [],
    this.goal,
    this.totalCalories = 0.0,
    this.totalProtein = 0.0,
    this.totalCarbs = 0.0,
    this.totalFat = 0.0,
    this.isLoading = true,
    DateTime? selectedDate,
  }) : selectedDate = selectedDate ?? DateTime.now();

  NutritionState copyWith({
    List<Meal>? meals,
    NutritionGoal? goal,
    double? totalCalories,
    double? totalProtein,
    double? totalCarbs,
    double? totalFat,
    bool? isLoading,
    DateTime? selectedDate,
  }) {
    return NutritionState(
      meals: meals ?? this.meals,
      goal: goal ?? this.goal,
      totalCalories: totalCalories ?? this.totalCalories,
      totalProtein: totalProtein ?? this.totalProtein,
      totalCarbs: totalCarbs ?? this.totalCarbs,
      totalFat: totalFat ?? this.totalFat,
      isLoading: isLoading ?? this.isLoading,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}

class NutritionNotifier extends StateNotifier<NutritionState> {
  final DatabaseService db;
  final int _userId = 1;

  NutritionNotifier(this.db) : super(NutritionState()) {
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    state = state.copyWith(isLoading: true);
    try {
      final todayMeals = await db.getMealsForDay(_userId, state.selectedDate);
      final currentGoal = await db.getNutritionGoal(_userId);

      final calculatedTotalCalories = todayMeals.fold(
        0.0,
        (sum, meal) => sum + meal.toplamKalori,
      );

      final calculatedTotalProtein = todayMeals.fold(
        0.0,
        (sum, meal) => sum + meal.toplamProtein,
      );

      final calculatedTotalCarbs = todayMeals.fold(
        0.0,
        (sum, meal) => sum + meal.toplamKarbonhidrat,
      );

      final calculatedTotalFat = todayMeals.fold(
        0.0,
        (sum, meal) => sum + meal.toplamYag,
      );

      state = state.copyWith(
        meals: todayMeals,
        goal: currentGoal,
        totalCalories: calculatedTotalCalories,
        totalProtein: calculatedTotalProtein,
        totalCarbs: calculatedTotalCarbs,
        totalFat: calculatedTotalFat,
        isLoading: false,
      );
    } catch (e) {
      print('Veri yüklenirken hata oluştu: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  void setDate(DateTime newDate) {
    state = state.copyWith(selectedDate: newDate);
    _loadInitialData();
  }

  Future<void> updateGoal(NutritionGoal goal) async {
    goal.kullaniciId = _userId;
    goal.sonGuncellemeTarihi = DateTime.now();
    await db.saveNutritionGoal(goal);
    await _loadInitialData();
  }

  Future<void> addFoodEntry({
    required FoodEntry newFood,
    required String mealType,
  }) async {
    Meal? existingMeal;
    try {
      existingMeal = state.meals.firstWhere((m) => m.ogunTuru == mealType);
    } catch (e) {
      existingMeal = null;
    }

    if (existingMeal == null) {
      existingMeal = Meal()
        ..kullaniciId = _userId
        ..tarih = state.selectedDate
        ..ogunTuru = mealType
        ..toplamKalori = 0
        ..toplamProtein = 0
        ..toplamKarbonhidrat = 0
        ..toplamYag = 0;

      await db.saveMeal(existingMeal);
    }

    newFood.yemekId = existingMeal.id;
    await db.saveFoodEntry(newFood);

    existingMeal.toplamKalori += newFood.kalori;
    existingMeal.toplamProtein += newFood.protein;
    existingMeal.toplamKarbonhidrat += newFood.karbonhidrat;
    existingMeal.toplamYag += newFood.yag;

    await db.saveMeal(existingMeal);

    await _loadInitialData();
  }

  Future<void> deleteFoodEntry(int foodEntryId, Meal parentMeal) async {
    await db.deleteFoodEntry(foodEntryId);
    await _loadInitialData();
  }

  Future<void> deleteMeal(int mealId) async {
    await db.deleteMeal(mealId);
    await _loadInitialData();
  }
}

final nutritionNotifierProvider =
    StateNotifierProvider<NutritionNotifier, NutritionState>((ref) {
      final dbService = ref.watch(databaseServiceProvider);
      return NutritionNotifier(dbService);
    });
