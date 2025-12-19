import 'package:fitness_app/config/app_themes.dart';
import 'package:fitness_app/features/tracking/provider/body_measurement_notifier.dart';
import 'package:fitness_app/features/tracking/screens/measurement_edit_screen.dart';
import 'package:fitness_app/features/tracking/widgets/build_text_filed.dart';
import 'package:fitness_app/models/body_measurement.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class BodyMeasurementScreen extends ConsumerStatefulWidget {
  const BodyMeasurementScreen({super.key});

  @override
  ConsumerState<BodyMeasurementScreen> createState() =>
      _BodyMeasurementScreenState();
}

class _BodyMeasurementScreenState extends ConsumerState<BodyMeasurementScreen> {
  String _selectedMetric = 'Ağırlık';
  String _selectedPeriod = '1A'; // 1A, 3A, 6A, Tümü

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bodyMeasurementProvider.notifier).loadGoal(1);
    });
  }

  void _showAddMeasurementModal(BuildContext context) {
    final weightController = TextEditingController();
    final heightController = TextEditingController();
    final fatController = TextEditingController();
    final muscleController = TextEditingController();
    final waistController = TextEditingController();
    final chestController = TextEditingController();
    final hipController = TextEditingController();
    final armController = TextEditingController();

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
              const Text(
                'Yeni Ölçüm Ekle',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              buildTextField(
                weightController,
                'Ağırlık (kg)',
                Icons.monitor_weight,
              ),
              const SizedBox(height: 12),
              buildTextField(heightController, 'Boy (cm)', Icons.height),
              const SizedBox(height: 12),
              buildTextField(fatController, 'Yağ Oranı (%)', Icons.water_drop),
              const SizedBox(height: 12),
              buildTextField(
                muscleController,
                'Kas Kütlesi (kg)',
                Icons.fitness_center,
              ),
              const SizedBox(height: 12),
              buildTextField(
                waistController,
                'Bel Çevresi (cm)',
                Icons.accessibility_new,
              ),
              const SizedBox(height: 12),
              buildTextField(
                chestController,
                'Göğüs Çevresi (cm)',
                Icons.accessibility,
              ),
              const SizedBox(height: 12),
              buildTextField(
                hipController,
                'Kalça Çevresi (cm)',
                Icons.h_mobiledata,
              ),
              const SizedBox(height: 12),
              buildTextField(
                armController,
                'Kol Çevresi (cm)',
                Icons.sports_martial_arts,
              ),
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
                  onPressed: () {
                    final Map<String, String?> fields = {
                      'Ağırlık': weightController.text,
                      'Boy': heightController.text,
                      'Yağ Oranı': fatController.text,
                      'Kas Kütlesi': muscleController.text,
                      'Bel Çevresi': waistController.text,
                      'Göğüs Çevresi': chestController.text,
                      'Kalça Çevresi': hipController.text,
                      'Kol Çevresi': armController.text,
                    };

                    final List<String> missingFields = [];

                    fields.forEach((key, value) {
                      if (value!.isEmpty || double.tryParse(value) == null) {
                        missingFields.add(value);
                      }
                    });

                    if (missingFields.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Lütfen Tüm alanları doldurnuz:\n${missingFields.join(', ')}',
                          ),
                          backgroundColor: const Color.fromARGB(
                            255,
                            244,
                            243,
                            243,
                          ),
                        ),
                      );
                      return;
                    }

                    final newMeasurement = BodyMeasurement()
                      ..kullaniciId = 1
                      ..agirlik = double.tryParse(weightController.text) ?? 0
                      ..boy = double.tryParse(heightController.text) ?? 0
                      ..vucutYuzdesi = double.tryParse(fatController.text)
                      ..kasKutlesi = double.tryParse(muscleController.text)
                      ..belCevresi = double.tryParse(waistController.text)
                      ..gogusCevresi = double.tryParse(chestController.text)
                      ..kalcaCevresi = double.tryParse(hipController.text)
                      ..pazuCevresi = double.tryParse(armController.text)
                      ..tarih = DateTime.now();

                    ref
                        .read(bodyMeasurementProvider.notifier)
                        .addMeasurement(newMeasurement);
                    Navigator.pop(context);
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

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bodyMeasurementProvider);
    final measurements = state.measurements;

    final sortedMeasurements = List<BodyMeasurement>.from(measurements)
      ..sort((a, b) => b.tarih.compareTo(a.tarih));

    final latest = sortedMeasurements.isNotEmpty
        ? sortedMeasurements.first
        : null;

    return Scaffold(
      backgroundColor: const Color(0xFF102216),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMeasurementModal(context),
        backgroundColor: const Color(0xFF13EC5B),
        child: const Icon(Icons.add, color: Color(0xFF102216)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            // kartlarım
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildGoalCard(
                    'Ağırlık',
                    latest?.agirlik,
                    state.goal?.hedefAgirlik,
                    'kg',
                    Icons.monitor_weight_outlined,
                    const Color(0xFF13EC5B),
                  ),
                  _buildGoalCard(
                    'Boy',
                    latest?.boy,
                    null, // Boy için hedef yok genelde
                    'cm',
                    Icons.height,
                    Colors.cyanAccent,
                  ),
                  _buildGoalCard(
                    'Yağ Oranı',
                    latest?.vucutYuzdesi,
                    state.goal?.hedefVucutYuzdesi,
                    '%',
                    Icons.water_drop_outlined,
                    Colors.orangeAccent,
                  ),
                  _buildGoalCard(
                    'Bel',
                    latest?.belCevresi,
                    state.goal?.hedefBelCevresi,
                    'cm',
                    Icons.accessibility_new_outlined,
                    Colors.blueAccent,
                  ),
                  _buildGoalCard(
                    'Kol',
                    latest?.pazuCevresi,
                    null,
                    'cm',
                    Icons.fitness_center_outlined,
                    Colors.purpleAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Hedef Belirleme Bölümü
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
                  onPressed: () => _showGoalModal(context, state.goal),
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: AppColors.primary,
                    size: 18,
                  ),
                  label: const Text(
                    'Düzenle',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (state.goal != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.cardDark.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    if (state.goal!.hedefAgirlik > 0) ...[
                      _buildGoalProgressBar(
                        'Ağırlık',
                        latest?.agirlik ?? 0,
                        state.goal!.hedefAgirlik,
                        'kg',
                      ),
                      const SizedBox(height: 12),
                    ],
                    if (state.goal!.hedefVucutYuzdesi != null &&
                        state.goal!.hedefVucutYuzdesi! > 0) ...[
                      _buildGoalProgressBar(
                        'Yağ Oranı',
                        latest?.vucutYuzdesi ?? 0,
                        state.goal!.hedefVucutYuzdesi!,
                        '%',
                      ),
                      const SizedBox(height: 12),
                    ],
                    if (state.goal!.hedefBelCevresi != null &&
                        state.goal!.hedefBelCevresi! > 0) ...[
                      _buildGoalProgressBar(
                        'Bel Çevresi',
                        latest?.belCevresi ?? 0,
                        state.goal!.hedefBelCevresi!,
                        'cm',
                      ),
                    ],
                  ],
                ),
              ),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.track_changes, color: Colors.white54, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Henüz hedef belirlemediniz',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () => _showGoalModal(context, null),
                      child: const Text(
                        'Hedef Belirle',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),

            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildMetricChip('Ağırlık'),
                  const SizedBox(width: 8),
                  _buildMetricChip('Boy'),
                  const SizedBox(width: 8),
                  _buildMetricChip('Yağ Oranı'),
                  const SizedBox(width: 8),
                  _buildMetricChip('Bel'),
                  const SizedBox(width: 8),
                  _buildMetricChip('Kol'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Chart Section
            Text(
              'İlerleme Grafiği',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardDark.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  // Header with metric name and period selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _getMetricLabel(_selectedMetric),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          _buildPeriodChip('1A'),
                          const SizedBox(width: 6),
                          _buildPeriodChip('3A'),
                          const SizedBox(width: 6),
                          _buildPeriodChip('6A'),
                          const SizedBox(width: 6),
                          _buildPeriodChip('Tümü'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 220,
                    child: sortedMeasurements.isEmpty
                        ? const Center(
                            child: Text(
                              'Henüz veri yok',
                              style: TextStyle(color: Colors.white54),
                            ),
                          )
                        : _buildLineChart(
                            _getFilteredMeasurements(sortedMeasurements),
                          ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // History listesi
            const Text(
              'Geçmiş Ölçümler',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: ListView(children: [historyList(ref, sortedMeasurements)]),
            ),
          ],
        ),
      ),
    );
  }

  LineChart _buildLineChart(List<BodyMeasurement> sortedMeasurements) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: Colors.white10, strokeWidth: 1),
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 &&
                    value.toInt() < sortedMeasurements.length) {
                  final index = sortedMeasurements.length - 1 - value.toInt();
                  final date = sortedMeasurements[index].tarih;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      DateFormat('MMM', 'tr_TR').format(date),
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
              interval: (sortedMeasurements.length / 6).ceil().toDouble(),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(color: Colors.white54, fontSize: 10),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: _getMetricSpots(sortedMeasurements),
            isCurved: true,
            color: const Color(0xFF13EC5B),
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: const Color(0xFF13EC5B).withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _getMetricSpots(List<BodyMeasurement> sortedMeasurements) {
    final spots = <FlSpot>[];

    for (int i = 0; i < sortedMeasurements.length; i++) {
      final reversedIndex = sortedMeasurements.length - 1 - i;
      final measurement = sortedMeasurements[reversedIndex];
      double? value;

      switch (_selectedMetric) {
        case 'Ağırlık':
          value = measurement.agirlik;
          break;
        case 'Boy':
          value = measurement.boy;
          break;
        case 'Yağ Oranı':
          value = measurement.vucutYuzdesi;
          break;
        case 'Bel':
          value = measurement.belCevresi;
          break;
        case 'Kol':
          value = measurement.pazuCevresi;
          break;
      }

      if (value != null && value > 0) {
        spots.add(FlSpot(i.toDouble(), value));
      }
    }

    return spots;
  }

  Widget _buildMetricChip(String metric) {
    final isSelected = _selectedMetric == metric;
    return GestureDetector(
      onTap: () => setState(() => _selectedMetric = metric),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF13EC5B)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF13EC5B)
                : Colors.white.withOpacity(0.1),
          ),
        ),
        child: Text(
          metric,
          style: TextStyle(
            color: isSelected ? const Color(0xFF102216) : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  ListView historyList(
    WidgetRef ref,
    List<BodyMeasurement> sortedMeasurements,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: sortedMeasurements.length,
      itemBuilder: (context, index) {
        final m = sortedMeasurements[index];

        return Slidable(
          key: ValueKey(m.id),

          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => _showDeleteDialog(context, ref, m),
                backgroundColor: AppColors.red400,
                foregroundColor: Colors.white,
                icon: Icons.delete_outline,
                label: "Sil",
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),

          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => _openEditSheet(context, ref, m),
                backgroundColor: AppColors.primary,
                foregroundColor: const Color(0xFF102216),
                icon: Icons.edit_outlined,
                label: "Düzenle",
                borderRadius: BorderRadius.circular(12),
              ),
            ],
          ),

          child: _historyCard(m),
        );
      },
    );
  }

  Container _historyCard(BodyMeasurement m) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('d MMMM yyyy', 'tr_TR').format(m.tarih),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${m.agirlik} kg',
                    style: const TextStyle(
                      color: Color(0xFF13EC5B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 4,
            children: [
              if (m.boy > 0)
                _buildInfoChip('Boy: ${m.boy.toStringAsFixed(0)} cm'),
              if (m.vucutYuzdesi != null)
                _buildInfoChip('Yağ: %${m.vucutYuzdesi}'),
              if (m.kasKutlesi != null)
                _buildInfoChip('Kas: ${m.kasKutlesi} kg'),
              if (m.belCevresi != null)
                _buildInfoChip('Bel: ${m.belCevresi} cm'),
              if (m.gogusCevresi != null)
                _buildInfoChip('Göğüs: ${m.gogusCevresi} cm'),
              if (m.kalcaCevresi != null)
                _buildInfoChip('Kalça: ${m.kalcaCevresi} cm'),
              if (m.pazuCevresi != null)
                _buildInfoChip('Kol: ${m.pazuCevresi} cm'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodChip(String period) {
    final isSelected = _selectedPeriod == period;
    return GestureDetector(
      onTap: () => setState(() => _selectedPeriod = period),
      child: Container(
        height: 28,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF13EC5B).withOpacity(0.3)
              : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            period,
            style: TextStyle(
              color: isSelected ? const Color(0xFF13EC5B) : Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  String _getMetricLabel(String metric) {
    switch (metric) {
      case 'Ağırlık':
        return 'Ağırlık (kg)';
      case 'Boy':
        return 'Boy (cm)';
      case 'Yağ Oranı':
        return 'Yağ Oranı (%)';
      case 'Bel':
        return 'Bel Çevresi (cm)';
      case 'Kol':
        return 'Kol Çevresi (cm)';
      default:
        return metric;
    }
  }

  List<BodyMeasurement> _getFilteredMeasurements(
    List<BodyMeasurement> measurements,
  ) {
    if (_selectedPeriod == 'Tümü') return measurements;

    final now = DateTime.now();
    int months;

    switch (_selectedPeriod) {
      case '1A':
        months = 1;
        break;
      case '3A':
        months = 3;
        break;
      case '6A':
        months = 6;
        break;
      default:
        return measurements;
    }

    final cutoffDate = DateTime(now.year, now.month - months, now.day);
    return measurements.where((m) => m.tarih.isAfter(cutoffDate)).toList();
  }

  Widget _buildGoalCard(
    String title,
    double? currentValue,
    double? goalValue,
    String unit,
    IconData icon,
    Color color,
  ) {
    final hasGoal = goalValue != null && goalValue > 0;
    final difference = hasGoal && currentValue != null
        ? currentValue - goalValue
        : null;

    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardDark.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            currentValue != null
                ? '${currentValue.toStringAsFixed(1)} $unit'
                : '-',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          if (hasGoal && difference != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  difference > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: difference > 0 ? Colors.redAccent : Colors.greenAccent,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    difference > 0
                        ? '+${difference.abs().toStringAsFixed(1)} $unit'
                        : '-${difference.abs().toStringAsFixed(1)} $unit',
                    style: TextStyle(
                      color: difference > 0
                          ? Colors.redAccent
                          : Colors.greenAccent,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70, fontSize: 11),
      ),
    );
  }

  void _showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    BodyMeasurement m,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF1A2F1F),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: AppColors.red400,
              size: 28,
            ),
            SizedBox(width: 12),
            Text(
              "Ölçümü Sil",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          "${DateFormat('d MMMM yyyy', 'tr_TR').format(m.tarih)} tarihli ölçümü silmek istediğinize emin misiniz?",
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text("İptal", style: TextStyle(color: Colors.white70)),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await ref
                  .read(bodyMeasurementProvider.notifier)
                  .deleteMeasurement(m.id);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("Ölçüm silindi"),
                    backgroundColor: AppColors.red400,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red400,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Sil"),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalProgressBar(
    String title,
    double currentValue,
    double goalValue,
    String unit,
  ) {
    final isDecreasing = currentValue > goalValue;
    final difference = (currentValue - goalValue).abs();
    final progress = isDecreasing
        ? ((currentValue - goalValue) / currentValue).clamp(0.0, 1.0)
        : ((goalValue - currentValue) / goalValue).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$title Hedefi',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mevcut',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
                Text(
                  '${currentValue.toStringAsFixed(1)} $unit',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Hedef',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
                Text(
                  '${goalValue.toStringAsFixed(1)} $unit',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            minHeight: 10,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kalan: ${difference.toStringAsFixed(1)} $unit',
              style: const TextStyle(color: Colors.white60, fontSize: 11),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showGoalModal(BuildContext context, BodyMeasurementGoal? currentGoal) {
    final weightController = TextEditingController(
      text: currentGoal?.hedefAgirlik.toString() ?? '',
    );
    final fatController = TextEditingController(
      text: currentGoal?.hedefVucutYuzdesi?.toString() ?? '',
    );
    final waistController = TextEditingController(
      text: currentGoal?.hedefBelCevresi?.toString() ?? '',
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
                weightController,
                'Hedef Ağırlık (kg)',
                Icons.monitor_weight,
              ),
              const SizedBox(height: 16),
              buildTextField(
                fatController,
                'Hedef Yağ Oranı (%)',
                Icons.water_drop,
              ),
              const SizedBox(height: 16),
              buildTextField(
                waistController,
                'Hedef Bel Çevresi (cm)',
                Icons.accessibility_new,
              ),
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
                    final goal = BodyMeasurementGoal()
                      ..kullaniciId = 1
                      ..hedefAgirlik =
                          double.tryParse(weightController.text) ?? 0
                      ..hedefVucutYuzdesi = double.tryParse(fatController.text)
                      ..hedefBelCevresi = double.tryParse(waistController.text)
                      ..sonGuncellemeTarihi = DateTime.now();

                    if (currentGoal != null) {
                      goal.id = currentGoal.id;
                    }

                    await ref
                        .read(bodyMeasurementProvider.notifier)
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

  void _openEditSheet(BuildContext context, WidgetRef ref, BodyMeasurement m) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MeasurementEditScreen(measurement: m),
      ),
    );
  }
}
