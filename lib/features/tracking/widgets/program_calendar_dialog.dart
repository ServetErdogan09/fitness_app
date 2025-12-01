import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fitness_app/models/workout_session.dart';

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

            // Days of Week
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz']
                  .map(
                    (day) => Text(
                      day,
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

            // Calendar Grid
            _buildCalendarGrid(),

            const SizedBox(height: 16),

            // Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF13ec49),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Tamamlandı',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 12,
                    fontFamily: 'Lexend',
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Yapılacak Gün (Eksik)',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 12,
                    fontFamily: 'Lexend',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth = DateUtils.getDaysInMonth(
      _focusedDay.year,
      _focusedDay.month,
    );
    final firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    final weekdayOffset = firstDayOfMonth.weekday - 1; // Monday = 1

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: daysInMonth + weekdayOffset,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        if (index < weekdayOffset) return const SizedBox.shrink();

        final day = index - weekdayOffset + 1;
        final date = DateTime(_focusedDay.year, _focusedDay.month, day);
        final weekdayName = DateFormat('EEEE', 'tr_TR').format(date);
        final isPlannedDay = widget.plan.days.any(
          (d) => d.name.toLowerCase() == weekdayName.toLowerCase(),
        );
        final isCompleted = _isCompleted(date);
        final isToday = DateUtils.isSameDay(date, DateTime.now());

        print(
          isPlannedDay
              ? 'Planned Day: $date ($weekdayName)'
              : 'Not a Planned Day: $date ($weekdayName)',
        );

        Color bgColor;
        if (isCompleted) {
          bgColor = const Color(0xFF13ec49).withOpacity(0.2);
        } else if (isPlannedDay) {
          bgColor = Colors.red.withOpacity(0.2);
        } else {
          bgColor = const Color.fromARGB(255, 91, 87, 87).withOpacity(0.1);
        }

        return Container(
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            border: isToday
                ? Border.all(color: const Color(0xFF13ec49), width: 1)
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            '$day',
            style: TextStyle(
              color: isCompleted
                  ? const Color(0xFF13ec49)
                  : isPlannedDay
                  ? Colors.red
                  : Colors.white.withOpacity(0.5),
              fontWeight: isCompleted || isToday
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontFamily: 'Lexend',
            ),
          ),
        );
      },
    );
  }

  bool _isCompleted(DateTime date) {
    return widget.completedDates.any(
      (completedDate) =>
          completedDate.year == date.year &&
          completedDate.month == date.month &&
          completedDate.day == date.day,
    );
  }
}
