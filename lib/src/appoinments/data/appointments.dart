class Appointments {
  final String id;
  final String name;
  final DateTime time;
  final String type; // e.g 'General', 'Dental', 'ENT' etc
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

  // Check if appointment is within the next two hours
  bool get isWithinTwoHours {
    final now = DateTime.now();
    final difference = time.difference(now);

    // Return true if appointment is within next 2 hours
    // and hasn't already passed
    return difference.inHours >= 0 && difference.inHours < 2;
  }
}

enum AppointmentType { upcoming, completed, cancelled }

/// Short (15-30 mins) , Medium (30 mins - 1 hour) , Long (1+ hour)
enum AppointmentDuration { short, medium, long }

/// inperson - Offline or being present there
enum AppointmentMode { virtual, inperson }
