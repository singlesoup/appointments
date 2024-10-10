import 'package:appointments/src/appoinments/data/appointments.dart';

class AppointmentFilters {
  AppointmentMode? mode;
  AppointmentDuration? duration;
  String? type;
  DateTime? startDate;
  DateTime? endDate;

  AppointmentFilters({
    this.mode,
    this.duration,
    this.type,
    this.startDate,
    this.endDate,
  });

  bool get isActive =>
      mode != null ||
      duration != null ||
      type != null ||
      startDate != null ||
      endDate != null;

  // Create a copy of the current filters
  AppointmentFilters copyWith({
    AppointmentMode? mode,
    AppointmentDuration? duration,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return AppointmentFilters(
      mode: mode ?? this.mode,
      duration: duration ?? this.duration,
      type: type ?? this.type,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  // Reset all filters
  void reset() {
    mode = null;
    duration = null;
    type = null;
    startDate = null;
    endDate = null;
  }
}
