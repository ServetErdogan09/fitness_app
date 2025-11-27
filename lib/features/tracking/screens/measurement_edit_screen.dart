import 'package:fitness_app/config/app_themes.dart';
import 'package:fitness_app/features/tracking/provider/body_measurement_notifier.dart';
import 'package:fitness_app/models/body_measurement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MeasurementEditScreen extends ConsumerStatefulWidget {
  final BodyMeasurement measurement;

  const MeasurementEditScreen({super.key, required this.measurement});

  @override
  ConsumerState<MeasurementEditScreen> createState() =>
      _MeasurementEditScreenState();
}

class _MeasurementEditScreenState extends ConsumerState<MeasurementEditScreen> {
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _fatController;
  late TextEditingController _muscleController;
  late TextEditingController _waistController;
  late TextEditingController _chestController;
  late TextEditingController _hipController;
  late TextEditingController _armController;

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController(
      text: widget.measurement.agirlik.toString(),
    );
    _heightController = TextEditingController(
      text: widget.measurement.boy.toString(),
    );
    _fatController = TextEditingController(
      text: widget.measurement.vucutYuzdesi?.toString() ?? '',
    );
    _muscleController = TextEditingController(
      text: widget.measurement.kasKutlesi?.toString() ?? '',
    );
    _waistController = TextEditingController(
      text: widget.measurement.belCevresi?.toString() ?? '',
    );
    _chestController = TextEditingController(
      text: widget.measurement.gogusCevresi?.toString() ?? '',
    );
    _hipController = TextEditingController(
      text: widget.measurement.kalcaCevresi?.toString() ?? '',
    );
    _armController = TextEditingController(
      text: widget.measurement.pazuCevresi?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _fatController.dispose();
    _muscleController.dispose();
    _waistController.dispose();
    _chestController.dispose();
    _hipController.dispose();
    _armController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    final updatedMeasurement = BodyMeasurement()
      ..id = widget.measurement.id
      ..kullaniciId = widget.measurement.kullaniciId
      ..agirlik =
          double.tryParse(_weightController.text) ?? widget.measurement.agirlik
      ..boy = double.tryParse(_heightController.text) ?? widget.measurement.boy
      ..vucutYuzdesi = double.tryParse(_fatController.text)
      ..kasKutlesi = double.tryParse(_muscleController.text)
      ..belCevresi = double.tryParse(_waistController.text)
      ..gogusCevresi = double.tryParse(_chestController.text)
      ..kalcaCevresi = double.tryParse(_hipController.text)
      ..pazuCevresi = double.tryParse(_armController.text)
      ..tarih = widget.measurement.tarih;

    final messenger = ScaffoldMessenger.of(context);

    ref
        .read(bodyMeasurementProvider.notifier)
        .updateMesaurment(updatedMeasurement);

    context.pop();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        messenger.showSnackBar(
          SnackBar(
            content: const Text('Ölçüm güncellendi'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102216),
      appBar: AppBar(
        backgroundColor: const Color(0xFF102216),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ölçümü Düzenle',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat(
                'd MMMM yyyy',
                'tr_TR',
              ).format(widget.measurement.tarih),
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _saveChanges,
            child: const Text(
              'Kaydet',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Temel Bilgiler',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              _weightController,
              'Ağırlık (kg)',
              Icons.monitor_weight,
              isRequired: true,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              _heightController,
              'Boy (cm)',
              Icons.height,
              isRequired: true,
            ),

            const SizedBox(height: 32),
            const Text(
              'Vücut Kompozisyonu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(_fatController, 'Yağ Oranı (%)', Icons.water_drop),
            const SizedBox(height: 16),
            _buildTextField(
              _muscleController,
              'Kas Kütlesi (kg)',
              Icons.fitness_center,
            ),

            const SizedBox(height: 32),
            const Text(
              'Çevre Ölçüleri',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField(
              _waistController,
              'Bel Çevresi (cm)',
              Icons.accessibility_new,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              _chestController,
              'Göğüs Çevresi (cm)',
              Icons.accessibility,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              _hipController,
              'Kalça Çevresi (cm)',
              Icons.h_mobiledata,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              _armController,
              'Kol Çevresi (cm)',
              Icons.sports_martial_arts,
            ),

            const SizedBox(height: 32),
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
                onPressed: _saveChanges,
                child: const Text(
                  'Değişiklikleri Kaydet',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool isRequired = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label + (isRequired ? ' *' : ''),
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: const Color(0xFF13EC5B), size: 20),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF13EC5B)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
    );
  }
}
