import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:fitness_app/features/tracking/widgets/shared_calendar_widget.dart';

class ProgramCalendarView extends StatefulWidget {
  final WorkoutPlan plan;
  final List<DateTime> completedDates;

  const ProgramCalendarView({
    super.key,
    required this.plan,
    required this.completedDates,
  });

  @override
  State<ProgramCalendarView> createState() => _ProgramCalendarViewState();
}

class _ProgramCalendarViewState extends State<ProgramCalendarView> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.plan.planName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('MMMM yyyy', 'tr_TR').format(_focusedDay),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 14,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  _buildNavButton(
                    icon: Icons.chevron_left,
                    onTap: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month - 1,
                        );
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  _buildNavButton(
                    icon: Icons.chevron_right,
                    onTap: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month + 1,
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Days of Week
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz']
                .map(
                  (day) => SizedBox(
                    width: 32,
                    child: Text(
                      day,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lexend',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 12),

          // Calendar Grid - Using shared widget
          SharedCalendarGrid(
            plan: widget.plan,
            completedDates: widget.completedDates,
            focusedDay: _focusedDay,
            isCompact: false,
            startDate: widget.plan.creationDate,
          ),

          const SizedBox(height: 20),

          const CalendarLegend(isCompact: false),
        ],
      ),
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
