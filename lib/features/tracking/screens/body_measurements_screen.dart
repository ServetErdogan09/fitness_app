import 'package:fitness_app/config/app_themes.dart';
import 'package:fitness_app/features/tracking/provider/body_measurement_notifier.dart';
import 'package:fitness_app/features/tracking/screens/measurement_edit_screen.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bodyMeasurementProvider.notifier).loadMeasurements();
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
              _buildTextField(
                weightController,
                'Ağırlık (kg)',
                Icons.monitor_weight,
              ),
              const SizedBox(height: 12),
              _buildTextField(heightController, 'Boy (cm)', Icons.height),
              const SizedBox(height: 12),
              _buildTextField(fatController, 'Yağ Oranı (%)', Icons.water_drop),
              const SizedBox(height: 12),
              _buildTextField(
                muscleController,
                'Kas Kütlesi (kg)',
                Icons.fitness_center,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                waistController,
                'Bel Çevresi (cm)',
                Icons.accessibility_new,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                chestController,
                'Göğüs Çevresi (cm)',
                Icons.accessibility,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                hipController,
                'Kalça Çevresi (cm)',
                Icons.h_mobiledata,
              ),
              const SizedBox(height: 12),
              _buildTextField(
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

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
  ) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
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
            const SizedBox(height: 10),
            // kartlarım
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSummaryCard(
                    'Ağırlık',
                    '${latest?.agirlik.toStringAsFixed(1) ?? "-"} kg',
                    Icons.monitor_weight_outlined,
                    const Color(0xFF13EC5B),
                  ),
                  _buildSummaryCard(
                    'Boy',
                    '${latest?.boy.toStringAsFixed(0) ?? "-"} cm',
                    Icons.height,
                    Colors.cyanAccent,
                  ),
                  _buildSummaryCard(
                    'Yağ Oranı',
                    '${latest?.vucutYuzdesi?.toStringAsFixed(1) ?? "-"} %',
                    Icons.water_drop_outlined,
                    Colors.orangeAccent,
                  ),
                  _buildSummaryCard(
                    'Bel',
                    '${latest?.belCevresi?.toStringAsFixed(1) ?? "-"} cm',
                    Icons.accessibility_new_outlined,
                    Colors.blueAccent,
                  ),
                  _buildSummaryCard(
                    'Kol',
                    '${latest?.pazuCevresi?.toStringAsFixed(1) ?? "-"} cm',
                    Icons.fitness_center_outlined,
                    Colors.purpleAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Chart Section
            const Text(
              'İlerleme Grafiği',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 250,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: sortedMeasurements.isEmpty
                  ? const Center(
                      child: Text(
                        'Henüz veri yok',
                        style: TextStyle(color: Colors.white54),
                      ),
                    )
                  : linerChart(sortedMeasurements),
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

  LineChart linerChart(List<BodyMeasurement> sortedMeasurements) {
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
                      DateFormat('d MMM').format(date),
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
              interval: (sortedMeasurements.length / 5).ceil().toDouble(),
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
            spots: List.generate(sortedMeasurements.length, (index) {
              final reversedIndex = sortedMeasurements.length - 1 - index;
              return FlSpot(
                index.toDouble(),
                sortedMeasurements[reversedIndex].agirlik,
              );
            }),
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

          // 👉 Kart içeriği
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
        color: Colors.white.withOpacity(0.05),
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

  Widget _buildSummaryCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
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
              Text(
                title,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
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

  void _openEditSheet(BuildContext context, WidgetRef ref, BodyMeasurement m) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MeasurementEditScreen(measurement: m),
      ),
    );
  }
}
