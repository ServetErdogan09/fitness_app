import 'package:fitness_app/core/providers/database_provider.dart';
import 'package:fitness_app/features/profile/widgets/body_metrics_calculator_sheet.dart';
import 'package:fitness_app/features/tracking/provider/body_measurement_notifier.dart';
import 'package:fitness_app/models/user_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102215),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Info
              _buildProfileInfo(),

              const SizedBox(height: 24),

              // Basic Measurements
              _buildBasicMeasurements(),

              const SizedBox(height: 20),

              // Calculated Metrics
              _buildCalculatedMetrics(),

              const SizedBox(height: 16),
              _buildPointsSystemCard(),
              const SizedBox(height: 16),
              _buildCalculatorCard(),

              const SizedBox(height: 20),

              // Progress Reports Card
              // _buildProgressReportsCard(),
              const SizedBox(height: 20),

              // Goals Card
              //_buildGoalsCard(),
              const SizedBox(height: 20),

              // Personal Info Card
              //_buildPersonalInfoCard(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return FutureBuilder<UserPoints?>(
      future: ref.read(databaseServiceProvider).getUserPoints(1),
      builder: (context, snapshot) {
        final points = snapshot.data;

        return Column(
          children: [
            // Profile Picture
            Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF13ec49),
                      width: 3,
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://avatar.iran.liara.run/public/boy',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Color(0xFF13ec49),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Color(0xFF102215),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Name
            const Text(
              'Kullanıcı Adı',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'LexendExa',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '@kullanici',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
            ),

            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF13ec49).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF13ec49)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 8),
                  Text(
                    '${points?.currentBadge ?? "Beginner 🌱"} • Seviye ${points?.currentLevel ?? 1}',
                    style: const TextStyle(
                      color: Color(0xFF13ec49),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _showPointsInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF1C1C1E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Puan Sistemi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'LexendExa',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF9CA3AF)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildInfoRow(
                'Taban Puan',
                'Her antrenman için +50, planlı gün ise +100 puan.',
                Colors.blue,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                'Tamamlama',
                'Egzersizi tamamlarsan +10 puan.',
                Colors.green,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                'Eksik Egzersiz',
                'Setleri eksik yaparsan -10 puan ceza.',
                Colors.orange,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                'Yapılmayan',
                'Egzersizi hiç yapmazsan -20 puan ceza.',
                Colors.red,
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                'Gelişim',
                'Ağırlık artırırsan ekstra bonus puanlar!',
                Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String desc, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend',
                ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontFamily: 'Lexend',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBasicMeasurements() {
    final measurementState = ref.watch(bodyMeasurementProvider);
    final measurements = measurementState.measurements;
    final latest = measurements.isNotEmpty ? measurements.first : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildMeasurementCard(
              'Boy',
              '${latest?.boy.toStringAsFixed(0) ?? "170"} cm',
              Icons.height,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildMeasurementCard(
              'Kilo',
              '${latest?.agirlik.toStringAsFixed(1) ?? "75.5"} kg',
              Icons.monitor_weight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMeasurementCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF13ec49), size: 24),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
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
        ],
      ),
    );
  }

  Widget _buildCalculatedMetrics() {
    final measurementState = ref.watch(bodyMeasurementProvider);
    final measurements = measurementState.measurements;
    final latest = measurements.isNotEmpty ? measurements.first : null;

    // Calculate BMI
    double? bmi;
    String bmiStatus = 'Veri Yok';
    Color bmiColor = Colors.grey;

    if (latest != null && latest.boy > 0) {
      final heightInMeters = latest.boy / 100;
      bmi = latest.agirlik / (heightInMeters * heightInMeters);

      if (bmi < 18.5) {
        bmiStatus = 'Zayıf';
        bmiColor = Colors.blue;
      } else if (bmi < 25) {
        bmiStatus = 'Normal';
        bmiColor = Colors.green;
      } else if (bmi < 30) {
        bmiStatus = 'Fazla Kilolu';
        bmiColor = Colors.orange;
      } else {
        bmiStatus = 'Obez';
        bmiColor = Colors.red;
      }
    }

    // Body Fat Percentage
    String bodyFatText = latest?.vucutYuzdesi != null
        ? '%${latest!.vucutYuzdesi!.toStringAsFixed(1)}'
        : 'Veri Yok';
    String bodyFatStatus = 'Veri Yok';
    Color bodyFatColor = Colors.grey;

    if (latest?.vucutYuzdesi != null) {
      final fat = latest!.vucutYuzdesi!;
      if (fat < 15) {
        bodyFatStatus = 'Düşük';
        bodyFatColor = Colors.blue;
      } else if (fat < 25) {
        bodyFatStatus = 'İyi';
        bodyFatColor = Colors.green;
      } else {
        bodyFatStatus = 'Yüksek';
        bodyFatColor = Colors.orange;
      }
    }

    // Ideal Weight Range (based on BMI 18.5-24.9)
    String idealWeightText = 'Veri Yok';
    if (latest != null && latest.boy > 0) {
      final heightInMeters = latest.boy / 100;
      final minWeight = 18.5 * heightInMeters * heightInMeters;
      final maxWeight = 24.9 * heightInMeters * heightInMeters;
      idealWeightText =
          '${minWeight.toStringAsFixed(1)}-${maxWeight.toStringAsFixed(1)} kg';
    }

    String idealWeightStatus = 'Veri Yok';
    Color idealWeightColor = Colors.grey;
    if (bmi != null) {
      if (bmi >= 18.5 && bmi <= 24.9) {
        idealWeightStatus = 'Hedef İçinde';
        idealWeightColor = Colors.green;
      } else if (bmi < 18.5) {
        idealWeightStatus = 'Hedefin Altında';
        idealWeightColor = Colors.blue;
      } else {
        idealWeightStatus = 'Hedefin Üstünde';
        idealWeightColor = Colors.orange;
      }
    }

    // BMR (Basal Metabolic Rate) - Using Mifflin-St Jeor Equation
    // For now using a generic calculation, ideally we'd need age and gender
    String bmrText = 'Veri Yok';
    if (latest != null) {
      // Assuming male, age 29 (as shown in the UI)
      // BMR = 10 * weight(kg) + 6.25 * height(cm) - 5 * age + 5 (for men)
      final bmr = 10 * latest.agirlik + 6.25 * latest.boy - 5 * 29 + 5;
      bmrText = '${bmr.toStringAsFixed(0)} kcal';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF13ec49).withOpacity(0.1),
              const Color(0xFF0ea5e9).withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFF13ec49).withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.calculate, color: Color(0xFF13ec49), size: 24),
                SizedBox(width: 12),
                Text(
                  'Hesaplanan Değerler',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // BMI
            _buildMetricRow(
              'Vücut Kitle İndeksi (BMI)',
              bmi != null ? bmi.toStringAsFixed(1) : 'Veri Yok',
              bmiStatus,
              bmiColor,
            ),
            const SizedBox(height: 16),

            // Body Fat
            _buildMetricRow(
              'Vücut Yağ Oranı',
              bodyFatText,
              bodyFatStatus,
              bodyFatColor,
            ),
            const SizedBox(height: 16),

            // Ideal Weight
            _buildMetricRow(
              'İdeal Kilo Aralığı',
              idealWeightText,
              idealWeightStatus,
              idealWeightColor,
            ),
            const SizedBox(height: 16),

            // BMR
            _buildMetricRow(
              'Bazal Metabolizma',
              bmrText,
              'Günlük İhtiyaç',
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(
    String label,
    String value,
    String status,
    Color color,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Lexend',
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend',
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPointsSystemCard() {
    return GestureDetector(
      onTap: () => _showPointsInfoDialog(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF13ec49).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.stars_rounded,
                color: Color(0xFF13ec49),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Puan Sistemi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Nasıl puan kazanırım?',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.white.withOpacity(0.3)),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressReportsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF13ec49).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.bar_chart,
                color: Color(0xFF13ec49),
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'İlerleme Raporları',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Detaylı analiz ve istatistikler',
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 12,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF9CA3AF),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.flag, color: Colors.orange, size: 24),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hedeflerim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Kilo ve vücut hedefleri',
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 12,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF9CA3AF),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.person, color: Colors.blue, size: 24),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kişisel Bilgiler',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Profil bilgilerini düzenle',
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 12,
                      fontFamily: 'Lexend',
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF9CA3AF),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalculatorCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const BodyMetricsCalculatorSheet(),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.calculate_outlined,
                  color: Colors.purple,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vücut Değerleri Hesaplayıcı',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Kendi değerlerinizi girerek hesaplayın',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 12,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF9CA3AF),
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
