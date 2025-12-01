enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DayOfWeekExt on DayOfWeek {
  String get shortTR {
    switch (this) {
      case DayOfWeek.monday:
        return "Pzt";
      case DayOfWeek.tuesday:
        return "Sal";
      case DayOfWeek.wednesday:
        return "Çar";
      case DayOfWeek.thursday:
        return "Per";
      case DayOfWeek.friday:
        return "Cum";
      case DayOfWeek.saturday:
        return "Cmt";
      case DayOfWeek.sunday:
        return "Paz";
    }
  }

  String get fullTR {
    switch (this) {
      case DayOfWeek.monday:
        return "Pazartesi";
      case DayOfWeek.tuesday:
        return "Salı";
      case DayOfWeek.wednesday:
        return "Çarşamba";
      case DayOfWeek.thursday:
        return "Perşembe";
      case DayOfWeek.friday:
        return "Cuma";
      case DayOfWeek.saturday:
        return "Cumartesi";
      case DayOfWeek.sunday:
        return "Pazar";
    }
  }
}

extension DateTimeExt on DateTime {
  DayOfWeek get toDayOfWeek {
    switch (weekday) {
      case 1:
        return DayOfWeek.monday;
      case 2:
        return DayOfWeek.tuesday;
      case 3:
        return DayOfWeek.wednesday;
      case 4:
        return DayOfWeek.thursday;
      case 5:
        return DayOfWeek.friday;
      case 6:
        return DayOfWeek.saturday;
      case 7:
        return DayOfWeek.sunday;
      default:
        throw Exception("Invalid weekday");
    }
  }
}
