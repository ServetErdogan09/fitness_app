import 'package:fitness_app/core/providers/database_provider.dart';
import 'package:fitness_app/features/tracking/provider/workout_sessions_notifier.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExerciseBottomSheet extends ConsumerStatefulWidget {
  final int programId;
  final VoidCallback onExerciseAdded;

  const AddExerciseBottomSheet({
    super.key,
    required this.programId,
    required this.onExerciseAdded,
  });

  @override
  ConsumerState<AddExerciseBottomSheet> createState() =>
      _AddExerciseBottomSheetState();
}

class _AddExerciseBottomSheetState
    extends ConsumerState<AddExerciseBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _exerciseNameController = TextEditingController();
  final _setCountController = TextEditingController(text: '3');
  final _repCountController = TextEditingController(text: '10');
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _exerciseNameController.dispose();
    _setCountController.dispose();
    _repCountController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _addExercise() {
    if (_formKey.currentState!.validate()) {
      final exercise = PlanExercise()
        ..programId = widget.programId
        ..exerciseName = _exerciseNameController.text.trim()
        ..setCount = _setCountController.text.trim()
        ..repCount = _repCountController.text.trim()
        ..targetWeight = double.tryParse(_weightController.text.trim());

      ref
          .read(workoutProvider.notifier)
          .loadExcercisesForPlan(widget.programId)
          .then((_) {
            // egzersiz ekle
            ref.read(databaseServiceProvider).addPlanExercise(exercise).then((
              _,
            ) {
              widget.onExerciseAdded();
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Egzersiz başarıyla eklendi!'),
                  backgroundColor: Color(0xFF13ec49),
                ),
              );
            });
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Egzersiz Ekle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'LexendExa',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Exercise Name
                  const Text(
                    'Egzersiz Adı',
                    style: TextStyle(
                      color: Color(0xFFD1D5DB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _exerciseNameController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lexend',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Örn: Bench Press',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontFamily: 'Lexend',
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF13ec49)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Egzersiz adı gerekli';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Set Count and Rep Count Row
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Set Sayısı',
                              style: TextStyle(
                                color: Color(0xFFD1D5DB),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _setCountController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend',
                              ),
                              decoration: InputDecoration(
                                hintText: '3',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontFamily: 'Lexend',
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF13ec49),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Gerekli';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Sayı girin';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Tekrar Sayısı',
                              style: TextStyle(
                                color: Color(0xFFD1D5DB),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: _repCountController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend',
                              ),
                              decoration: InputDecoration(
                                hintText: '10',
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontFamily: 'Lexend',
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF13ec49),
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Gerekli';
                                }
                                if (int.tryParse(value) == null) {
                                  return 'Sayı girin';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Target Weight (Optional)
                  const Text(
                    'Hedef Ağırlık (kg) - Opsiyonel',
                    style: TextStyle(
                      color: Color(0xFFD1D5DB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lexend',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Örn: 80',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontFamily: 'Lexend',
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFF13ec49)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Add Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _addExercise,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF13ec49),
                        foregroundColor: const Color(0xFF102215),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Egzersiz Ekle',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lexend',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
