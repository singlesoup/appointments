import 'package:appointments/src/appoinments/data/appointments.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier;

class ApproinmentsProvider extends ChangeNotifier {
  final List<Appointments> _appointmentsList = [];
  List<Appointments> get appoinmentsList => _appointmentsList;

  final List<Appointments> _dummyAppointments = [
    Appointments(
      id: 'HH-1',
      name: 'General Check-up with Dr. Smith',
      time: DateTime.now().add(const Duration(hours: 1)), // Upcoming
      type: 'General',
      status: AppointmentType.upcoming,
      duration: AppointmentDuration.long,
      mode: AppointmentMode.virtual,
    ),
    Appointments(
      id: 'HH-2',
      name: 'Dentist Appointment with Dr. Adams',
      time: DateTime.now().add(const Duration(days: 3)), // Upcoming
      type: 'Dental',
      status: AppointmentType.upcoming,
      duration: AppointmentDuration.medium,
      mode: AppointmentMode.inperson,
    ),
    Appointments(
      id: 'HH-3',
      name: 'Eye Check-up with Dr. Patel',
      time: DateTime.now().subtract(const Duration(days: 2)), // Completed
      type: 'Optometry',
      status: AppointmentType.completed,
      duration: AppointmentDuration.short,
      mode: AppointmentMode.inperson,
    ),
    Appointments(
      id: 'HH-4',
      name: 'Orthopedic Consultation with Dr. Lee',
      time: DateTime.now().subtract(const Duration(days: 1)), // Cancelled
      type: 'Orthopedic',
      status: AppointmentType.cancelled,
      duration: AppointmentDuration.medium,
      mode: AppointmentMode.inperson,
    ),
    Appointments(
      id: 'HH-5',
      name: 'Cardiology Follow-up with Dr. Johnson',
      time: DateTime.now().add(const Duration(hours: 5)), // Upcoming
      type: 'Cardiology',
      status: AppointmentType.upcoming,
      duration: AppointmentDuration.long,
      mode: AppointmentMode.inperson,
    ),
    Appointments(
      id: 'HH-6',
      name: 'Dermatology Consultation with Dr. Brown',
      time: DateTime.now().subtract(const Duration(days: 4)), // Completed
      type: 'Dermatology',
      status: AppointmentType.completed,
      duration: AppointmentDuration.short,
      mode: AppointmentMode.virtual,
    ),
    Appointments(
      id: 'HH-7',
      name: 'Pediatric Visit with Dr. Miller',
      time: DateTime.now().add(const Duration(minutes: 90)), // Within 2 hours
      type: 'Pediatrics',
      status: AppointmentType.upcoming,
      duration: AppointmentDuration.long,
      mode: AppointmentMode.virtual,
    ),
    Appointments(
      id: 'HH-8',
      name: 'ENT Consultation with Dr. Wilson',
      time: DateTime.now().add(const Duration(days: 7)), // Upcoming
      type: 'ENT',
      status: AppointmentType.upcoming,
      duration: AppointmentDuration.long,
      mode: AppointmentMode.inperson,
    ),
    Appointments(
      id: 'HH-9',
      name: 'Neurology Check-up with Dr. Garcia',
      time: DateTime.now().subtract(const Duration(days: 10)), // Completed
      type: 'Neurology',
      status: AppointmentType.completed,
      duration: AppointmentDuration.long,
      mode: AppointmentMode.inperson,
    ),
    Appointments(
      id: 'HH-10',
      name: 'Gastroenterology Consultation with Dr. Martinez',
      time: DateTime.now().subtract(const Duration(days: 3)), // Cancelled
      type: 'Gastroenterology',
      status: AppointmentType.cancelled,
      duration: AppointmentDuration.medium,
      mode: AppointmentMode.inperson,
    ),
  ];

  //### Initialize appointments
  Future getAppointments() async {
    await Future.delayed(const Duration(milliseconds: 900), () {
      _appointmentsList.addAll(_dummyAppointments);
    });

    _filteredAppointments = _appointmentsList;
    notifyListeners();
  }

  //### For search results
  List<Appointments> _searchResults = [];
  List<Appointments> get searchResults => _searchResults;

  // Search function
  void searchAppointments(String query) {
    // If the query is empty, show all appointments
    if (query.isEmpty) {
      _searchResults = _appointmentsList;
    } else {
      // Filter appointments based on the name or type
      _searchResults = _appointmentsList.where((appointment) {
        return appointment.name.toLowerCase().contains(query.toLowerCase()) ||
            appointment.type.toLowerCase().contains(query.toLowerCase()) ||
            appointment.id.contains(query);
      }).toList();
    }

    // Notify listeners so the UI can update
    notifyListeners();
  }

  //### For Filters
  List<Appointments> _filteredAppointments = [];
  List<Appointments> get filteredAppointments => _filteredAppointments;

  // Filter by Status
  void filterByStatus(AppointmentType status) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.status == status;
    }).toList();
    notifyListeners();
  }

  // Filter by Type
  void filterByType(String type) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.type.toLowerCase() == type.toLowerCase();
    }).toList();
    notifyListeners();
  }

  // Filter by Mode
  void filterByMode(AppointmentMode mode) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.mode == mode;
    }).toList();
    notifyListeners();
  }

  // Filter by Duration
  void filterByDuration(AppointmentDuration duration) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.duration == duration;
    }).toList();
    notifyListeners();
  }

  // Filter by Date Range
  void filterByDateRange(DateTime startDate, DateTime endDate) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.time.isAfter(startDate) &&
          appointment.time.isBefore(endDate);
    }).toList();
    notifyListeners();
  }

  // // Filter by Time of Day
  // void filterByTimeOfDay(TimeOfDay startTime, TimeOfDay endTime) {
  //   _filteredAppointments = _appointmentsList.where((appointment) {
  //     final appointmentTime = TimeOfDay.fromDateTime(appointment.time);
  //     return (appointmentTime.hour >= startTime.hour &&
  //         appointmentTime.hour <= endTime.hour);
  //   }).toList();
  //   notifyListeners();
  // }

  // Apply multiple filters (Status, Type, Mode, Duration, etc.)
  void applyFilters({
    AppointmentType? status,
    String? type,
    AppointmentMode? mode,
    AppointmentDuration? duration,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      bool matchesStatus = status == null || appointment.status == status;
      bool matchesType =
          type == null || appointment.type.toLowerCase() == type.toLowerCase();
      bool matchesMode = mode == null || appointment.mode == mode;
      bool matchesDuration =
          duration == null || appointment.duration == duration;
      bool matchesDateRange = startDate == null ||
          endDate == null ||
          (appointment.time.isAfter(startDate) &&
              appointment.time.isBefore(endDate));

      return matchesStatus &&
          matchesType &&
          matchesMode &&
          matchesDuration &&
          matchesDateRange;
    }).toList();

    notifyListeners();
  }
}
