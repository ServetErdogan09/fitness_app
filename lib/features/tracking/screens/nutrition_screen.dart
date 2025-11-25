import 'package:fitness_app/config/app_themes.dart';
import 'package:fitness_app/features/tracking/provider/nutrition_notifier.dart';
import 'package:fitness_app/features/tracking/screens/add_food_screen.dart';
import 'package:fitness_app/models/nutrition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class NutritionScreen extends ConsumerStatefulWidget {
  const NutritionScreen({super.key});

  @override
  ConsumerState<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends ConsumerState<NutritionScreen> {
  String _selectedPeriod = 'Günlük';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nutritionNotifierProvider);
    final goal = state.goal;
    final today = DateTime.now();

    bool isToday =
        today.year == state.selectedDate.year &&
        today.month == state.selectedDate.month &&
        today.day == state.selectedDate.day;

    return Scaffold(
      backgroundColor: const Color(0xFF102216),
      appBar: AppBar(
        backgroundColor: const Color(0xFF102216),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () {
                final newDate = state.selectedDate.subtract(
                  const Duration(days: 1),
                );
                ref.read(nutritionNotifierProvider.notifier).setDate(newDate);
              },
            ),
            Text(
              DateFormat('d MMMM yyyy', 'tr_TR').format(state.selectedDate),
              style: TextStyle(
                color: isToday ? AppColors.primary : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white),
              onPressed: () {
                final newDate = state.selectedDate.add(const Duration(days: 1));
                ref.read(nutritionNotifierProvider.notifier).setDate(newDate);
              },
            ),
          ],
        ),
      ),
      body: state.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bugünün Özeti
                  _buildTodaySummary(state, goal),
                  const SizedBox(height: 24),

                  // Hedef Belirleme
                  _buildGoalSection(goal),
                  const SizedBox(height: 24),

                  // Öğün Listesi
                  _buildMealsList(state),
                  const SizedBox(height: 80),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Hızlı yiyecek ekleme
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Color(0xFF102216)),
      ),
    );
  }

  Widget _buildTodaySummary(NutritionState state, NutritionGoal? goal) {
    final calorieGoal = goal?.hedefKalori ?? 2000;
    final proteinGoal = goal?.hedefProtein ?? 120;
    final carbsGoal = goal?.hedefKarbonhidrat ?? 200;
    final fatGoal = goal?.hedefYag ?? 65;

    final calorieProgress = (state.totalCalories / calorieGoal).clamp(0.0, 1.0);
    final proteinProgress = (state.totalProtein / proteinGoal).clamp(0.0, 1.0);
    final carbsProgress = (state.totalCarbs / carbsGoal).clamp(0.0, 1.0);
    final fatProgress = (state.totalFat / fatGoal).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bugünün Özeti',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Kalori Progress
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Alınan Kalori',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                '${state.totalCalories.toStringAsFixed(0)} / ${calorieGoal.toStringAsFixed(0)} kcal',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: calorieProgress,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Kalan: ${(calorieGoal - state.totalCalories).toStringAsFixed(0)} kcal',
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),

          const SizedBox(height: 20),

          // Makrolar
          Row(
            children: [
              Expanded(
                child: _buildMacroCard(
                  'Protein',
                  state.totalProtein,
                  proteinGoal,
                  proteinProgress,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMacroCard(
                  'Karbonhidrat',
                  state.totalCarbs,
                  carbsGoal,
                  carbsProgress,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMacroCard(
                  'Yağ',
                  state.totalFat,
                  fatGoal,
                  fatProgress,
                  Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMacroCard(
    String name,
    double current,
    double goal,
    double progress,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${current.toStringAsFixed(0)}g / ${goal.toStringAsFixed(0)}g',
          style: const TextStyle(color: Colors.white54, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildGoalSection(NutritionGoal? goal) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hedef Belirleme',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  //
                },
                icon: const Text(
                  'Düzenle',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                label: const Icon(
                  Icons.edit_outlined,
                  color: AppColors.primary,
                  size: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Period Selector
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(child: _buildPeriodButton('Günlük')),
                Expanded(child: _buildPeriodButton('Haftalık')),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Goal Cards
          Row(
            children: [
              Expanded(
                child: _buildGoalCard(
                  'Kalori',
                  goal?.hedefKalori ?? 0,
                  'kcal',
                  Icons.local_fire_department,
                  AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildGoalCard(
                  'Protein',
                  goal?.hedefProtein ?? 0,
                  'g',
                  Icons.egg,
                  Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildGoalCard(
                  'Karbonhidrat',
                  goal?.hedefKarbonhidrat ?? 0,
                  'g',
                  Icons.bakery_dining,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildGoalCard(
                  'Yağ',
                  goal?.hedefYag ?? 0,
                  'g',
                  Icons.water_drop,
                  Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodButton(String period) {
    final isSelected = _selectedPeriod == period;
    return GestureDetector(
      onTap: () => setState(() => _selectedPeriod = period),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            period,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalCard(
    String name,
    double value,
    String unit,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(
                name,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              text: value.toStringAsFixed(0),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: ' $unit',
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealsList(NutritionState state) {
    final mealTypes = [
      'Kahvaltı',
      'Öğle Yemeği',
      'Akşam Yemeği',
      'Ara Öğünler',
    ];

    return Column(
      children: mealTypes.map((mealType) {
        final meal = state.meals
            .where((m) => m.ogunTuru == mealType)
            .firstOrNull;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildMealCard(mealType, meal),
        );
      }).toList(),
    );
  }

  Widget _buildMealCard(String mealType, Meal? meal) {
    void navigateToAddFood() {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const AddFoodScreen()));
      print('$mealType için yiyecek ekleniyor...');
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.only(bottom: 8),
          title: Text(
            meal != null
                ? '$mealType - ${meal.toplamKalori.toStringAsFixed(0)} kcal'
                : mealType,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconColor: Colors.white54,
          collapsedIconColor: Colors.white54,
          children: [
            if (meal != null)
              /*
              MealDetailView(
                mealId: meal.id!, // Gerekli ID'yi Family Provider'a gönderiyoruz
                mealType: mealType,
                onAddFood: navigateToAddFood, 
              ),
              */
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: AppColors.primary,
                  size: 20,
                ),
                label: const Text(
                  'Yiyecek Ekle',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItem(FoodEntry food) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.restaurant, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.yiyecekAdi,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${food.porsiyonMiktari}${food.porsiyonBirim}',
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            '${food.kalori.toStringAsFixed(0)} kcal',
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
