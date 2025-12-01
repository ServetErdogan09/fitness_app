import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

class BodyMetricsCalculatorSheet extends ConsumerStatefulWidget {
  const BodyMetricsCalculatorSheet({super.key});

  @override
  ConsumerState<BodyMetricsCalculatorSheet> createState() =>
      _BodyMetricsCalculatorSheetState();
}

class _BodyMetricsCalculatorSheetState
    extends ConsumerState<BodyMetricsCalculatorSheet> {
  final _formKey = GlobalKey<FormState>();
  bool _isMale = true;
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _neckController = TextEditingController();
  final _waistController = TextEditingController();
  final _hipController = TextEditingController();

  // Results
  double? _bmi;
  double? _bodyFat;
  double? _bmr;
  String? _idealWeightRange;

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _neckController.dispose();
    _waistController.dispose();
    _hipController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final age = int.tryParse(_ageController.text) ?? 0;
      final height = double.tryParse(_heightController.text) ?? 0;
      final weight = double.tryParse(_weightController.text) ?? 0;
      final neck = double.tryParse(_neckController.text) ?? 0;
      final waist = double.tryParse(_waistController.text) ?? 0;
      final hip = double.tryParse(_hipController.text) ?? 0;

      if (height > 0 && weight > 0) {
        setState(() {
          // BMI Calculation
          final heightInMeters = height / 100;
          _bmi = weight / (heightInMeters * heightInMeters);

          // Ideal Weight Calculation (BMI 18.5 - 24.9)
          final minWeight = 18.5 * heightInMeters * heightInMeters;
          final maxWeight = 24.9 * heightInMeters * heightInMeters;
          _idealWeightRange =
              '${minWeight.toStringAsFixed(1)} - ${maxWeight.toStringAsFixed(1)} kg';

          // BMR Calculation (Mifflin-St Jeor)
          if (_isMale) {
            _bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
          } else {
            _bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
          }

          // Body Fat Calculation (US Navy Method)
          // Men: 495 / (1.0324 - 0.19077 * log10(waist - neck) + 0.15456 * log10(height)) - 450
          // Women: 495 / (1.29579 - 0.35004 * log10(waist + hip - neck) + 0.22100 * log10(height)) - 450
          if (neck > 0 && waist > 0) {
            if (_isMale) {
              if (waist - neck > 0) {
                _bodyFat =
                    495 /
                        (1.0324 -
                            0.19077 * math.log(waist - neck) / math.ln10 +
                            0.15456 * math.log(height) / math.ln10) -
                    450;
              }
            } else {
              if (hip > 0 && (waist + hip - neck) > 0) {
                _bodyFat =
                    495 /
                        (1.29579 -
                            0.35004 * math.log(waist + hip - neck) / math.ln10 +
                            0.22100 * math.log(height) / math.ln10) -
                    450;
              }
            }
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1E),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vücut Değerleri Hesaplayıcı',
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

                // Gender Switch
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildGenderOption('Erkek', true),
                        _buildGenderOption('Kadın', false),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Inputs
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _ageController,
                        label: 'Yaş',
                        suffix: '',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _heightController,
                        label: 'Boy',
                        suffix: 'cm',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _weightController,
                        label: 'Kilo',
                        suffix: 'kg',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(
                        controller: _neckController,
                        label: 'Boyun',
                        suffix: 'cm',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller: _waistController,
                        label: 'Bel',
                        suffix: 'cm',
                      ),
                    ),
                    const SizedBox(width: 16),
                    if (!_isMale)
                      Expanded(
                        child: _buildTextField(
                          controller: _hipController,
                          label: 'Kalça',
                          suffix: 'cm',
                        ),
                      )
                    else
                      const Spacer(),
                  ],
                ),

                const SizedBox(height: 24),

                // Calculate Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _calculate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF13ec49),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'HESAPLA',
                      style: TextStyle(
                        color: Color(0xFF102215),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
                ),

                if (_bmi != null) ...[
                  const SizedBox(height: 24),
                  const Divider(color: Colors.white24),
                  const SizedBox(height: 24),
                  _buildResults(),
                ],
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOption(String label, bool isMaleOption) {
    final isSelected = _isMale == isMaleOption;
    return GestureDetector(
      onTap: () => setState(() => _isMale = isMaleOption),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF13ec49) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xFF102215) : Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend',
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String suffix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            fontFamily: 'Lexend',
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF2C2C2E),
            suffixText: suffix,
            suffixStyle: const TextStyle(color: Colors.white54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Gerekli';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildResults() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildResultCard(
                'BMI',
                _bmi?.toStringAsFixed(1) ?? '-',
                _getBMIStatus(_bmi ?? 0),
                _getBMIColor(_bmi ?? 0),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildResultCard(
                'Yağ Oranı',
                _bodyFat != null ? '%${_bodyFat!.toStringAsFixed(1)}' : '-',
                _getBodyFatStatus(_bodyFat ?? 0, _isMale),
                _getBodyFatColor(_bodyFat ?? 0, _isMale),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildResultCard(
                'BMR',
                _bmr != null ? '${_bmr!.toStringAsFixed(0)} kcal' : '-',
                'Günlük Kalori',
                Colors.purple,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildResultCard(
                'İdeal Kilo',
                _idealWeightRange ?? '-',
                'Hedef Aralığı',
                Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResultCard(
    String label,
    String value,
    String status,
    Color statusColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontFamily: 'Lexend',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getBMIStatus(double bmi) {
    if (bmi < 18.5) return 'Zayıf';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Fazla Kilolu';
    return 'Obez';
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  String _getBodyFatStatus(double fat, bool isMale) {
    if (isMale) {
      if (fat < 6) return 'Çok Düşük';
      if (fat < 14) return 'Atletik';
      if (fat < 18) return 'Fit';
      if (fat < 25) return 'Ortalama';
      return 'Yüksek';
    } else {
      if (fat < 14) return 'Çok Düşük';
      if (fat < 21) return 'Atletik';
      if (fat < 25) return 'Fit';
      if (fat < 32) return 'Ortalama';
      return 'Yüksek';
    }
  }

  Color _getBodyFatColor(double fat, bool isMale) {
    // Simplified color logic
    if (isMale) {
      if (fat < 18) return Colors.green;
      if (fat < 25) return Colors.orange;
      return Colors.red;
    } else {
      if (fat < 25) return Colors.green;
      if (fat < 32) return Colors.orange;
      return Colors.red;
    }
  }
}
