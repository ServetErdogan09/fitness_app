import 'package:flutter/material.dart';
import 'package:fitness_app/models/workout_session.dart';
import 'package:fitness_app/core/extensions/day_of_week.dart';

/// Ortak takvim grid widget'ı
/// Hem ProgramCalendarDialog hem de ProgramCalendarView tarafından kullanılır
class SharedCalendarGrid extends StatelessWidget {
  final WorkoutPlan plan;
  final List<DateTime> completedDates;
  final DateTime focusedDay;
  final DateTime startDate;
  final bool isCompact; // Dialog için compact, view için geniş

  const SharedCalendarGrid({
    super.key,
    required this.plan,
    required this.completedDates,
    required this.focusedDay,
    required this.startDate,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(
      focusedDay.year,
      focusedDay.month,
    );
    final firstDayOfMonth = DateTime(focusedDay.year, focusedDay.month, 1);
    final weekdayOffset = firstDayOfMonth.weekday - 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: daysInMonth + weekdayOffset,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: isCompact ? 8 : 12,
        crossAxisSpacing: isCompact ? 8 : 0,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        if (index < weekdayOffset) return const SizedBox.shrink();

        final day = index - weekdayOffset + 1;
        final date = DateTime(focusedDay.year, focusedDay.month, day);

        return _buildDayCell(date);
      },
    );
  }

  Widget _buildDayCell(DateTime date) {
    final dayEnum = date.toDayOfWeek;
    final isPlannedDay = plan.days.any((day) => day.name == dayEnum.shortTR);
    final isCompleted = _isCompleted(date);
    final isToday = DateUtils.isSameDay(date, DateTime.now());
    final isPast =
        date.isBefore(DateTime.now()) &&
        !isToday &&
        date.isAfter(startDate.subtract(const Duration(days: 1)));
    final isMissed = isPlannedDay && isPast && !isCompleted;
    final bool isFuture =
        date.isAfter(DateTime.now()) &&
        !DateUtils.isSameDay(date, DateTime.now());

    final bool isFreeWorkout = !isPlannedDay && isCompleted;

    Color bgColor;
    Color textColor;
    Color? borderColor;

    if (isFreeWorkout) {
      // Serbest çalışma
      bgColor = const Color(0xFFFFA500).withOpacity(0.2);
      textColor = const Color(0xFFFFA500);
    } else if (isCompleted) {
      // Tamamlandı
      bgColor = const Color(0xFF13ec49).withOpacity(0.2);
      textColor = const Color(0xFF13ec49);
    } else if (isMissed) {
      // Eksik
      bgColor = Colors.red.withOpacity(0.2);
      textColor = Colors.red;
    } else if (isPlannedDay) {
      // Planlanmış
      bgColor = const Color(0xFF3B82F6).withOpacity(0.2);
      textColor = const Color(0xFF3B82F6);
    } else {
      // Diğer günler
      bgColor = Colors.transparent;
      textColor = Colors.white.withOpacity(0.5);
    }

    if (isToday && !isCompleted) {
      borderColor = const Color(0xFF13ec49);
    }

    final cellSize = isCompact ? null : 32.0;

    return Center(
      child: Container(
        width: cellSize,
        height: cellSize,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          border: borderColor != null
              ? Border.all(color: borderColor, width: 1.5)
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          '${date.day}',
          style: TextStyle(
            color: textColor,
            fontWeight:
                (isCompleted || isToday || isPlannedDay || isFreeWorkout)
                ? FontWeight.bold
                : FontWeight.normal,
            fontSize: isCompact ? 14 : 14,
            fontFamily: 'Lexend',
          ),
        ),
      ),
    );
  }

  bool _isCompleted(DateTime date) {
    return completedDates.any(
      (completedDate) =>
          completedDate.year == date.year &&
          completedDate.month == date.month &&
          completedDate.day == date.day,
    );
  }
}

/// Takvim için legend (açıklama) widget'ı
class CalendarLegend extends StatelessWidget {
  final bool isCompact;

  const CalendarLegend({super.key, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      alignment: isCompact ? WrapAlignment.center : WrapAlignment.end,
      children: [
        _buildLegendItem(color: const Color(0xFF3B82F6), label: 'Planlanmış'),
        _buildLegendItem(color: const Color(0xFF13ec49), label: 'Tamamlandı'),
        _buildLegendItem(color: Colors.red, label: 'Eksik'),
        _buildLegendItem(color: const Color(0xFFFFA500), label: 'Serbest'),
      ],
    );
  }

  Widget _buildLegendItem({required Color color, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isCompact ? 12 : 8,
          height: isCompact ? 12 : 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: const Color(0xFF9CA3AF),
            fontSize: 12,
            fontFamily: 'Lexend',
          ),
        ),
      ],
    );
  }
}
