class Appointments {
  final String id;
  final String name;
  final DateTime time;
  final String type;
  final AppointmentType status;

  final AppointmentDuration duration;
  final AppointmentMode mode;

  Appointments({
    required this.id,
    required this.name,
    required this.time,
    required this.type,
    required this.status,
    required this.duration,
    required this.mode,
  });
}

enum AppointmentType { upcoming, completed, cancelled }

/// Short (15-30 mins) , Medium (30 mins - 1 hour) , Long (1+ hour)
enum AppointmentDuration { short, medium, long }

/// inperson - Offline or being present there
enum AppointmentMode { virtual, inperson }
