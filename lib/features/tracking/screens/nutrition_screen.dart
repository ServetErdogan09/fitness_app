import 'package:fitness_app/config/app_themes.dart';
import 'package:fitness_app/features/tracking/provider/foodEntry.notifier.dart';
import 'package:fitness_app/features/tracking/provider/nutrition_notifier.dart';
import 'package:fitness_app/features/tracking/widgets/build_text_filed.dart';
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
  // String _selectedPeriod = 'Günlük';

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
                  _buildMealsList(state, isToday),
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
        color: AppColors.cardDark.withOpacity(0.2),
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
        color: AppColors.cardDark.withOpacity(0.2),
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
                onPressed: () => _showGoalModal(context, goal),
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

          /*
          // Period Selector
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                //Expanded(child: _buildPeriodButton('Günlük')),
                // Expanded(child: _buildPeriodButton('Haftalık')),
              ],
            ),
          ),
          */
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

  /* günlük - haftalık
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
  */

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
        color: AppColors.cardDark.withOpacity(0.2),
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

  Widget _buildMealsList(NutritionState state, bool isToday) {
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
          child: _buildMealCard(mealType, meal, isToday),
        );
      }).toList(),
    );
  }

  Widget _buildMealCard(String mealType, Meal? meal, bool isToday) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.cardDark.withOpacity(0.2)
            : AppColors.cardLight, // kart rengi
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.white10 : Colors.grey[300]!,
        ),
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
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: isDark
                  ? AppColors.textDark
                  : AppColors.textLight, // başlık rengi
            ),
          ),
          iconColor: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
          collapsedIconColor: isDark
              ? AppColors.textSecondaryDark
              : AppColors.textSecondaryLight,
          children: [
            if (meal != null)
              Consumer(
                builder: (context, ref, _) {
                  final foodState = ref.watch(foodEntryProvider(meal.id));

                  if (foodState.isLoading == true) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final foodEntries = foodState.foodEntry;

                  if (foodEntries.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Henüz yemek eklenmemiş',
                        style: TextStyle(
                          color: isDark
                              ? AppColors.textSecondaryDark
                              : AppColors.textSecondaryLight,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }

                  return Column(
                    children: foodEntries.map((food) {
                      int index = foodEntries.indexOf(food);
                      return Column(
                        children: [
                          _buildFoodItem(food, meal, isToday),
                          if (index != foodEntries.length - 1)
                            Divider(
                              color: isDark
                                  ? AppColors.white10
                                  : Colors.grey[300],
                              thickness: 1,
                              height: 1,
                            ),
                        ],
                      );
                    }).toList(),
                  );
                },
              )
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Henüz yemek eklenmemiş',
                  style: TextStyle(
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                    fontSize: 14,
                  ),
                ),
              ),
            const SizedBox(height: 8),
            if (isToday) ...{
              TextButton.icon(
                onPressed: () => _showAddFoodBottomSheet(context, mealType),
                icon: Icon(
                  Icons.add_circle_outline,
                  color: AppColors.primary, // ana renk
                ),
                label: Text(
                  'Yiyecek Ekle',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            },
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItem(FoodEntry food, Meal meal, bool isToday) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.yiyecekAdi,
                  style: const TextStyle(
                    fontSize: 16,
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
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),

          if (isToday) ...{
            IconButton(
              onPressed: () {
                _showEditFoodBottomSheet(
                  BuildContext,
                  meal.ogunTuru,
                  food,
                  meal.id,
                );
              },
              icon: const Icon(Icons.edit, color: Colors.cyanAccent),
            ),

            IconButton(
              onPressed: () {
                ref
                    .read(foodEntryProvider(meal.id).notifier)
                    .deleteFoodEntry(food.id, meal.id);
              },
              icon: const Icon(Icons.delete, color: Colors.redAccent),
            ),
          },
        ],
      ),
    );
  }

  void _showAddFoodBottomSheet(BuildContext context, String mealType) {
    final foodNameController = TextEditingController();
    final gramsController = TextEditingController();
    final caloriesController = TextEditingController();
    final carbsController = TextEditingController();
    final fatController = TextEditingController();
    final proteinController = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF102216),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Yiyecek Ekle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mealType,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Yiyecek bilgilerini girin',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 24),
              buildTextField(
                foodNameController,
                'Yiyecek Adı',
                Icons.restaurant,
                keyboardInfo: false,
              ),
              const SizedBox(height: 16),
              buildTextField(gramsController, 'Miktar (gram)', Icons.scale),
              const SizedBox(height: 16),
              buildTextField(
                caloriesController,
                'Kalori (kcal)',
                Icons.local_fire_department,
              ),
              const SizedBox(height: 16),
              buildTextField(
                carbsController,
                'Karbonhidrat (g)',
                Icons.bakery_dining,
              ),
              const SizedBox(height: 16),
              buildTextField(fatController, 'Yağ (g)', Icons.water_drop),
              const SizedBox(height: 16),
              buildTextField(proteinController, 'Protein (g)', Icons.egg),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF13EC5B),
                    foregroundColor: const Color(0xFF102216),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    if (foodNameController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Lütfen yiyecek adını girin'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                      return;
                    }

                    final grams = double.tryParse(gramsController.text) ?? 0;
                    final calories =
                        double.tryParse(caloriesController.text) ?? 0;
                    final carbs = double.tryParse(carbsController.text) ?? 0;
                    final fat = double.tryParse(fatController.text) ?? 0;
                    final protein =
                        double.tryParse(proteinController.text) ?? 0;

                    if (grams <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Lütfen geçerli bir miktar girin',
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                      return;
                    }

                    final foodEntry = FoodEntry()
                      ..yiyecekAdi = foodNameController.text.trim()
                      ..porsiyonMiktari = grams
                      ..porsiyonBirim = 'gr'
                      ..kalori = calories
                      ..karbonhidrat = carbs
                      ..yag = fat
                      ..protein = protein;

                    await ref
                        .read(nutritionNotifierProvider.notifier)
                        .addFoodEntry(newFood: foodEntry, mealType: mealType);

                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${foodNameController.text} eklendi'),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Kaydet',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditFoodBottomSheet(
    BuildContext,
    String maleType,
    FoodEntry foodEntry,
    int mealId,
  ) {
    final foodNameController = TextEditingController(
      text: foodEntry.yiyecekAdi.toString(),
    );

    final gramsController = TextEditingController(
      text: foodEntry.porsiyonMiktari.toString(),
    );
    final caloriesController = TextEditingController(
      text: foodEntry.kalori.toString(),
    );
    final carbsController = TextEditingController(
      text: foodEntry.karbonhidrat.toString(),
    );
    final fatController = TextEditingController(text: foodEntry.yag.toString());
    final proteinController = TextEditingController(
      text: foodEntry.protein.toString(),
    );

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF102216),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Yiyecek Düzenle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        maleType,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Yiyecek bilgilerini girin',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 24),
              buildTextField(
                foodNameController,
                'Yiyecek Adı',
                Icons.restaurant,
                keyboardInfo: false,
              ),
              const SizedBox(height: 16),
              buildTextField(gramsController, 'Miktar (gram)', Icons.scale),
              const SizedBox(height: 16),
              buildTextField(
                caloriesController,
                'Kalori (kcal)',
                Icons.local_fire_department,
              ),
              const SizedBox(height: 16),
              buildTextField(
                carbsController,
                'Karbonhidrat (g)',
                Icons.bakery_dining,
              ),
              const SizedBox(height: 16),
              buildTextField(fatController, 'Yağ (g)', Icons.water_drop),
              const SizedBox(height: 16),
              buildTextField(proteinController, 'Protein (g)', Icons.egg),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF13EC5B),
                    foregroundColor: const Color(0xFF102216),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    if (foodNameController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Lütfen yiyecek adını girin'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                      return;
                    }

                    final grams = double.tryParse(gramsController.text) ?? 0;
                    final calories =
                        double.tryParse(caloriesController.text) ?? 0;
                    final carbs = double.tryParse(carbsController.text) ?? 0;
                    final fat = double.tryParse(fatController.text) ?? 0;
                    final protein =
                        double.tryParse(proteinController.text) ?? 0;

                    if (grams <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Lütfen geçerli bir miktar girin',
                          ),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                      return;
                    }

                    foodEntry
                      ..yiyecekAdi = foodNameController.text.trim()
                      ..porsiyonMiktari = grams
                      ..porsiyonBirim = 'gr'
                      ..kalori = calories
                      ..karbonhidrat = carbs
                      ..yag = fat
                      ..protein = protein;

                    await ref
                        .read(foodEntryProvider(mealId).notifier)
                        .updateFoodEntry(foodEntry, mealId);

                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${foodNameController.text} güncelendi',
                          ),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Güncele',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showGoalModal(BuildContext context, NutritionGoal? currentGoal) {
    final targetCalories = TextEditingController(
      text: currentGoal?.hedefKalori.toString() ?? '',
    );
    final targetCarbohydrate = TextEditingController(
      text: currentGoal?.hedefKarbonhidrat.toString() ?? '',
    );
    final targetProtein = TextEditingController(
      text: currentGoal?.hedefProtein.toString() ?? '',
    );

    final targetFat = TextEditingController(
      text: currentGoal?.hedefYag.toString() ?? '',
    );

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF102216),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hedef Belirleme',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white70),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Ulaşmak istediğiniz hedef değerleri girin',
                style: TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 24),
              buildTextField(
                targetCalories,
                'Hedef Calori (kcal) ',
                Icons.fire_extinguisher,
              ),
              const SizedBox(height: 16),
              buildTextField(
                targetCarbohydrate,
                'Hedef Karbonhidarat (g) ',
                Icons.bakery_dining,
              ),
              const SizedBox(height: 16),
              buildTextField(targetProtein, 'Hedef Protein (g)', Icons.egg),

              const SizedBox(height: 16),
              buildTextField(targetFat, 'Hedef Yağ (g)', Icons.water_drop),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF13EC5B),
                    foregroundColor: const Color(0xFF102216),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    final goal = NutritionGoal()
                      ..hedefKalori = double.tryParse(targetCalories.text) ?? 0
                      ..hedefKarbonhidrat =
                          double.tryParse(targetCarbohydrate.text) ?? 0
                      ..hedefProtein = double.tryParse(targetProtein.text) ?? 0
                      ..hedefYag = double.tryParse(targetFat.text) ?? 0
                      ..tarih = DateTime.now()
                      ..sonGuncellemeTarihi = DateTime.now();

                    if (currentGoal != null) {
                      goal.id = currentGoal.id;
                    }

                    await ref
                        .read(nutritionNotifierProvider.notifier)
                        .updateGoal(goal);

                    if (context.mounted) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Hedefler güncellendi'),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Hedefleri Kaydet',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
