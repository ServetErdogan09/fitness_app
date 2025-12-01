import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:fitness_app/core/extensions/day_of_week.dart';
import 'package:fitness_app/features/tracking/widgets/shared_calendar_widget.dart';

class ProgramCalendarDialog extends StatefulWidget {
  final WorkoutPlan plan;
  final List<DateTime> completedDates;

  const ProgramCalendarDialog({
    super.key,
    required this.plan,
    required this.completedDates,
  });

  @override
  State<ProgramCalendarDialog> createState() => _ProgramCalendarDialogState();
}

class _ProgramCalendarDialogState extends State<ProgramCalendarDialog> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1C1C1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.plan.planName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF9CA3AF)),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Month Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        _focusedDay.month - 1,
                      );
                    });
                  },
                ),
                Text(
                  DateFormat('MMMM yyyy', 'tr_TR').format(_focusedDay),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lexend',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, color: Colors.white),
                  onPressed: () {
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
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: DayOfWeek.values
                  .map(
                    (d) => Text(
                      d.shortTR,
                      style: const TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 12,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 8),

            SharedCalendarGrid(
              plan: widget.plan,
              completedDates: widget.completedDates,
              focusedDay: _focusedDay,
              isCompact: true,
              startDate: widget.plan.creationDate,
            ),

            const SizedBox(height: 16),

            const CalendarLegend(isCompact: true),
          ],
        ),
      ),
    );
  }
}
