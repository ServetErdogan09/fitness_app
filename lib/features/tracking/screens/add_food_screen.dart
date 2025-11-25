import 'package:fitness_app/features/tracking/provider/foodEntry.notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFoodScreen extends ConsumerStatefulWidget {
  final int mealId;
  const AddFoodScreen({required this.mealId, super.key});

  @override
  ConsumerState<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends ConsumerState<AddFoodScreen> {
  @override
  void initState() {
    super.initState();
    ref
        .read(foodEntryProvider(widget.mealId).notifier)
        .getFoodEntry(widget.mealId);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(foodEntryProvider(widget.mealId));

    return Scaffold(
      appBar: AppBar(title: const Text('Yiyecek Ekle')),
      body: state.isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: state.foodEntry.length,
              itemBuilder: (context, index) {
                final food = state.foodEntry[index];
                return ListTile(
                  title: Text(food.yiyecekAdi),
                  subtitle: Text('${food.kalori.toStringAsFixed(0)} kcal'),
                  onTap: () {
                    // Seçili yiyeceği ekle
                  },
                );
              },
            ),
    );
  }
}
