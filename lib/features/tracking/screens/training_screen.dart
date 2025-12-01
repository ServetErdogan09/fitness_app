import 'package:fitness_app/features/tracking/provider/workout_sessions_notifier.dart';
import 'package:fitness_app/features/tracking/widgets/create_program_bottom_sheet.dart';
import 'package:fitness_app/features/tracking/widgets/program_calendar_dialog.dart';
import 'package:fitness_app/features/tracking/widgets/program_calendar_view.dart';
import 'package:fitness_app/features/tracking/widgets/discover_analytics_view.dart';
import 'package:fitness_app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:go_router/go_router.dart';

class TrainingScreen extends ConsumerStatefulWidget {
  const TrainingScreen({super.key});

  @override
  ConsumerState<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends ConsumerState<TrainingScreen> {
  int _selectedTabIndex = 0;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Load active plans when screen initializes
    Future.microtask(
      () => ref.read(workoutProvider.notifier).loadActivePlans(),
    );
  }

  List<DateTime> _getWeekDates() {
    final now = DateTime.now();
    final weekday = now.weekday;
    final monday = now.subtract(Duration(days: weekday - 1));
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  String _getDayName(int weekday) {
    const days = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
    return days[weekday - 1];
  }

  bool _hasWorkoutOnDay(DateTime date, List<WorkoutPlan> plans) {
    final dayName = _getDayName(date.weekday);
    return plans.any((plan) => plan.days.any((day) => day.name == dayName));
  }

  void _showCreateProgramBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CreateProgramBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final workoutState = ref.watch(workoutProvider);
    final activePlans = workoutState.activePlans;

    return Scaffold(
      backgroundColor: const Color(0xFF102215),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Antrenman Programlarım',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                    height: 48,
                    child: Icon(Icons.settings, color: Color(0xFF9CA3AF)),
                  ),
                ],
              ),
            ),

            // Tabs
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFF27272A), width: 1),
                ),
              ),
              child: Row(
                children: [
                  _buildTab('Programlarım', 0),
                  _buildTab('Keşfet', 1),
                  _buildTab('Takvim', 2),
                ],
              ),
            ),

            // Content based on selected tab
            Expanded(
              child: _selectedTabIndex == 0
                  ? _buildProgramsTab(workoutState, activePlans)
                  : _selectedTabIndex == 1
                  ? _buildDiscoverTab()
                  : _buildCalendarTab(activePlans),
            ),
          ],
        ),
      ),
      floatingActionButton: _selectedTabIndex == 0
          ? FloatingActionButton(
              onPressed: _showCreateProgramBottomSheet,
              backgroundColor: const Color(0xFF13ec49),
              child: const Icon(Icons.add, color: Color(0xFF102215), size: 32),
            )
          : null,
    );
  }

  Widget _buildProgramsTab(
    WorkoutState workoutState,
    List<WorkoutPlan> activePlans,
  ) {
    return Column(
      children: [
        // Weekly Calendar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                final date = _getWeekDates()[index];
                final isSelected =
                    date.day == _selectedDate.day &&
                    date.month == _selectedDate.month;
                final hasWorkout = _hasWorkoutOnDay(date, activePlans);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = date;
                    });
                  },
                  child: Container(
                    width: 64,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF13ec49).withOpacity(0.2)
                          : const Color(0xFF27272A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getDayName(date.weekday),
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF9CA3AF),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF9CA3AF),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: hasWorkout
                                ? const Color(0xFF13ec49)
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Aktif Programların',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
          ),
        ),

        // Program Cards List
        Expanded(
          child: workoutState.isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Color(0xFF13ec49)),
                )
              : activePlans.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: activePlans.length,
                  itemBuilder: (context, index) {
                    return _buildProgramCard(activePlans[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildDiscoverTab() {
    return const DiscoverAnalyticsView();
  }

  Widget _buildCalendarTab(List<WorkoutPlan> plans) {
    if (plans.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today,
              size: 64,
              color: const Color(0xFF9CA3AF).withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'Takvim Görüntülenemiyor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Önce bir program oluşturmalısın.',
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

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        final history = ref.read(workoutProvider).history;
        final completedDates = history
            .where((s) => s.workoutPlanId == plan.id && s.endTime != null)
            .map((s) => s.startTime)
            .toList();

        return ProgramCalendarView(plan: plan, completedDates: completedDates);
      },
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected
                    ? const Color(0xFF13ec49)
                    : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF9CA3AF),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildProgramCard(WorkoutPlan plan) {
    // Calculate progress based on completed sessions this week
    final history = ref.watch(workoutProvider).history;
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final startOfWeek = DateTime(monday.year, monday.month, monday.day);
    final endOfWeek = startOfWeek.add(const Duration(days: 7));

    final completedSessionsThisWeek = history.where((session) {
      return session.workoutPlanId == plan.id &&
          session.startTime.isAfter(startOfWeek) &&
          session.startTime.isBefore(endOfWeek);
    }).length;

    final scheduledSessionsCount = plan.days.length;
    final progress = scheduledSessionsCount > 0
        ? (completedSessionsThisWeek / scheduledSessionsCount).clamp(0.0, 1.0)
        : 0.0;

    return GestureDetector(
      onTap: () {
        context.go(AppRoutes.activeWorkout, extra: plan);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF18181B).withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Image
            Container(
              height: 128,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF13ec49).withOpacity(0.3),
                    const Color(0xFF0ea5e9).withOpacity(0.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plan.planName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              plan.description ?? 'Tüm Vücut',
                              style: const TextStyle(
                                color: Color(0xFF9CA3AF),
                                fontSize: 16,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Ayarlar İkonu
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Color(0xFF9CA3AF),
                            ),
                            onPressed: () => _showProgramCalendar(plan),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Color(0xFF9CA3AF),
                            ),
                            onPressed: () =>
                                _workoutPlanDelete(plan), // Silme fonksiyonu
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Günler (Kompakt)
                  if (plan.days.isNotEmpty)
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: Color(0xFF9CA3AF),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            plan.days.map((d) => d.name).join(', '),
                            style: const TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 14,
                              fontFamily: 'Lexend',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  if (plan.days.isNotEmpty) const SizedBox(height: 16),

                  // Progress Bar
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'İlerleme',
                            style: TextStyle(
                              color: Color(0xFFD1D5DB),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lexend',
                            ),
                          ),
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(
                              color: Color(0xFFD1D5DB),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lexend',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(9999),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: const Color(0xFF374151),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Color(0xFF13ec49),
                          ),
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
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
              'Henüz Programın Yok',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'İlk programını oluşturmaya başla!',
              style: TextStyle(
                color: Color(0xFF9CA3AF),
                fontSize: 14,
                fontFamily: 'Lexend',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _showCreateProgramBottomSheet,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF13ec49),
                foregroundColor: const Color(0xFF102215),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Yeni Program Oluştur',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lexend',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _workoutPlanDelete(WorkoutPlan plan) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1C1C1E),
        title: const Text(
          'Programı Sil',
          style: TextStyle(color: Colors.white, fontFamily: 'LexendExa'),
        ),
        content: Text(
          '"${plan.planName}" programını silmek istediğinize emin misiniz?',
          style: const TextStyle(
            color: Color(0xFFD1D5DB),
            fontFamily: 'Lexend',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'İptal',
              style: TextStyle(color: Color(0xFF9CA3AF), fontFamily: 'Lexend'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(workoutProvider.notifier).deletePlan(plan.id);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text(
              'Sil',
              style: TextStyle(
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showProgramCalendar(WorkoutPlan plan) {
    final history = ref.read(workoutProvider).history;
    final completedDates = history
        .where((s) => s.workoutPlanId == plan.id && s.endTime != null)
        .map((s) => s.startTime)
        .toList();

    print('completedDates.length: ${completedDates.length}');

    showDialog(
      context: context,
      builder: (context) =>
          ProgramCalendarDialog(plan: plan, completedDates: completedDates),
    );
  }
}
