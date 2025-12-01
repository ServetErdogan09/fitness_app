import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/features/tracking/provider/workout_sessions_notifier.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:intl/intl.dart';

// Performance tracking class
class ExercisePerformance {
  final String exerciseName;
  final int plannedSets;
  final int completedSets;
  final double plannedReps;
  final double completedReps;

  ExercisePerformance({
    required this.exerciseName,
    required this.plannedSets,
    required this.completedSets,
    required this.plannedReps,
    required this.completedReps,
  });

  double get setCompletionRate =>
      plannedSets > 0 ? (completedSets / plannedSets) : 0.0;
  double get repCompletionRate =>
      plannedReps > 0 ? (completedReps / plannedReps) : 0.0;
  double get overallScore => (setCompletionRate + repCompletionRate) / 2;

  Color get performanceColor {
    if (overallScore >= 0.9) return const Color(0xFF13ec49); // Green
    if (overallScore >= 0.7) return const Color(0xFFf59e0b); // Orange
    return const Color(0xFFef4444); // Red
  }

  String get performanceLabel {
    if (overallScore >= 0.9) return 'Mükemmel';
    if (overallScore >= 0.7) return 'İyi';
    return 'Geliştirilmeli';
  }
}

class DiscoverAnalyticsView extends ConsumerStatefulWidget {
  const DiscoverAnalyticsView({super.key});

  @override
  ConsumerState<DiscoverAnalyticsView> createState() =>
      _DiscoverAnalyticsViewState();
}

class _DiscoverAnalyticsViewState extends ConsumerState<DiscoverAnalyticsView> {
  WorkoutPlan? _selectedPlan;
  List<ExerciseLog> _planLogs = [];
  List<PlanExercise> _planExercises = [];
  Map<String, ExercisePerformance> _performanceMap = {};
  bool _isLoading = false;
  String _volumeTimeRange = '1M';
  String? _selectedExerciseForProgress;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadInitialData();
    });
  }

  Future<void> _loadInitialData() async {
    final workoutState = ref.read(workoutProvider);
    if (workoutState.activePlans.isNotEmpty) {
      setState(() {
        _selectedPlan = workoutState.activePlans.first;
      });
      await _loadPlanData();
    }
  }

  Future<void> _loadPlanData() async {
    if (_selectedPlan == null) return;

    setState(() {
      _isLoading = true;
    });

    final logs = await ref
        .read(workoutProvider.notifier)
        .getLogsForPlan(_selectedPlan!.id);

    // Fetch plan exercises
    final exercises = await ref
        .read(workoutProvider.notifier)
        .getPlanExercises(_selectedPlan!.id);

    // Calculate performance for each exercise
    final performanceMap = <String, ExercisePerformance>{};
    for (final exercise in exercises) {
      final exerciseLogs = logs
          .where((l) => l.exerciseName == exercise.exerciseName)
          .toList();

      if (exerciseLogs.isNotEmpty) {
        // Count unique sets (by setNumber)
        final completedSets = exerciseLogs
            .map((l) => l.setNumber)
            .toSet()
            .length;

        // Calculate average reps
        final totalReps = exerciseLogs.fold<int>(0, (sum, l) => sum + l.reps);
        final avgReps = totalReps / exerciseLogs.length;

        // Parse planned values
        final plannedSets = int.tryParse(exercise.setCount) ?? 0;
        final plannedReps = double.tryParse(exercise.repCount) ?? 0.0;

        performanceMap[exercise.exerciseName] = ExercisePerformance(
          exerciseName: exercise.exerciseName,
          plannedSets: plannedSets,
          completedSets: completedSets,
          plannedReps: plannedReps,
          completedReps: avgReps,
        );
      }
    }

    setState(() {
      _planLogs = logs;
      _planExercises = exercises;
      _performanceMap = performanceMap;
      _isLoading = false;
      // Reset selected exercise if it's not in the new logs
      if (_selectedExerciseForProgress != null) {
        final hasExercise = logs.any(
          (l) => l.exerciseName == _selectedExerciseForProgress,
        );
        if (!hasExercise) {
          _selectedExerciseForProgress = null;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final workoutState = ref.watch(workoutProvider);
    final plans = workoutState.activePlans;

    if (plans.isEmpty) {
      return _buildNoPlansState();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgramSelector(plans),
          const SizedBox(height: 24),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF13ec49)),
            )
          else if (_planLogs.isEmpty)
            _buildEmptyState()
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryCards(),
                const SizedBox(height: 24),
                if (_performanceMap.isNotEmpty) ...[
                  _buildPerformanceSummary(),
                  const SizedBox(height: 24),
                ],
                _buildSectionTitle('Haftalık Antrenman Sıklığı'),
                const SizedBox(height: 16),
                _buildWeeklyFrequencyChart(),
                const SizedBox(height: 24),
                _buildVolumeSection(),
                const SizedBox(height: 24),
                _buildSectionTitle('En Çok Yapılan Egzersizler'),
                const SizedBox(height: 16),
                _buildTopExercisesChart(),
                const SizedBox(height: 24),
                if (_performanceMap.isNotEmpty) ...[
                  _buildExercisePerformanceSection(),
                  const SizedBox(height: 24),
                ],
                _buildExerciseProgressSection(),
                const SizedBox(height: 80),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildNoPlansState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.fitness_center,
            size: 80,
            color: const Color(0xFF9CA3AF).withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          const Text(
            'Henüz Program Yok',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Analizleri görmek için önce bir program oluştur.',
            style: TextStyle(
              color: Color(0xFF9CA3AF),
              fontSize: 14,
              fontFamily: 'Lexend',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Icon(
              Icons.analytics_outlined,
              size: 60,
              color: const Color(0xFF9CA3AF).withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'Bu program için henüz veri yok',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Antrenman yaptıkça grafikler burada görünecek.',
              style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgramSelector(List<WorkoutPlan> plans) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<WorkoutPlan>(
          value: _selectedPlan,
          isExpanded: true,
          dropdownColor: const Color(0xFF1C1C1E),
          icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF13ec49)),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Lexend',
          ),
          items: plans.map((plan) {
            return DropdownMenuItem(value: plan, child: Text(plan.planName));
          }).toList(),
          onChanged: (WorkoutPlan? newValue) {
            if (newValue != null) {
              setState(() {
                _selectedPlan = newValue;
              });
              _loadPlanData();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lexend',
      ),
    );
  }

  Widget _buildSummaryCards() {
    final sessionIds = _planLogs.map((l) => l.sessionId).toSet();
    final totalWorkouts = sessionIds.length;

    double totalVolume = 0;
    for (var log in _planLogs) {
      totalVolume += log.weight * log.reps;
    }

    return Row(
      children: [
        Expanded(
          child: _buildInfoCard(
            title: 'Toplam\nAntrenman',
            value: '$totalWorkouts',
            icon: Icons.fitness_center,
            color: const Color(0xFF13ec49),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildInfoCard(
            title: 'Toplam\nHacim',
            value: '${(totalVolume / 1000).toStringAsFixed(1)}k kg',
            icon: Icons.bar_chart,
            color: const Color(0xFF0ea5e9),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
              fontFamily: 'Lexend',
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyFrequencyChart() {
    // We need session dates. Since logs don't have session date directly,
    // we rely on the fact that we fetched logs for specific sessions.
    // However, to get dates, we need the sessions themselves.
    // For now, let's fetch sessions from provider history that match the plan.
    final history = ref.read(workoutProvider).history;
    final planSessions = history
        .where((s) => s.workoutPlanId == _selectedPlan?.id)
        .toList();

    final now = DateTime.now();
    final last7Days = List.generate(7, (index) {
      return now.subtract(Duration(days: 6 - index));
    });

    final counts = last7Days.map((date) {
      return planSessions.where((session) {
        return session.startTime.year == date.year &&
            session.startTime.month == date.month &&
            session.startTime.day == date.day;
      }).length;
    }).toList();

    final maxCount =
        counts.fold<int>(0, (p, c) => p > c ? p : c).toDouble() + 1;

    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxCount,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => const Color(0xFF27272A),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  rod.toY.toInt().toString(),
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= last7Days.length)
                    return const SizedBox();
                  final date = last7Days[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      DateFormat('E', 'tr_TR').format(date),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 12,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  );
                },
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: counts.asMap().entries.map((entry) {
            final index = entry.key;
            final count = entry.value;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: count.toDouble(),
                  color: const Color(0xFF13ec49),
                  width: 16,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: maxCount,
                    color: Colors.white.withOpacity(0.05),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildVolumeSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Hacim İlerlemesi'),
            _buildTimeRangeSelector(),
          ],
        ),
        const SizedBox(height: 16),
        _buildVolumeTrendChart(),
      ],
    );
  }

  Widget _buildTimeRangeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: ['1W', '1M', '3M'].map((range) {
          final isSelected = _volumeTimeRange == range;
          return GestureDetector(
            onTap: () {
              setState(() {
                _volumeTimeRange = range;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF13ec49).withOpacity(0.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                range,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF13ec49)
                      : Colors.white.withOpacity(0.5),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildVolumeTrendChart() {
    // 1. Group logs by session ID
    final logsBySession = <int, List<ExerciseLog>>{};
    for (var log in _planLogs) {
      if (!logsBySession.containsKey(log.sessionId)) {
        logsBySession[log.sessionId] = [];
      }
      logsBySession[log.sessionId]!.add(log);
    }

    // 2. Calculate volume per session and map to date
    final history = ref.read(workoutProvider).history;
    final dataPoints = <FlSpot>[];
    int index = 0;

    final now = DateTime.now();
    final cutoffDate = now.subtract(
      _volumeTimeRange == '1W'
          ? const Duration(days: 7)
          : _volumeTimeRange == '1M'
          ? const Duration(days: 30)
          : const Duration(days: 90),
    );

    final sortedSessions =
        history
            .where(
              (s) =>
                  s.workoutPlanId == _selectedPlan?.id &&
                  s.startTime.isAfter(cutoffDate),
            )
            .toList()
          ..sort((a, b) => a.startTime.compareTo(b.startTime));

    for (var session in sortedSessions) {
      final sessionLogs = logsBySession[session.id] ?? [];
      double volume = 0;
      for (var log in sessionLogs) {
        volume += log.weight * log.reps;
      }
      if (volume > 0) {
        dataPoints.add(FlSpot(index.toDouble(), volume));
        index++;
      }
    }

    if (dataPoints.isEmpty) {
      return Container(
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Text(
          'Bu aralıkta veri yok',
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontFamily: 'Lexend',
          ),
        ),
      );
    }

    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1000,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.white.withOpacity(0.05),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints,
              isCurved: true,
              color: const Color(0xFF0ea5e9),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF0ea5e9).withOpacity(0.3),
                    const Color(0xFF0ea5e9).withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopExercisesChart() {
    // Aggregate logs by exercise name
    final exerciseCounts = <String, int>{};
    for (var log in _planLogs) {
      exerciseCounts[log.exerciseName] =
          (exerciseCounts[log.exerciseName] ?? 0) + 1;
    }

    if (exerciseCounts.isEmpty) return const SizedBox();

    final sortedEntries = exerciseCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final top4 = sortedEntries.take(4).toList();
    final total = top4.fold<int>(0, (sum, e) => sum + e.value);

    final colors = [
      const Color(0xFF13ec49),
      const Color(0xFF0ea5e9),
      const Color(0xFFa855f7),
      const Color(0xFFeab308),
    ];

    final sections = top4.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final percentage = (item.value / total * 100).round();

      return PieChartSectionData(
        color: colors[index % colors.length],
        value: item.value.toDouble(),
        title: '$percentage%',
        radius: 50,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Lexend',
        ),
      );
    }).toList();

    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(enabled: true),
                borderData: FlBorderData(show: false),
                sectionsSpace: 2,
                centerSpaceRadius: 40,
                sections: sections,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: top4.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _buildLegendItem(
                  item.key,
                  colors[index % colors.length],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String title, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 100, // Limit width for long names
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
              fontFamily: 'Lexend',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExerciseProgressSection() {
    // Get unique exercise names
    final exercises = _planLogs.map((l) => l.exerciseName).toSet().toList()
      ..sort();

    if (exercises.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Egzersiz Gelişimi'),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedExerciseForProgress ?? exercises.first,
              isExpanded: true,
              dropdownColor: const Color(0xFF1C1C1E),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF13ec49),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Lexend',
              ),
              items: exercises.map((ex) {
                return DropdownMenuItem(value: ex, child: Text(ex));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedExerciseForProgress = newValue;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildExerciseProgressChart(
          _selectedExerciseForProgress ?? exercises.first,
        ),
      ],
    );
  }

  Widget _buildExerciseProgressChart(String exerciseName) {
    // Filter logs for this exercise
    final exerciseLogs = _planLogs
        .where((l) => l.exerciseName == exerciseName)
        .toList();

    // We need to associate logs with dates.
    // Since logs don't have dates, we match by session ID to history.
    final history = ref.read(workoutProvider).history;
    final sessionDateMap = {for (var s in history) s.id: s.startTime};

    // Create data points: (Date, Max Weight for that session)
    final progressData = <MapEntry<DateTime, double>>[];

    // Group by session
    final logsBySession = <int, List<ExerciseLog>>{};
    for (var log in exerciseLogs) {
      if (!logsBySession.containsKey(log.sessionId)) {
        logsBySession[log.sessionId] = [];
      }
      logsBySession[log.sessionId]!.add(log);
    }

    logsBySession.forEach((sessionId, logs) {
      final date = sessionDateMap[sessionId];
      if (date != null) {
        // Find max weight lifted in this session for this exercise
        final maxWeight = logs.fold<double>(
          0,
          (max, log) => log.weight > max ? log.weight : max,
        );
        progressData.add(MapEntry(date, maxWeight));
      }
    });

    // Sort by date
    progressData.sort((a, b) => a.key.compareTo(b.key));

    if (progressData.isEmpty) {
      return const SizedBox();
    }

    // Calculate stats
    final startWeight = progressData.first.value;
    final currentWeight = progressData.last.value;
    final improvement = currentWeight - startWeight;

    final spots = progressData.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.value);
    }).toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                'Başlangıç',
                '${startWeight.toStringAsFixed(1)} kg',
              ),
              _buildStatItem('Şu An', '${currentWeight.toStringAsFixed(1)} kg'),
              _buildStatItem(
                'Gelişim',
                '${improvement > 0 ? '+' : ''}${improvement.toStringAsFixed(1)} kg',
                color: improvement >= 0 ? const Color(0xFF13ec49) : Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.white.withOpacity(0.05),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: const Color(0xFF13ec49),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: const Color(0xFF13ec49),
                          strokeWidth: 2,
                          strokeColor: Colors.black,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF13ec49).withOpacity(0.3),
                          const Color(0xFF13ec49).withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, {Color? color}) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color ?? Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lexend',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 12,
            fontFamily: 'Lexend',
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceSummary() {
    // Calculate overall performance
    if (_performanceMap.isEmpty) return const SizedBox();

    final performances = _performanceMap.values.toList();
    final avgScore =
        performances.fold<double>(0, (sum, p) => sum + p.overallScore) /
        performances.length;

    final scorePercentage = (avgScore * 100).round();
    Color scoreColor;
    String scoreLabel;

    if (avgScore >= 0.9) {
      scoreColor = const Color(0xFF13ec49);
      scoreLabel = 'Mükemmel! 💪';
    } else if (avgScore >= 0.7) {
      scoreColor = const Color(0xFFf59e0b);
      scoreLabel = 'İyi gidiyorsun! 👍';
    } else {
      scoreColor = const Color(0xFFef4444);
      scoreLabel = 'Geliştirebilirsin! 💡';
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scoreColor.withOpacity(0.1), scoreColor.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scoreColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: scoreColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.analytics_outlined,
                  color: scoreColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Plan Uyum Skoru',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      scoreLabel,
                      style: TextStyle(
                        color: scoreColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '$scorePercentage%',
                style: TextStyle(
                  color: scoreColor,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: avgScore,
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(scoreColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExercisePerformanceSection() {
    if (_performanceMap.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Egzersiz Performans Detayları'),
        const SizedBox(height: 16),
        ..._performanceMap.values.map((performance) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildExercisePerformanceCard(performance),
          );
        }),
      ],
    );
  }

  Widget _buildExercisePerformanceCard(ExercisePerformance performance) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: performance.performanceColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  performance.exerciseName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: performance.performanceColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  performance.performanceLabel,
                  style: TextStyle(
                    color: performance.performanceColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildPerformanceMetric(
            label: 'Set',
            planned: performance.plannedSets,
            completed: performance.completedSets,
            rate: performance.setCompletionRate,
          ),
          const SizedBox(height: 12),
          _buildPerformanceMetric(
            label: 'Tekrar (Ort.)',
            planned: performance.plannedReps.round(),
            completed: performance.completedReps.round(),
            rate: performance.repCompletionRate,
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetric({
    required String label,
    required int planned,
    required int completed,
    required double rate,
  }) {
    final percentage = (rate * 100).round();
    Color barColor;

    if (rate >= 0.9) {
      barColor = const Color(0xFF13ec49);
    } else if (rate >= 0.7) {
      barColor = const Color(0xFFf59e0b);
    } else {
      barColor = const Color(0xFFef4444);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
            ),
            Text(
              '$completed/$planned ($percentage%)',
              style: TextStyle(
                color: barColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: rate.clamp(0.0, 1.0),
            minHeight: 6,
            backgroundColor: Colors.white.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
          ),
        ),
      ],
    );
  }
}
