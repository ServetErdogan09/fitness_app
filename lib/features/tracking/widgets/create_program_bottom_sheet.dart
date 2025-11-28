import 'package:fitness_app/features/tracking/provider/workout_sessions_notifier.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProgramBottomSheet extends ConsumerStatefulWidget {
  const CreateProgramBottomSheet({super.key});

  @override
  ConsumerState<CreateProgramBottomSheet> createState() =>
      _CreateProgramBottomSheetState();
}

class _CreateProgramBottomSheetState
    extends ConsumerState<CreateProgramBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _programNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  final List<String> _days = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
  final Set<String> _selectedDays = {};

  @override
  void dispose() {
    _programNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _createProgram() {
    if (_formKey.currentState!.validate() && _selectedDays.isNotEmpty) {
      final plan = WorkoutPlan()
        ..userId =
            1 // TODO: Get from auth
        ..planName = _programNameController.text.trim()
        ..description = _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim()
        ..isActive = true
        ..creationDate = DateTime.now()
        ..days = _selectedDays.map((day) => WorkoutDay()..name = day).toList();

      ref.read(workoutProvider.notifier).saveWorkoutPlan(plan);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Program başarıyla oluşturuldu!'),
          backgroundColor: Color(0xFF13ec49),
        ),
      );
    } else if (_selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('En az bir gün seçmelisiniz!'),
          backgroundColor: Colors.red,
        ),
      );
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
                        'Yeni Program Oluştur',
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

                  // Program Name
                  const Text(
                    'Program Adı',
                    style: TextStyle(
                      color: Color(0xFFD1D5DB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _programNameController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lexend',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Örn: Güç ve Hacim Programı',
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
                        return 'Program adı gerekli';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Description (Optional)
                  const Text(
                    'Açıklama (Opsiyonel)',
                    style: TextStyle(
                      color: Color(0xFFD1D5DB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _descriptionController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lexend',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Örn: 4 Haftalık, Tüm Vücut',
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
                  const SizedBox(height: 20),

                  // Day Selection
                  const Text(
                    'Antrenman Günleri',
                    style: TextStyle(
                      color: Color(0xFFD1D5DB),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _days.map((day) {
                      final isSelected = _selectedDays.contains(day);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              _selectedDays.remove(day);
                            } else {
                              _selectedDays.add(day);
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF13ec49).withOpacity(0.2)
                                : Colors.white.withOpacity(0.1),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF13ec49)
                                  : Colors.white.withOpacity(0.2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            day,
                            style: TextStyle(
                              color: isSelected
                                  ? const Color(0xFF13ec49)
                                  : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lexend',
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 32),

                  // Create Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _createProgram,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF13ec49),
                        foregroundColor: const Color(0xFF102215),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Programı Oluştur',
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
